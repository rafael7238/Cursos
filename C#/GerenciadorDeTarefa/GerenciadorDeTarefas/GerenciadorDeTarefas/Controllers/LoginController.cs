using GerenciadorDeTarefas.DTO;
using GerenciadorDeTarefas.Model;
using GerenciadorDeTarefas.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;


namespace GerenciadorDeTarefas.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController : BaseController
    {
        private readonly ILogger<LoginController> _logger;

        private readonly string login = "adminUser";
        private readonly string senha = "admin";

        public LoginController(ILogger<LoginController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult EfetuarLogin(LoginRequisicaoDTO requisicao)
        {
            try
            {
                if (requisicao.Login == null || requisicao.Senha == null || string.IsNullOrEmpty(requisicao.Login)
                    || string.IsNullOrEmpty(requisicao.Senha) || requisicao.Login != login || requisicao.Senha != senha)
                    return BadRequest(new ApiErrorResponse()
                    {
                        Status = StatusCodes.Status400BadRequest,
                        Erro = "Parametros de Entrada Inválido"
                    });
                // throw new Exception("Dados não foram enviados");


                var usuarioTeste = new Usuario()
                {
                    Id = 1,
                    Nome = "NomeToken",
                    Email = requisicao.Login,
                    Senha = requisicao.Senha
                };

                var token = TokenServices.CriarToken(usuarioTeste);

                return Ok(new LoginResposaDTO()
                {
                    Email = usuarioTeste.Email,
                    Nome = usuarioTeste.Nome,
                    Token = token
                });
            }
            catch (Exception e)
            {
                _logger.LogError($"Ocorreu erro ao efetuar Login: {e.Message}", e, requisicao);
                return this.StatusCode(StatusCodes.Status500InternalServerError, new ApiErrorResponse()
                {
                    Status = StatusCodes.Status500InternalServerError,
                    Erro = "Ocorreu erro ao efetuar login, tente novamente"
                });
            }
        }
    }
}

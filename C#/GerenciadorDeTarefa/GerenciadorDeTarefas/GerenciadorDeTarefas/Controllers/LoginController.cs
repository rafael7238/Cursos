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
using GerenciadorDeTarefas.Repository;
using GerenciadorDeTarefas.Utils;

namespace GerenciadorDeTarefas.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController : BaseController
    {
        private readonly ILogger<LoginController> _logger;
        private readonly IUsuarioRepository _usuarioRepository;

        public LoginController(ILogger<LoginController> logger, IUsuarioRepository usuarioRepository)
        {
            _logger = logger;
            _usuarioRepository = usuarioRepository;

        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult EfetuarLogin(LoginRequisicaoDTO requisicao)
        {
            try
            {
                if (requisicao.Login == null || requisicao.Senha == null || string.IsNullOrEmpty(requisicao.Login)
                    || string.IsNullOrEmpty(requisicao.Senha))
                    return BadRequest(new ApiErrorResponse()
                    {
                        Status = StatusCodes.Status400BadRequest,
                        Erro = "Parametros de Entrada Inválido"
                    });
                // throw new Exception("Dados não foram enviados");

                var usuario = _usuarioRepository.GetUsuarioByEmailSenha(requisicao.Login, MD5Hash.GerarHashMD5(requisicao.Senha));


                if (usuario == null)
                {
                    return BadRequest(new ApiErrorResponse()
                    {
                        Status = StatusCodes.Status400BadRequest,
                        Erro = "Usuário ou Senha Inválido"
                    });
                }

                var token = TokenServices.CriarToken(usuario);

                return Ok(new LoginResposaDTO()
                {
                    Email = usuario.Email,
                    Nome = usuario.Nome,
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

using GerenciadorDeTarefas.DTO;
using GerenciadorDeTarefas.Model;
using GerenciadorDeTarefas.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GerenciadorDeTarefas.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuarioController : BaseController
    {
        private readonly string login = "adminUser";

        private readonly string senha = "admin";

        private readonly ILogger<UsuarioController> _logger;

        private readonly IUsuarioRepository _usuarioRepository;

         public UsuarioController(ILogger<UsuarioController> logger, IUsuarioRepository usuarioRepository)
        {
            _logger = logger;
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet]
        public IActionResult ObterUsuario()
        {
            try
            {
                var usuarioTeste = new Usuario()
                {
                    Id = 1,
                    Nome = "NomeToken",
                    Email = login,
                    Senha = senha
                };

                return Ok(usuarioTeste);

            }
            catch (Exception e)
            {

                _logger.LogError($"Ocorreu erro ao Obter Usuário: {e.Message}", e);
                return this.StatusCode(StatusCodes.Status500InternalServerError, new ApiErrorResponse()
                {
                    Status = StatusCodes.Status500InternalServerError,
                    Erro = "Ocorreu erro ao efetuar login, tente novamente"
                });
            }
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult SalvarUsuario([FromBody] Usuario usuario)
        {
            try
            {
                var erros = new List<string>();

                if (string.IsNullOrEmpty(usuario.Nome) || string.IsNullOrWhiteSpace(usuario.Nome)
                     || usuario.Nome.Length < 2)
                {
                    erros.Add("Nome Inválido");
                }

                var obrigatorios = new List<string>() { "@" };
                if (string.IsNullOrEmpty(usuario.Senha) || string.IsNullOrWhiteSpace(usuario.Senha)
     || usuario.Senha.Length < 4 || obrigatorios.Any(e => usuario.Senha.Contains(e)))
                {
                    erros.Add("SEnha Inválido");
                }

                if (string.IsNullOrEmpty(usuario.Email) || string.IsNullOrWhiteSpace(usuario.Email)
    || usuario.Email.Length < 4 || obrigatorios.Any(e => usuario.Email.Contains(e)))
                {
                    erros.Add("Email Inválido");
                }

                if (erros.Count() >= 1)
                {
                    return BadRequest(new ApiErrorResponse()
                    {
                        Status = StatusCodes.Status400BadRequest,
                        Erros = erros
                    });
                }

                _usuarioRepository.Salvar(usuario);

                // return Ok(usuario);
                return Ok(new {msg="Usuário Criado com Sucesso" });

            }
            catch (Exception e)
            {

                _logger.LogError($"Ocorreu erro ao Salvar Usuário: {e.Message}", e);
                return this.StatusCode(StatusCodes.Status500InternalServerError, new ApiErrorResponse()
                {
                    Status = StatusCodes.Status500InternalServerError,
                    Erro = "Ocorreu erro ao efetuar login, tente novamente"
                });
            }
        }
    }
}

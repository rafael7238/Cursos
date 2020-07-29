using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Api_empty.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class testeController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "teste","teste2"};
        }

        [HttpGet("pessoa")]
        public ActionResult<IEnumerable<Pessoa>> GetPessoa()
        {
            return new[]
            {
                new Pessoa { Nome = "Ana" },
                new Pessoa { Nome = "Maria" },
                new Pessoa { Nome = "Felipe" },
            };
        }

        public class Pessoa
        {
            public string Nome { get; set; }
        }
        
    }
}

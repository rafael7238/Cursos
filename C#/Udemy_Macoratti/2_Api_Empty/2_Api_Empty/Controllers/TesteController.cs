using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _2_Api_Empty.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TesteController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[]  { "Rafae", "José"};
        }

        [HttpGet("Pessoa")]
        public ActionResult<IEnumerable<Pessoa>> GetPessoa()
        {
            return new[]
            {
                new Pessoa {Nome="Rafael"},
                 new Pessoa {Nome="José"}
            };
        }

    }

    public class Pessoa
    {
       public string Nome { get; set; }
    }
}

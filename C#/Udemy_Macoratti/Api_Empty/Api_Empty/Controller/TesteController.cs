using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api_Empty.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class TesteController: ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "teste","teste2"};
                        
        }
        [HttpGet("pessoa")]
        public ActionResult<IEnumerable<Pessoa>> GetPessoas(){

            return new[]
            {
                new Pessoa{Nome="Ana"},
                new Pessoa{Nome="Marcos"},
                new Pessoa{Nome="Rafael"}

            };
        }

    }

    public class Pessoa
    {
        public string Nome { get; set; }
    }
}

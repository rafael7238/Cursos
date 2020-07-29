using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace demo_empty.Controller
{
    [ApiController]
    [Route("api/[Controller]")]
    public class TesteController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> GetListStringss() {
            return new string[] { "teste1", "teste2" };
        }
    }
}
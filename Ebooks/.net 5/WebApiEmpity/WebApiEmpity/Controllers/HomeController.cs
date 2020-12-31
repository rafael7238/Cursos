using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApiEmpity.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
       
                public ActionResult<IEnumerable<string>> Get()
            {
            return new string[] { "teste", "teste2" };
            }
        }
    
}

using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3_WebApi.Filters
{
    public class ApiLogginFilter : IActionFilter
    {
        private readonly ILogger<ApiLogginFilter> _logger;
        public ApiLogginFilter( ILogger<ApiLogginFilter> logger)
        {
            _logger = logger;
        }
        public void OnActionExecuting(ActionExecutingContext context)
        {
            _logger.LogInformation("Inicio - Executando o Loggar antes da Action");
            _logger.LogInformation($"ModelStade {context.ModelState.IsValid}");
            _logger.LogInformation("Fim - Executando o Loggar antes da Action");

        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            _logger.LogInformation("Inicio - Executando o Loggar depois da Action");
            _logger.LogInformation($"ModelStade {context.ModelState.IsValid}");
            _logger.LogInformation("Fim - Executando o Loggar depois da Action");
        }
    }
}

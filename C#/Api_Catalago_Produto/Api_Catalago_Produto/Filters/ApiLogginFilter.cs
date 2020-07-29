using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api_Catalago_Produto.Filters
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
            _logger.LogInformation($"Executando Antes: { context.ModelState.IsValid}");
        }
        public void OnActionExecuted(ActionExecutedContext context)
        {
            _logger.LogInformation("Executando Depois");
        }

       
    }
}

using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiCatalago.Filter
{
    public class ApiLogginFilter : IActionFilter
    {

        private readonly ILogger<ApiLogginFilter> _logger;

        public ApiLogginFilter(ILogger<ApiLogginFilter> logger)
        {
            _logger = logger;
        }
        //Antes do Action
        public void OnActionExecuting(ActionExecutingContext context)
        {
            _logger.LogInformation("## Executando -> OnActionExecuting");
            _logger.LogInformation("#####################");
            _logger.LogInformation($"{DateTime.Now.ToLongDateString()}");
            _logger.LogInformation($"ModalState : {context.ModelState.IsValid}");
            _logger.LogInformation("#####################");
        }

        //Depois da Action
        public void OnActionExecuted(ActionExecutedContext context)
        {
            _logger.LogInformation("## Executado -> OnActionExecuted");
            _logger.LogInformation("#####################");
            _logger.LogInformation($"{DateTime.Now.ToLongDateString()}");            
            _logger.LogInformation("#####################");
        }


    }
}

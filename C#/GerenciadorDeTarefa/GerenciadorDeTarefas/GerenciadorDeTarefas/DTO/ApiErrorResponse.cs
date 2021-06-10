using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GerenciadorDeTarefas.DTO
{
    public class ApiErrorResponse
    {
        public int Status { get; set; }
        public string Erro { get; set; }
        public List<string> Erros { get; set; }
    }
}

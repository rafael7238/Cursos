using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AgendaTelefonica.Models
{
    public class Tarefa
    {
        public int TarefaId { get; set; }
        [Required(ErrorMessage ="{0} O campo é obrigatório")]
        [StringLength(50,ErrorMessage ="{0} O campo só aceita 50 caractéres")]

        public string Nome { get; set; }
        public string Data { get; set; }
        [Required(ErrorMessage = "{0} O campo é obrigatório")]
[DataType(DataType.Time)]
        public string Horario { get; set; }

    }
}
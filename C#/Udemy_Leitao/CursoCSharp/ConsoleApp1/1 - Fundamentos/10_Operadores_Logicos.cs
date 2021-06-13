using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _10_Operadores_Logicos
    {
        public static void Executar()
        {
            bool executouTarefaUm = true;
            bool executouTarefaDois = true;

            var operadorAND = executouTarefaUm && executouTarefaDois;
            var operadorOR = executouTarefaUm || executouTarefaDois;
            var operadorXOR = executouTarefaUm ^ executouTarefaDois;

            Console.WriteLine($"Valor com AND {operadorAND}");
            Console.WriteLine($"Valor com OR {operadorOR}");
            Console.WriteLine($"Valor com XOR {operadorXOR}");



        }
    }
}

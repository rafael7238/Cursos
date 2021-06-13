using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _12_Operador_Ternario
    {
        public static void Executar()
        {
            var valor = 10;
            string resultado = valor >= 10 ? "MAior que 10" : "Menor que 10";
            string resultado2 = valor >= 10 && false ? "MAior que 10" : "Menor que 10";


            Console.WriteLine(resultado);

        }
    }
}

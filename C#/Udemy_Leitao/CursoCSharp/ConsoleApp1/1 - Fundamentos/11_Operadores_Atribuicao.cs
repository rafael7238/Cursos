using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _11_Operadores_Atribuicao
    {
        public static void Executar()
        {
            var num1 = 3;
            num1 = 7;
            num1 += 10;
            num1 -= 10;
            num1 *= 10;
            num1 /= 10;

            num1++;
            num1--;

            Console.WriteLine(num1.ToString());

            dynamic c = new System.Dynamic.ExpandoObject();
            c.nome = "Rafael";

            dynamic d = c;
            d.nome = "Teste";

            Console.WriteLine(c.nome.ToString());



        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _9_Conversao
    {
        public static void Executar()
        {
            Console.Write("Digite um número: ");
            int.TryParse(Console.ReadLine(),out int num);
            Console.WriteLine(num);
        }
    }
}

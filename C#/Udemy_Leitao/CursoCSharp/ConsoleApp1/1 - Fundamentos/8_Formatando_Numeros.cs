using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _8_Formatando_Numeros
    {
        public static void Executar()
        {
            double valor = 15.17;
            
            Console.WriteLine(valor.ToString("F1"));
            Console.WriteLine(valor.ToString("C"));
            Console.WriteLine(valor.ToString("P"));
            Console.WriteLine(valor.ToString("#.##"));

            CultureInfo cultura = new CultureInfo("pt-BR");
            
            Console.WriteLine(valor.ToString("C2"), cultura);
        }
    }
}

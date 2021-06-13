using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1._1___Fundamentos
{
    class _3_VariaveisConstantes
    {
        public static void Executar()
        {
            double raio = 4.5;
            const double PI = 3.14;

            double area = PI * raio * raio;

            Console.WriteLine(area);
            Console.WriteLine("A área é " + area + 1000);
            Console.WriteLine("A área é " + (area + 1000));

            bool estaChovendo = true;
            Console.WriteLine("Está Chovendo? " + estaChovendo);


            byte idade = 45;
            Console.WriteLine("Idade(Byte) " + idade);

            sbyte saldoDeGols = sbyte.MinValue;
            Console.WriteLine("Saldo Gols(Byte) " + saldoDeGols);





        }
    }
}

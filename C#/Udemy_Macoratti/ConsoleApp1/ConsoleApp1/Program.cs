using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {

            int qtd = Int32.Parse(Console.ReadLine());
            var lerDadados = Console.ReadLine();
            string[] tartarugas = lerDadados.Split();
            int maiorNumero = 0;

            for (int i = 0; i <= qtd - 1; i++)
            {
                int numero = Int32.Parse(tartarugas[i]);
                if (maiorNumero < numero)
                {
                    maiorNumero = numero;
                }
            }

            if (maiorNumero < 10)
            {
                Console.WriteLine(1);
            }
            else if (maiorNumero < 20)
            {
                Console.WriteLine(2);
            }
            else
            {
                Console.WriteLine(3);
            }
        }
    }
}

using System;

namespace _1_Console
{
   public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var teste = Console.ReadLine();
            Console.WriteLine(teste.ToUpper().ToString());
            Program.testeRafael("2");
        
        }

        static void testeRafael(dynamic a){
            Console.WriteLine("Passou aqui dynamic");
        }
        static void testeRafael(double a){
            Console.WriteLine("Passou aqui int");
        }
    }
}

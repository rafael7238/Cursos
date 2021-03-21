using System;
using System.Globalization;
using System.Runtime.Serialization;

namespace Teste
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine(DateTime.Now);
            Console.WriteLine(DateTime.UtcNow);
            Console.WriteLine(DateTime.UnixEpoch);

            Console.ReadLine();
        }
    }
}
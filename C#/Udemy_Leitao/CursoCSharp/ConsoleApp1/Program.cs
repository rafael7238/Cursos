using ConsoleApp1._1___Fundamentos;
using CursoCSharp;
using System;
using System.Collections.Generic;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            var central = new CentralDeExercicios(new Dictionary<string, Action>() {
                {"Primeiro Programa - Fundamentos", PrimeiroPrograma.Executar},
                {"Segundo Programa - Comentários", _2_Comentarios.Executar},
                {"Terceiro Programa - Variáveis e Constantes", _3_VariaveisConstantes.Executar},

            });

            central.SelecionarEExecutar();
        }
    }
}
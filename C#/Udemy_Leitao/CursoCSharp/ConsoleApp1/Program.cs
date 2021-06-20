using ConsoleApp1._1___Fundamentos;
using CursoCSharp;
using System;
using System.Collections.Generic;
using ConsoleApp1._2___Estrutura_de_Controle;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            var central = new CentralDeExercicios(new Dictionary<string, Action>() {

                {"1 - Primeiro Programa - Fundamentos", PrimeiroPrograma.Executar},
                {"1 - Segundo Programa - Comentários", _2_Comentarios.Executar},
                {"1 - Terceiro Programa - Variáveis e Constantes", _3_VariaveisConstantes.Executar},
                {"1 - Quarto Programa - Inferência", _4_inferencia.Executar},
                {"1 - Quinto Programa - Interpolação de String", _5_Interpolacao_De_Strings.Executar},
                {"1 - Sexto Programa - Notação do Ponto", _6_Notacao_Ponto.Executar},
                {"1 - Sétimo Programa - Lendo Dados do Console", _7_Lendo_dados_Console.Executar},
                {"1 - Oitavo Programa - Formatando Número", _8_Formatando_Numeros.Executar},
                {"1 - Nono Programa - Conversões", _9_Conversao.Executar},
                {"1 - Décimo Programa - OperacoresLógico", _10_Operadores_Logicos.Executar},
                {"1 - Onze Programa - OperadoresAtibuicao", _11_Operadores_Atribuicao.Executar},
                {"1 - Doze Programa - Operador Ternário", _12_Operador_Ternario.Executar},
                {"2 - Primeiro Programa - Operador Ternário", _1___Estrutura_IF.Executar},
                {"2 - Segundo Programa -IF Else", _2___If_Else.Executar},
                {"2 - Terceito Programa - Switch", _3___Switch.Executar},
                {"2 - Quarto Programa -While", _4___While.Executar},
                {"2 - Quinto Programa - DO While", _5___Do_While.Executar},
                {"2 - Sexto Programa -For", _6___For.Executar},
                {"2 - Sétimo Programa - Foreach", _7___Foreach.Executar},
                {"2 - Oitavo Programa - Break - Continue", _8___Break_Continue.Executar},
                {"3 - Primeiro Programa - Método e Atributo", _3___Classes_e_Objets.Membro.Executar},
                {"3 - Segundo Programa - Método Retorno", _3___Classes_e_Objets._4___MetodosComRetorno.Executar},
                {"3 - Terceiro Programa - Static", _3___Classes_e_Objets._5___Static.Executar},
                {"3 - Sétimo Programa - Parametros Nomeado", _3___Classes_e_Objets._7___Parametro_Nomeado.Executar},
                {"3 - Oitavo Programa - Ref Out", _3___Classes_e_Objets._10___Ref_Out.Executar},













            });

            central.SelecionarEExecutar();
        }
    }
}
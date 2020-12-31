
import React from 'react'
import { View, StyleSheet } from 'react-native'

import DigiteSeuNome from './components/DigiteSeuNome'
import ListaProdutosV2 from './components/Produtos/ListaProdutosV2'
import ListaProdutos from './components/Produtos/ListaProduto'
import Primeiro from './components/Primeiro'
import CompPadra, { Comp1, Comp2 } from './components/Multi'
import MinMax from './components/MinMax'
import DefaultNumero from './components/Aleatorio'
import Botao from './components/Botao'
import Contador from './components/Contador'
//import Pai from './components/comunicacaoIndireta/Pai'
import ContadorV2 from './components/contador/ContadorV2'
import Diferenciar from './components/Diferenciar'
import Familia from './components/Relacao/Familia'
import Membros from './components/Relacao/Membros'
import UsuarioLogado from './components/UsuarioLogado'
import Quadrado from './components/layout/Quadrado'
import FlexBoxV1 from './components/layout/FlexBoxV1'
import FlexBoxV2 from './components/layout/FlexBoxV2'
import FlexBoxV4 from './components/layout/FlexBoxV4'
import Mega from './components/Mega/Mega'

export default () => (
  <View style={style.App}>
    <Mega qtdNumeros={6}/>

    {
      //<FlexBoxV4 />
//<FlexBoxV2 />

// <FlexBoxV1 />
//<DigiteSeuNome />
//<ListaProdutosV2 />
   // <UsuarioLogado usuario={{nome: "Rafael", sobrenome: "Leite"}}></UsuarioLogado>
   // <UsuarioLogado usuario={{nome: "Raquel", sobrenome: "Moreira"}}></UsuarioLogado>
   // <UsuarioLogado usuario={{sobrenome: "Moreira"}}></UsuarioLogado>
   // <UsuarioLogado />
   // <UsuarioLogado usuario={{nome: "Raquel", sobrenome: "Moreira"}}></UsuarioLogado>


      //<Diferenciar></Diferenciar>

      //<Pai />

  //  <Familia>
  //    <Membros nome="Ana" sobrenome="Silva"></Membros>
   //   <Membros nome="Julia" sobrenome="Silva"></Membros>

   // </Familia>

   // <Familia>
    //  <Membros nome="Rafael" sobrenome="Leite"></Membros>
    //  <Membros nome="Sara " sobrenome="Leite"></Membros>
    //  <Membros nome="José" sobrenome="Leite"></Membros>
    //  <Membros nome="Regina" sobrenome="Leite"></Membros>

    //</Familia>


      // <ContadorV2>

      //</ContadorV2>

     /*   <Contador inicial={10} passo={13}></Contador>
        <Contador />
         <Botao> </Botao>
      
         <DefaultNumero min={1} max={60} />
        <DefaultNumero min={1} max={60} />
        <DefaultNumero min={1} max={60} />
        <DefaultNumero min={1} max={60} />
        <DefaultNumero min={1} max={60} />
        <DefaultNumero min={1} max={60} />
      <MinMax min={3} max="20" />
        <MinMax min={1} max="94" />
        <CompPadra />
        <Comp1 />
        <Comp2 />
        <Primeiro />*/}
  </View>
)


const style = StyleSheet.create({
  App: {
    // backgroundColor: '#A00',
    flex: 1,
    justifyContent: "center", //Eixo da coluna (Principal)
    alignItems: "center", //Eixo linha (Cruzado)
    padding: 20,
  }
})
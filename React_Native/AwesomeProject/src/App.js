
import React from 'react'
import { View, StyleSheet } from 'react-native'

import Primeiro from './components/Primeiro'
import CompPadra, { Comp1, Comp2 } from './components/Multi'
import MinMax from './components/MinMax'
import DefaultNumero from './components/Aleatorio'
import Botao from './components/Botao'
import Contador from './components/Contador'
import Pai from './components/comunicacaoIndireta/Pai'

export default () => (
  <View style={style.App}>

    <Pai />

    { /*   <Contador inicial={10} passo={13}></Contador>
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
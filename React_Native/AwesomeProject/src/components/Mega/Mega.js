import React from 'react'
import { Button, Text, TextInput,View } from 'react-native'
import Estilo from '../estilo'
import MegaNumeros from './Numero'

export default class Mega extends React.Component {

    state = {
        qtdNumeros: this.props.qtdNumeros,
        numeros: []
    }

    alterarQtdNumero = (qtde) => {
        this.setState({ qtdNumeros: +qtde })
    }

    gerarNumerosContido = (nums) => {
        const novo = parseInt(Math.random() * 60) + 1;
        return nums.includes(novo) ? this.gerarNumerosContido(nums) : novo
    }

    gerarNumeros = () => {
        const numeros = Array(this.state.qtdNumeros).fill()
            .reduce((nums) => [...nums, this.gerarNumerosContido(nums)], [])
            .sort((a, b) => a - b)
        this.setState({ numeros });
    }

    exibirNumeros = () => {
        const nums = this.state.numeros
        return nums.map(num => {
            return <MegaNumeros key={num} num={num} />
        })
    }

    //  constructor(props){
    //      super(props)
    //      this.state={
    //          qtdNumeros: props.qtdNumeros
    //      }
    //  }

    render() {
        return (
            <>
                <Text style={Estilo.txtG}>Gerador de Mega-Sena - {this.state.qtdNumeros}</Text>
                <TextInput
                    style={{ borderBottomWidth: 1 }}
                    keyboardType={'numeric'}
                    placeholder="Qtd de Números"
                    value={`${this.state.qtdNumeros}`}
                    onChangeText={this.alterarQtdNumero}
                />
                <Button
                    title="Gerar"
                    onPress={this.gerarNumeros}
                />
                <View style={{
                    flexDirection:'row',
                    flexWrap:'wrap',
                    justifyContent:'center',
                    marginTop:20
                }}>
                {this.exibirNumeros()}
                </View>
              
                { // <Text>
                    //    {this.state.numeros.join(',')}
                    // </Text>
                }
            </>
        )
    }
}
import React from 'react'
import { View, Text, Button } from 'react-native'

export default props => {


    function gerarNumero(min, max) {
        var num = Math.floor(Math.random() * (props.max - props.min + 1)) + props.min;
        return num
    }

    return (
        <Button title="Executar" onPress={
            function () {
                const n = gerarNumero(props.min, props.max)
                console.warn(n)
                props.funcao(n,'Valor do carro')
            }
        } />
    )
}
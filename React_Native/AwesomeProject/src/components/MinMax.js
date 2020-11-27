import React from 'react'
import { Text } from 'react-native'
import Estilo from './estilo'


export default props => {
    console.warn(props)
    return (
        <Text style={Estilo.txtG}>
            O Valor {props.min} é menor que o valor de {props.max}
        </Text>
    )
}
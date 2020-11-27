import React from 'react'
import { Text } from 'react-native'
import Estilo from './estilo'

export default (props) => {
    var num = Math.floor(Math.random() * (props.max - props.min + 1)) + props.min;
    return (
        <Text style={Estilo.txtG}>{num}</Text>
    )
}
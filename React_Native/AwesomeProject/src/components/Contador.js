import React, { useState } from 'react'
import { Text, Button } from 'react-native'
import Estilo from './estilo'

export default ({ inicial = 0, passo = 1 }) => {

    const [numero, setNumero] = useState(inicial)

    //let numero = props.inicial

    function inc() {
        console.warn(inicial)
        setNumero(numero + passo)

    }
    function dec() {
        setNumero(numero - passo)
    }
    return (
        <>
            <Text style={Estilo.txtG}>{numero}</Text>
            <Button title='+' onPress={inc}></Button>
            <Button title='-' onPress={dec}></Button>
        </>
    )
}
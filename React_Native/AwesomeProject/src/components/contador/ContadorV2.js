import React, { useState } from 'react'
import { View, Text } from 'react-native'
import estilo from '../estilo'
import ContadorBotoes from './ContadorBotoes'
import ContadorDiplay from './ContadorDisplay'


export default _ => {

    const [num, setNum] = useState(0)


    const inc = () => setNum(num + 1)
    const dec = () => setNum(num - 1)


    return (
        <>
            <Text style={estilo.txtG}>Contador</Text>
            <ContadorDiplay num={num} ></ContadorDiplay>
            <ContadorBotoes inc={inc} dec={dec} />


        </>
    )
}
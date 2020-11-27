import React, { useState } from 'react'
import { View, Text } from 'react-native'
import Filho from './Filho'

export default props => {
    const[texto,setText] = useState('');
    const [num, setNum] = useState(0);


    function exibirValor(numero,text) {
        setNum(numero);
        setText(text);

    }

    return (
        <>
            <Text>{texto} : {num}</Text>
            <Filho min={1} max={50} funcao={exibirValor}></Filho>

        </>
    )
}
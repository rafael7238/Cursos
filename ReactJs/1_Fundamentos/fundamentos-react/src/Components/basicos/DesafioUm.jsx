import React from 'react'

export default function NumAleatorio(props) {
    const { min, max } = props;
    var numAleatorio = parseInt(Math.random() * (max - min)) + min;
    return (
        <>
            <h2>Desafio Um</h2>
            <h3>O número aleatório gerador entre os números {min} e {max} foi {numAleatorio}</h3>
        </>
    )
}
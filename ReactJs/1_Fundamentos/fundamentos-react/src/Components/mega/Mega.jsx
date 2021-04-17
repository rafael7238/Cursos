import React, { useState } from 'react'

export default (props) => {

    let [qtd, setQtd] = useState(1)
    let [listaPrincipal, setll] = useState(Array(qtd).fill(0))
    let maxValue = 60
    let minvalue = 1
    let lista = []
    let numAleatorio = 0

    function geraNumero() {
        lista = []
        setll(lista)
        for (let i = 1; i <= qtd; i++) {
            lista.push(geraNumeroAleatorio(lista))
        }
        lista.sort(function (a, b) {
            if (a > b) { return 1 }
            return -1
        });
        setll(lista)
    }

    function recompilaQuantidade(qtd2) {
        lista = Array(qtd2).fill(0)
        setll(lista)
    }

    const li = listaPrincipal.map((e, i) => {
        if (i == 0)
            return <span key={i}> {e} - </span>
        if (i == listaPrincipal.length - 1)
            return <span key={i}> {e} </span>
        else
            return <span key={i}> {e} - </span>
    })

    function geraNumeroAleatorio(lista) {
        numAleatorio = Math.floor(Math.random() * (maxValue - minvalue + 1)) + minvalue;
        var t = validaNumeroNaLista(lista, numAleatorio)
        if (t) {
            geraNumeroAleatorio(lista)
        }
        return numAleatorio
    }

    function validaNumeroNaLista(lista, numero) {
        return lista.includes(numero)
    }

    return (
        <div>
            <input value={qtd} type="number" onChange={(e) => {
                console.log(e)
                e.target.valueAsNumber = e.target.valueAsNumber < 0 ? 0 : e.target.valueAsNumber
                setQtd(e.target.valueAsNumber)
                recompilaQuantidade(e.target.valueAsNumber)
            }} />
            <button onClick={geraNumero}> Gerar Número</button>
            <div>{qtd}</div>
            <div>{li}</div>
        </div>
    )
}
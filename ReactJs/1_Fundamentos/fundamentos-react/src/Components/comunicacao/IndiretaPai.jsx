import React, { useState } from 'react'
import IndiretaFilho from './IndiretaFilho'

export default props => {

    const [nome, setNome] = useState('?')
    const [idade, setidade] = useState(0)
    const [nerd, setnerd] = useState(false)


    function fornecerInformacoes(nomeParam, idadeParam, nerdParam) {
        setNome(nomeParam)
        setidade(idadeParam)
        setnerd(nerdParam)

    }

    /// nome idade nerd
    return (
        <div>
            <div>
                <span>{nome} </span>
                <span>{idade} </span>
                <span>{nerd ? 'Verdadeiro' : 'Falso'} </span>
            </div>
            <IndiretaFilho quandoClicar={fornecerInformacoes} />
        </div>
    )
}
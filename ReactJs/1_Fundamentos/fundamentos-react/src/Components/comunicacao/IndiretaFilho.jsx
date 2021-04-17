import React from 'react'

export default props => {
    const gerarIdade = Math.random
    return (
        <div>
            <div>
                Filho
           </div>
            <button onClick={
                function (_) {
                    props.quandoClicar('Joao', gerarIdade(), true)
                }
            }>Fornecer Informações</button>
        </div>
    )
}
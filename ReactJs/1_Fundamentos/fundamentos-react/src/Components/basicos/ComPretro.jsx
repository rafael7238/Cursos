import React from 'react'
export default function ComParametros(props) {
    console.log(props)
    var no = props.nota
    const status = props.nota2>=7 ? 'Aprovado' : 'Reprovado'
    return (
        <div>
            <h2>{props.titulo}</h2>
            <p>
                <strong>{props.aluno}</strong> tem nota 
                <strong> {no}</strong> 
                <strong> {status}</strong> 
            </p>
        </div>
    )
}
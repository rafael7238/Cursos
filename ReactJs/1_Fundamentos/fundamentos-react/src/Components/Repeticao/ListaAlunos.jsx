import React from 'react'
import alunos from '../../Data/alunos.js'

export default props => {
    // const li1 = (<li>{alunos[0].id}) {alunos[0].nome} -{'>'} {alunos[0].nota}   </li>);

    const alunosLi = alunos.map(aluno => {
        return <li key={aluno.id}>{aluno.id}) {aluno.nome} -{'>'} {aluno.nota}   </li>
    });

    console.log(alunos)
    return (
        <div>
            <ul style={{ listStyle: 'none', textAlign: 'center' }}>
                {alunosLi}

            </ul>
        </div>
    )
}
import React from 'react'
import produto from '../../Data/produto'
import './TabelaProdutos.css'

export default props => {

    function getProdutoLi() {
        return produto.map((aluno, index) => {

            return <tr key={aluno.id} className={index % 2 === 0 ? "Par" : "Impar"}>
                <td> {aluno.id}</td>
                <td>  {aluno.nome}</td>
                <td>   {aluno.preco}</td>

            </tr>
        })
    };

    console.log(produto)
    return (
        <div className="TabelaProdutos">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Produto</th>
                        <th>Preco</th>
                    </tr>
                </thead>
                <tbody>
                    {getProdutoLi()}
                </tbody>
            </table>
        </div>

    )
}
import React from 'react'
import { View, Text } from 'react-native'
import produtos from './Produtos'
import estilo from '../estilo'


export default props => {

    function listarProdutos() {
        return produtos.map(p => {
            return (
                
                <Text key={p.id}> {p.id}) - {p.nome} tem R$ {p.preco}
                </Text>
            )
        }
        )
    }
    return (
        <>
            <Text style={estilo.txtG}>Lista de Produtos: </Text>
            <Text style={estilo.txtG}>{produtos.length} </Text>
            {listarProdutos()}
        </>
    )
}
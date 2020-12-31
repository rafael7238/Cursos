import React from 'react'
import { View, Text, FlatList } from 'react-native'
import produtos from './Produtos'
import estilo from '../estilo'


export default props => {

    const listarProdutos = ({ item }) => {
        return <Text>{item.id}) - {item.nome} tem R${item.preco}</Text>
    }

    return (
        <>
            <Text style={estilo.txtG}>Lista de Produtos: </Text>
            <Text style={estilo.txtG}>{produtos.length} </Text>
            <FlatList data={produtos}
                keyExtractor={i => `${i.id}`}
                renderItem={listarProdutos} ></FlatList>
        </>
    )
}
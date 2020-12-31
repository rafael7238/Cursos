import React, { useState } from 'react'
import { View, TextInput, Text } from 'react-native'

export default props => {
    const [nome, setNome] = useState("");

    return (
        <View>
            <TextInput
                placeholder="Teste"
                placeholderTextColor="#9a73ef"
                value={nome}
                onChangeText={(nome) => {
                    setNome(nome)
                }}
            />
        </View>
    )
}
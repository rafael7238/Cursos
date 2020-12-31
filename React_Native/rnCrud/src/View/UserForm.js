import React, { useState } from 'react'
import { View, Text, TextInput, StyleSheet, Button, Alert } from 'react-native'



export default props => {

    const [user, setUser] = useState(props.route.params ? props.route.params : [])

    //  var params = props.route.params ? props.route.params : props.route
    //  console.warn(Object.keys(params))
    //   console.warn(params.id)


    return (
        <View style={style.form}>

            <Text>Name</Text>
            <TextInput style={style.input}
                onChangeText={name => setUser({ ...user, name })}
                placeholder="Informe o Nome"
                value={user.name} />

            <Text>Email</Text>
            <TextInput style={style.input}
                onChangeText={email => setUser({ ...user, email })}
                placeholder="Informe o Email"
                value={user.email} />

            <Text>Url do Avatar</Text>
            <TextInput style={style.input}
                onChangeText={avatarUrl => setUser({ ...user, avatarUrl })}
                placeholder="Informe a Url do Avatar"
                value={user.avatarUrl} />

            <Button title="Salvar" onPress={() => {
                props.navigation.goBack()
            }} />

            <Button title="Excluir" color="red" onPress={()=>confirmDelete(user)}/>

        </View>
    )
}
  const confirmDelete = (user) => {
    console.warn("Passou aqui")
    Alert.alert("Excluir Usuário", "Deseja Realmente Excluir o Usuário?", [
        {
            text: "Sim",
            onPress() {
                console.warn("delete " + user.id)
            }
        },
        {
            text: "Não"
        }
    ])
};

const style = StyleSheet.create({
    form: {
        padding: 15
    },
    input: {
        height: 40,
        borderColor: 'gray',
        borderWidth: 1,
        marginBottom: 10
    }
})
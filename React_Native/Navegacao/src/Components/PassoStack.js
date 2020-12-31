import React from 'react'
import { Button, SafeAreaView, Text, View } from 'react-native'



export default props => (


    <View style={{
        flex: 1
    }}>

        <View style={{ flexDirection: "row", justifyContent: "space-around" }}>
            {

                props.voltar ?
                    <Button title="Voltar" onPress={() => {
                        props.navigation.goBack()

                    }} /> : false
            }
            {

                props.avancar ?
                    <Button title="Avançar" onPress={() => {
                        props.avancar2 ?
                            props.navigation.push(props.avancar, { numero: parseInt(Math.random() * 100) }) :
                            props.navigation.navigate(props.avancar)
                    }} /> : false
            }
        </View>
        <View style={{ flex: 1 }}>
            {props.children
                //  console.warn(props)
            }

        </View>

    </View>

)
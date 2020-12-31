import React from 'react'
import { View, Text, StyleSheet } from 'react-native'
import Estilo from '../estilo'

export default props => {
    return (
        <View style={style.Container}>
            <Text style={[Estilo.txtG, style.Numero]}>
                {props.num}
            </Text>
        </View>

    )
}

const style = StyleSheet.create({
    Container: {
        height: 50,
        width: 50,
        backgroundColor: '#000',
        margin:5,
        borderRadius:25,
     //   alignItems:"flex-end",
        justifyContent:'center',
    },
    Numero: {
        color: '#FFF',
      //  backgroundColor:'#FF3',
        alignItems:"flex-end",
    }
})
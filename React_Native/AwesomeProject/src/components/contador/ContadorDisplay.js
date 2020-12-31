import React from 'react'
import { View, Text, StyleSheet } from 'react-native'
import estilo from '../estilo'

export default props => {

    return (
        <View style={style.Display}>
            <Text style={[estilo.txtG, style.DisplayText]}>
                {props.num}
            </Text>
        </View>
    )
}


const style = StyleSheet.create({
    Display: {
        backgroundColor: '#000',
        alignItems: "center",
        width: 300

    },
    DisplayText: {
        color: '#FFF'
        //color:'#000'
    }
})
import React from 'react'
import { View, StyleSheet } from 'react-native'
import Quadrado from './Quadrado'

export default props => {
    return (
        <View style={style.FlexV4}>
            <View style={style.FlexV1}></View>
            <View style={style.FlexV2}></View>
        </View>

    )
}

const style = StyleSheet.create({
    FlexV4: {
        flexGrow: 1,
        width: 100,
      //  height:"50%",
        backgroundColor: "#000",
        flexDirection:"column-reverse"
    },
    FlexV1: {
        flexGrow:0.25,
        backgroundColor: "#ff801a"
        
    },
    FlexV2: {
        flexGrow:0.25,
        backgroundColor: "#dd22c1"
       
    }
})
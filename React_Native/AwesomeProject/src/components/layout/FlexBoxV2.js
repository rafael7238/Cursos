import React from 'react'
import { View, StyleSheet } from 'react-native'
import Quadrado from './Quadrado'

export default props => {
    return (
        <View style={style.FlexV1}>
            <Quadrado lado={20} />
            <Quadrado cor="#900" lado={30} />
            <Quadrado cor="#090" lado={40} />
            <Quadrado cor="#009" lado={50} />
        </View>

    )
}

const style = StyleSheet.create({
    FlexV1: {
        flex: 1,
        width: "100%",
        flexDirection: "row",
        alignItems: "center", //CrosAxis
        justifyContent: "space-between", //MainAxis
        backgroundColor: "#000"
    }
})
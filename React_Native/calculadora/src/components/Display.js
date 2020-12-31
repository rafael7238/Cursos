import React from 'react'
import { View, Text, StyleSheet } from 'react-native'


export default props =>
    <View style={style.display}>
        <Text style={style.displayValue} numberOfLines={1} >
            {props.value}
        </Text>
    </View>


const style = StyleSheet.create({
    display: {
        flex: 1,
        padding: 20,
        justifyContent: "center",
        backgroundColor: "rgba(0,0,0,0.6)",
        alignItems: "flex-end"
    },
    displayValue: {
        fontSize: 50,
        color: "#fff"
    }
})
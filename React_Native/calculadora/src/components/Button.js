import React from 'react'
import { PixelRatio, StyleSheet, Text, Dimensions, TouchableHighlight } from 'react-native'



export default props => {
    const styleButton = [styles.button]
    if (props.double)  styleButton.push(styles.buttonDuble)
    if (props.triple)  styleButton.push(styles.buttonTriple)
    if (props.operacion)  styleButton.push(styles.operationButton)

    return (
        <TouchableHighlight onPress={props.onClick}>
            <Text style={styleButton}> {props.label}</Text>
        </TouchableHighlight>
    )
}

const styles = StyleSheet.create({
    button: {
        fontSize: 30,
        height: Dimensions.get('window').width / 4,
        width: Dimensions.get('window').width / 4,
        padding: 20,
        backgroundColor: '#f0f0f0',
        textAlign: 'center',
        borderWidth: 1,
        borderColor: '#888',

    },
    operationButton: {
        color: '#fff',
        backgroundColor: '#fa8231'
    },
    buttonDuble: {
        width: (Dimensions.get('window').width / 4) * 2
    },
    buttonTriple: {
        width: (Dimensions.get('window').width / 4) * 3
    }
})
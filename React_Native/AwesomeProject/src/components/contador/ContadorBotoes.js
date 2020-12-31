import React from 'react'
import { View, Text, Button, StyleSheet } from 'react-native'

export default props => {
    return (
        <View style={style.Botoes}>

            <Button title="+" onPress={props.inc} />

            <Button title="-" onPress={props.dec} />
        </View>

    )
}

const style = StyleSheet.create({
    Botoes: {
        
     //   flex: 1,
        flexDirection: 'row',
        justifyContent: 'space-around',
      //  alignItems: 'stretch',

    }
   

    
})
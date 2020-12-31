import React from 'react'
import { View, Text, Platform } from 'react-native'

export default props => {
   
    {

       return Platform.OS === 'android' ?
            <Text>android!! </Text> : <Text> Eitaaa</Text>
    }
}
import React from 'react'
import { View, Text } from 'react-native'

export default props => {
    return (
        <>
            <Text>{props.a}</Text>
            <Text>{props.b}</Text>
        </>
    )
}
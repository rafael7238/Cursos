import React from 'react'
import { View, Text } from 'react-native'

export default props => {
    return (
        <>
            <Text>[Inicio] Membros</Text>
            {
                props.children
            }
            <Text>[Fim Membros]</Text>
        </>
    )
}
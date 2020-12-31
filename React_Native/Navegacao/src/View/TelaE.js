import React from 'react'
import { Button, View } from 'react-native'
import TextCentral from '../Components/TextCentral'

export default props => (
    <View style={{ flex: 1 }}>
        <View style={{ flexDirection: 'row', justifyContent: 'flex-start' }}>
            <Button title='Abrir' onPress={() => {
                props.navigation.openDrawer()
                setTimeout(() => {
                    props.navigation.closeDrawer()
                }, 3000)
            }} />
        </View>
        <TextCentral corFundo='#33fa72'>
            Tela E
    </TextCentral>
    </View>
)
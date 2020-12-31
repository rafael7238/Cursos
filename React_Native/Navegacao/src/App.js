import React from 'react'
import { SafeAreaView, Text, View } from 'react-native'
import TextoCentral from './Components/TextCentral'
import TelaA from './View/TelaA'
import TelaB from './View/TelaB'
import TelaC from './View/TelaC'

export default props => (
    <SafeAreaView style={{ flex: 1 }}>
        {  // <Text>Teste</Text>        
            //   <TextoCentral filho={"rafael"}>App</TextoCentral>
            <>
                <TelaA />
                <TelaB />
                <TelaC />
            </>
        }
    </SafeAreaView>
)
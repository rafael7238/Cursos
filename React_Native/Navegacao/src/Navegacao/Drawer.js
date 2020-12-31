import React from 'react'
import { SafeAreaView, Text, View } from 'react-native'
import { createDrawerNavigator } from '@react-navigation/drawer'
import TelaA from '../View/TelaA'
import TelaB from '../View/TelaB'
import TelaC from '../View/TelaC'
import PassoStack from '../Components/PassoStack'
import TelaD from '../View/TelaD'
import TelaE from '../View/TelaE'

const Drawer = createDrawerNavigator()

export default props => (
    <Drawer.Navigator initialRouteName="Tela E">
        <Drawer.Screen name="Tela A" component={TelaA} />
        <Drawer.Screen name="Tela B" component={TelaB} />
        <Drawer.Screen name="Tela C" component={TelaC} />
        <Drawer.Screen name="Tela D" component={TelaD} avancar2 />
        <Drawer.Screen name="Tela E" component={TelaE} avancar2 />

    </Drawer.Navigator>
)
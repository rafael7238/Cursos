import React from 'react'
import { SafeAreaView, Text, View } from 'react-native'
import { createStackNavigator } from '@react-navigation/stack'
import TelaA from '../View/TelaA'
import TelaB from '../View/TelaB'
import TelaC from '../View/TelaC'
import PassoStack from '../Components/PassoStack'
import TelaD from '../View/TelaD'

const Stack = createStackNavigator()

export default props => (
    <Stack.Navigator initialRouteName="TelaA" screenOptions={{
       // headerShown: false
    }}>
        <Stack.Screen
            name="TelaA"
            options={{ title: "Informações Iniciais" }}
        //   component={TelaA} 
        >
            {props => (
                <PassoStack {...props} avancar="TelaB">
                    <TelaA />
                </PassoStack>)}
        </Stack.Screen>

        <Stack.Screen
            name="TelaB"
        //component={TelaB} 
        >
            {props => (
                <PassoStack {...props} avancar="TelaC" voltar>
                    <TelaB />
                </PassoStack>)}
        </Stack.Screen>

        <Stack.Screen
            name="TelaC"
        //    component={TelaC}
        >
            {props => (
                <PassoStack {...props} voltar avancar="TelaD">
                    <TelaC />
                </PassoStack>)}
        </Stack.Screen>


        <Stack.Screen
            name="TelaD"
        //    component={TelaC}
        >
            {props => (
                <PassoStack {...props} voltar avancar="TelaD" avancar2>
                    <TelaD {...props} />
                </PassoStack>)}
        </Stack.Screen>



    </Stack.Navigator>
)
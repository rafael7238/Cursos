import React from 'react'
import { View, Text } from 'react-native'
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'
import UserList from './View/UserList'
import UserForm from './View/UserForm'
import { Button, Icon } from 'react-native-elements'


const Stack = createStackNavigator()
export default props => {
    return (
        <NavigationContainer>
            <Stack.Navigator initialRouteName="UserList"
                screenOptions={screenOptions}>
                <Stack.Screen
                    name="UserList"
                    component={UserList}
                    options={({ navigation }) => {
                        return {
                            title: "Lista de Usuários",
                            headerTitleAlign: "center",
                            // headerTitle:false,
                            headerRight: () => (
                                <View style={{ flexDirection: "row" }}>
                                    <Button
                                        type="clear"
                                        icon={<Icon name="add" size={25} color="white" />} />
                                    <Button
                                        onPress={() => {
                                            navigation.navigate('UserForm')
                                        }}
                                        type="clear"
                                        icon={<Icon name="add" size={25} color="white" />} />

                                </View>
                            )
                        }
                    }} />
                <Stack.Screen
                    name="UserForm"
                    component={UserForm}
                    options={{ title: "Formulário de Usuários" }} />
            </Stack.Navigator>
        </NavigationContainer>
    )
}

const screenOptions = {
    headerStyle: {
        backgroundColor: '#f4511e'
    },
    headerTintColor: '#fff',
    headerTitleStyle: {
        fontWeight: 'bold'
    }

}
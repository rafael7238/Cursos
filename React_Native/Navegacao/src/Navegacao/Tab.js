import React from 'react'
import { SafeAreaView, Text, View } from 'react-native'
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import TelaA from '../View/TelaA'
import TelaB from '../View/TelaB'
import TelaC from '../View/TelaC'
import PassoStack from '../Components/PassoStack'
import TelaD from '../View/TelaD'
import Ionicons from 'react-native-vector-icons/Ionicons';


const Tab = createBottomTabNavigator()

export default props => (
    <Tab.Navigator initialRouteName="Tela B"
        tabBarOptions={{

            activeTintColor: 'red',
            inactiveTintColor: 'blue',
            showLabel: true,
            //  labelStyle: { fontSize: 30 }
        }}
        screenOptions={({ route }) => ({
            tabBarIcon: ({ focused, color, size }) => {
                let iconName;

                switch (route.name) {
                    case 'Tela A':
                        iconName = focused
                            ? 'ios-information-circle'
                            : 'ios-information-circle-outline';
                        break;
                    case 'Tela B':
                        iconName = focused
                            ? 'ios-information-circle'
                            : 'ios-information-circle-outline';
                        break;
                    case 'Tela C':
                        iconName = focused
                            ? 'ios-information-circle'
                            : 'ios-information-circle-outline';
                        break;
                    case 'Tela D':
                        iconName = focused
                            ? 'ios-information-circle'
                            : 'ios-information-circle-outline';
                        break;


                }
                // You can return any component that you like here!
                return <Ionicons name={iconName} size={size} color={color} />;
            },
        })}
    >
        <Tab.Screen name="Tela A" component={TelaA}
            options={{
                title: 'Inicial',
                tabBarBadge: parseInt(Math.random() * 100)
            }} />
        <Tab.Screen name="Tela B" component={TelaB} />
        <Tab.Screen name="Tela C" component={TelaC} />
        <Tab.Screen name="Tela D" component={TelaD} avancar2 />

    </Tab.Navigator>
)
import React, { useContext } from 'react'
import { View, Text, FlatList } from 'react-native'
import { ListItem, Avatar, Button, CheckBox } from 'react-native-elements'
import { Icon } from 'react-native-elements/src/icons/Icon'
import usersContexts from '../context/UsersContexts'

export default props => {
    // console.warn(Object.keys(props))
    const { state, dispath } = useContext(usersContexts)


    function getUserItem({ item }) {
        return (
            // <Text>{item.name} - {item.email}</Text>

            <ListItem key={item.id} bottomDivider
                onPress={() => { props.navigation.navigate('UserForm', item) }}
            >
                <Avatar source={{ uri: item.avatarUrl }} />
                <ListItem.Content>
                    <ListItem.Title>{item.name}</ListItem.Title>
                    <ListItem.Subtitle>{item.email}</ListItem.Subtitle>
                </ListItem.Content>

                <ListItem.Chevron />

            </ListItem>

        )
    }
    return (
        <View>
            <FlatList
                horizontal={false}
                keyExtractor={user => user.id.toString()}
                data={state.users}
                renderItem={getUserItem} />

        </View>
    )
}
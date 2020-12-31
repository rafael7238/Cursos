import React from 'react'
import { View, Text, FlatList } from 'react-native'
import { ListItem, Avatar, Button, CheckBox } from 'react-native-elements'
import { Icon } from 'react-native-elements/src/icons/Icon'
import users from '../data/users'

export default props => {
    // console.warn(Object.keys(props))

    function getUserItem({ item }) {
        return (
            // <Text>{item.name} - {item.email}</Text>

            <ListItem key={item.id} bottomDivider
                onPress={() => { props.navigation.navigate('UserForm',item) }}

            >
                <Avatar source={{ uri: item.avatarUrl }} title="Teste" />
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
                data={users}
                renderItem={getUserItem} />

        </View>
    )
}
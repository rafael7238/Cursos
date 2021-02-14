import React, { createContext, useReducer } from 'react'
import users from '../data/users'

const initialState = { users }
const usersContexts = createContext([])

const actions = {

    createUser(state, action) {
        const user = action.payload
        user.id = Math.random()
        return { ...state, users: [...state.users, user], }
    },

    deleteUser(state, action) {
        const user = action.payload
        return {
            ...state,
            users: state.users.filter(u => u.id !== user.id)
        }
    }
}

export const UsersProvider = props => {


    function reducer(state, action) {
        const fn = actions[action.type]
        return fn ? fn(state, action) : state
    }

    const [state, dispatch] = useReducer(reducer, initialState)

    return (
        <usersContexts.Provider value={{
            state, dispatch
        }}>
            {props.children}
        </usersContexts.Provider>
    )
}

export default usersContexts
import React from 'react'
import If, { Else } from "./if"

export default props => {
    const usuario = props.usuario || {}
    return (
        <div>
            <If teste={usuario && usuario.nome}>
                Seja bem Vindo  <strong> {usuario.nome}! </strong>
            </If>
            <If teste={usuario && usuario.email}>
                Seja bem Vindo  <strong>{usuario.email}! </strong>
                <Else>
                    Seja Bem Vindo 2
                </Else>
            </If>
        </div>
    )
}
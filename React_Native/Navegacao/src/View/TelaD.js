import React from 'react'
import TextCentral from '../Components/TextCentral'

export default props => {
    console.warn(props.route.params)
    const route = props.route.params || { numero: 0 }
    return (

        <TextCentral corFundo='#9932'>
            Tela D - {
                          route.numero
            }
        </TextCentral>
    )
}
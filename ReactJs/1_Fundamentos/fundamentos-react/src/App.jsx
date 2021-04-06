import React from 'react'
import Primeiro from './Components/basicos/Primeiro.jsx'
import ComParametro from './Components/basicos/ComPretro.jsx'
import Fragmento from './Components/basicos/Fragmento.jsx'
import NumeroAleatorio from './Components/basicos/DesafioUm'
import Card from './Components/layout/Card'
import Familia from './Components/basicos/Familia'
import "./App.css"

export default _ => {
    const tag = <strong>Rafael</strong>
    return (
        <div className='App'>
            <div className="Cards">

                <Card titulo="Primeiro Componente" color="#fe4a49" >
                    <Primeiro></Primeiro>
                </Card>

                <Card titulo="Segundo Componente" color="#2ab7ca">
                    {tag}
                </Card>

                <Card titulo="Terceiro componente" color="#fed766">
                    <ComParametro titulo="Segundo componente" aluno="Muito Legal" nota="9.3" nota2={5.8} />

                </Card>
                <Card titulo="Quarto componente" color="#e6e6ea">
                    <Fragmento />

                </Card>
                <Card titulo="Quinto componente" color="#0e9aa7">
                    <NumeroAleatorio min={1} max={60} />

                </Card>

                <Card titulo="Sexto componente" color="#f6cd61">
                    nada
            </Card>

                <Card titulo="Sétimo Componente" color="#fe4a49" >
                    <Familia sobrenome="Leite"></Familia>
                </Card>

                
                <Card titulo="Sétimo Componente" color="#fe4a49" >
                    <Familia sobrenome="Leite"></Familia>
                </Card>
                
            </div>
        </div>)
};
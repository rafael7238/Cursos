import React from 'react'
import Primeiro from './Components/basicos/Primeiro.jsx'
import ComParametro from './Components/basicos/ComPretro.jsx'
import Fragmento from './Components/basicos/Fragmento.jsx'
import NumeroAleatorio from './Components/basicos/DesafioUm'
import Card from './Components/layout/Card'
import Familia from './Components/basicos/Familia'
import "./App.css"
import ListaAlunos from './Components/Repeticao/ListaAlunos'
import ListaProdutos from './Components/Repeticao/TabelaProdutos'
import ParOuImpar from './Components/condicional/ParOuImpar'
import UsuarioInfo from './Components/condicional/UsuarioInfo'
import DiretaPai from './Components/comunicacao/DiretaPai'
import IndiretaPai from './Components/comunicacao/IndiretaPai'
import Input from './Components/formulario/input.jsx'
import Contador from './Components/contador/Contador.jsx'
import Mega from './Components/mega/Mega.jsx'


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

                <Card titulo="Lista de Alunos" color="#e6e6ea" >
                    <ListaAlunos />
                </Card>
                <Card titulo="Lista de Produtos" color="#fed766" >
                    <ListaProdutos />
                </Card>

                <Card titulo="Par Ou Impar" color="#f6cd61" >
                    <ParOuImpar numero={20} />
                    <UsuarioInfo usuario={{ nome: 'Fernando' }} />
                    <UsuarioInfo usuario={{ email: 'Fernando' }} />
                </Card>

                <Card titulo="Pai e filho - Comunicação Direta" color="#fe4a49" >
                    <DiretaPai />
                </Card>

                <Card titulo="Pai e filho - Comunicação Indireta" color="#fe4a49" >
                    <IndiretaPai />
                </Card>

                <Card titulo="Componente Controlado" color="#f6cd61" >
                    <Input />
                </Card>

                
                <Card titulo="Contador" color="#f6cd61" >
                    <Contador numeroInicial={10}/>
                </Card>

                <Card titulo="Mega" color="#f6cd61" >
                    <Mega qtdGeraNumero={7}/>
                </Card>
            </div>
        </div>)
};
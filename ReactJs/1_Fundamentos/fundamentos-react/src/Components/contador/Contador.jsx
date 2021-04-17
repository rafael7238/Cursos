import React from 'react'
import './Contador.css'

export default class Contador extends React.Component {

    state = {
        numInicial: this.props.numeroInicial,
        passo: this.props.passo || 5
    }

    inc = () => {
        this.setState({
            numInicial: this.state.numInicial + this.state.passo
        })
    }

    dec = () => {
        this.setState({
            numInicial: this.state.numInicial -this.state.passo
        })
    }

    setPasso = (e) => {
        this.setState({
            passo : + e.target.value           
        })
    }

    render() {
        return <div className="Contador">
            <h2>Contador</h2>
            <p>Valor Inicial: {this.state.numInicial}</p>
            <div>
                <label>Passo: </label>
                <input id="passoInput" type="number" value={this.state.passo} onChange={this.setPasso} />
            </div>
            <button onClick={this.inc}>+</button>
            <button onClick={this.dec}>-</button>

        </div>
    }
}
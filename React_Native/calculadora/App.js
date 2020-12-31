import React from 'react';
import { StyleSheet, View } from 'react-native'
import Button from './src/components/Button'
import Display from './src/components/Display'

const initialState = {
  displayValue: '0',
  clearDisplay: true,
  operation: null,
  values: [0, 0],
  current: 0
}

export default class App extends React.Component {

  state = { ...initialState }


  addDigit = n => {


    const clearDisplay = this.state.displayValue === '0' ||
      this.state.clearDisplay

    if (n === '.' && !clearDisplay && this.state.displayValue.includes('.')) {
      return
    }


    const currentValue = clearDisplay ? '' : this.state.displayValue
    const displayValue = currentValue + n
    this.setState({ displayValue, clearDisplay: false })

    if (n !== '.') {
      const newValue = parseFloat(displayValue)
      const values = [...this.state.values]
      values[this.state.current] = newValue
      this.setState({ values })

    }
  }

  clearMemory = () => {
    this.setState({ ...initialState })
  }

  setOperation = operation => {
    if (this.state.current === 0) {
      this.setState({ operation, current: 1, clearDisplay: true })
    }
    else {
      const equals = operation === '='
      const values = [...this.state.values]
      try {
        console.warn(`${values[0]} ${this.state.operation} ${values[1]}`)
        values[0] = eval(`${values[0]} ${this.state.operation} ${values[1]}`)
      }
      catch (e) {
        values[0] = this.state.values[0]
      }
      values[1] = 0

      this.setState({
        displayValue: `${values[0]}`,
        operation: equals ? null : operation,
        current: equals ? 0 : 1,
        clearDisplay: !equals,
        values,
      })
    }
  }

  render() {
    return (
      <View style={style.container}>
        <Display value={this.state.displayValue} />
        <View style={style.button}>
          <Button label='AC' triple onClick={this.clearMemory}></Button>
          <Button label='/' operacion onClick={() => this.setOperation('/')}></Button>
          <Button label='7' onClick={() => this.addDigit(7)}></Button>
          <Button label='8' onClick={() => this.addDigit(8)}></Button>
          <Button label='9' onClick={() => this.addDigit(9)}></Button>
          <Button label='*' operacion onClick={() => this.setOperation('*')}></Button>
          <Button label='4' onClick={() => this.addDigit(4)}></Button>
          <Button label='5' onClick={() => this.addDigit(5)}></Button>
          <Button label='6' onClick={() => this.addDigit(6)}></Button>
          <Button label='-' operacion onClick={() => this.setOperation('-')}></Button>
          <Button label='1' onClick={() => this.addDigit(1)}></Button>
          <Button label='2' onClick={() => this.addDigit(2)}></Button>
          <Button label='3' onClick={() => this.addDigit(3)}></Button>
          <Button label='+' operacion onClick={() => this.setOperation('+')}></Button>
          <Button label='0' double onClick={() => this.addDigit(0)}></Button>
          <Button label='.' onClick={() => this.addDigit('.')}></Button>
          <Button label='=' operacion onClick={() => this.setOperation('=')}></Button>
        </View>
      </View>
    )
  }
}

const style = StyleSheet.create({
  container: {
    flex: 1
  },
  button: {
    flexDirection: "row",
    flexWrap: "wrap",
  }
})

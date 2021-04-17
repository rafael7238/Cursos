import React, { useState, useEffect } from 'react'
import PageTitle from '../../components/layout/PageTitle'
import SectionTitle from '../../components/layout/SectionTitle'

const UseEffect = (props) => {

    const [num, SetNum] = useState(1)
    const [fatorial, setFatorial] = useState(1)

    const [numCalc, setNumCalc] = useState(1)


    useEffect(function () {
        setFatorial(calcFatorial(num))
    }, [num])

    function calcFatorial(n) {
        if (n < 0) return -1
        if (n === 0) return 1
        return calcFatorial(n - 1) * n

    }

    useEffect(function () {
        if (fatorial > 1000000) {
            document.title = "Eitaaa..."
        }
        else {
            document.title = "React App;."
        }
    }, [fatorial])


    return (
        <div className="UseEffect">
            <PageTitle
                title="Hook UseEffect"
                subtitle="Permite executar efeitos colaterais em componentes funcionais!"
            />

            <SectionTitle title="Exercício #1" />
            <div className="center">
                <div>
                    <span className="text">Fatorial:</span>
                    <span className="red"> {fatorial}</span>
                </div>
                <input type="number" className="input" value={num} onChange={(e) => {
                    SetNum(e.target.valueAsNumber)
                }} />
            </div>
            <SectionTitle title="Exercício #2" />
            <div className="center">
                <div>
                    <span className="text">Par ou Impar:</span>
                    <span className="red">{num % 2 == 0 ? 'Par' : 'Impar'}</span>
                </div>
                <input type="number" className="input" value={numCalc} onChange={(e) => {
                    setNumCalc(e.target.valueAsNumber)
                }} />
            </div>
        </div>
    )
}

export default UseEffect

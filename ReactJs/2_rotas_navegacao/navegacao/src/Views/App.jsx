import React from 'react'
import Content from '../Components/Layouts/Content'
import Menu from '../Components/Layouts/Menu'
import './App.css'
import { BrowserRouter as Router } from 'react-router-dom'

export default props => {
    return (
        <div className="App">
            <Router>
                <Menu />
                <Content />
            </Router>
        </div>
    )
}
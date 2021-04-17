import React from 'react'
import './Content.css'
import { Switch, Route } from 'react-router-dom'
import About from '../../Views/examples/About'
import Home from '../../Views/examples/Home'
import Param from '../../Views/examples/Param'
import NotFound from '../../Views/examples/NotFound'


const Content = props => {
    return (
        <main className="Content">
            <Switch>

                <Route path="/about">
                    <About />
                </Route>

                <Route path="/param/:id">
                    <Param />
                </Route>

                <Route exact path="/">
                    <Home />
                </Route>

                <Route path="*">
                    <NotFound />
                </Route>

            </Switch>
        </main>
    )
}

export default Content
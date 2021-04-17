import React from 'react'
import './Menu.css'
import { Link } from 'react-router-dom'


const Menu = props => {
    return (
        <aside className="Menu">

            <nav>
                <ul>
                    <li>
                        <Link to="/"> Inicio</Link>
                    </li>
                    <li>
                        <Link to="/about"> About</Link>
                    </li>
                    <li>
                        <Link to="/param/legal"> Param #1</Link>
                    </li>
                    <li>
                        <Link to="/param"> Param #2</Link>
                    </li>
                </ul>
            </nav>
        </aside>
    )
}
export default Menu
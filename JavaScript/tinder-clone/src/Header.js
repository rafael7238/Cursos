import React from 'react'
import "./Header.css"
import PersonIcon from '@material-ui/icons/Person';
import IconButton from '@material-ui/core/IconButton';
import WhatshotIcon from '@material-ui/icons/Whatshot';
import QuestionAnswerIcon from '@material-ui/icons/QuestionAnswer';
import { AccessAlarm, ThreeDRotation } from '@material-ui/icons';



function Header(){
    return (
        <div classNam="header">
          
           <IconButton>
           <PersonIcon fontSize="large" className="header_icon" />
           </IconButton>
       
        <IconButton>
            <WhatshotIcon color="secondary" fontSize="large" className="header_logo"/>
        </IconButton>
       
        <IconButton>
            <QuestionAnswerIcon fontSize="large" className="header_message"/>
        </IconButton>
        
        </div>
    )
}

export default Header
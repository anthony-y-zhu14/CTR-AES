import React from 'react'
import { makeStyles } from '@material-ui/core/styles'
import Zoom from '@material-ui/core/Zoom';
import { Container, Icon,  InputAdornment,  TextField,  Typography, Fab, ButtonGroup, Button } from '@material-ui/core';
import VpnKeyIcon from '@material-ui/icons/VpnKey';
import HourglassEmptyIcon from '@material-ui/icons/HourglassEmpty';
import load from "./script/load"

const useStyles = makeStyles((theme) => ({
    content_email: {
      flexGrow: 1,
      padding: theme.spacing(3),
      color: "black",  
      background: "rgba(255, 255, 255, 0.5)",
      backdropFilter: 'blur(8px)',  
      textAlign: 'center',
      borderRadius: '30px',
      border: "1px solid rgb(255, 255, 255, 0.6)",
    },
    input: {
      borderRadius: '30px',
    }
  }));

export default function MainPage () {
    const classes = useStyles();

    const [encrypt, setEncrypt] = React.useState(false);
    const [decrypt, setDecrypt] = React.useState(false);
    const [key, setKey] = React.useState();
    const [counter, setCounter] = React.useState();
    const [message, setMessage] = React.useState();


    const handleEncrypt = () => {
      setEncrypt(true);
      setDecrypt(false);
      setTimeout(() => {
        console.log(load.encrypt(key, counter, message));
      }, 3000)
    }

    const handleDecrypt = () => {
      setEncrypt(false);
      setDecrypt(true);
    }

    const handleAction = () => {

      if (!key || !counter) {
        alert("Enter the key and counter")
        return;
      }
      if ( (key < 0 || key > 255) ||  (counter < 0 || counter > 255)) {
        alert("key and counter out of range")
        return;
      }
      if (!encrypt && !decrypt) {
        alert("Please choose an action")
        return;
      }
      if (!message) {
        alert("Message cannot be empty");
        return;
      }

      else if (encrypt) {
        handleEncrypt();
      }

      else if (decrypt) {
        handleDecrypt();
      }
    }

    return (
        <Zoom in={true} timeout={750}>     
        <Container>         
                  
          <Container className={classes.content_email}>   

            <Typography>Type your message</Typography>

            <br/>
            <TextField variant='outlined' label="Key" type='number' placeholder='0 - 255'
              InputProps={{ classes: {root : classes.input}, startAdornment: (<InputAdornment position='start'><Icon><VpnKeyIcon/></Icon></InputAdornment>)}}
              onChange={(e) => setKey(e.target.value)}/>
            <br/>
            <br/>
            <TextField variant='outlined' label="Counter" type='number' placeholder='0 - 255'
              InputProps={{classes: {root : classes.input},startAdornment: (<InputAdornment position='start'><Icon><HourglassEmptyIcon/></Icon></InputAdornment>)}}
              onChange={(e) => setCounter(e.target.value)}/>
            <br/>
            <br/>
            <ButtonGroup variant='outlined'>
              <Button color={encrypt? 'primary':'white'} onClick={handleEncrypt}>Encrypt</Button>
              <Button color={decrypt? 'primary':'white'} onClick={handleDecrypt}>Decrypt</Button>
            </ButtonGroup>

            <br/>  
            <br/> 
            {(encrypt || decrypt) && (
              <TextField variant='outlined' label="Text" multiline rows={4} fullWidth  
              InputProps={{classes: {root : classes.input}}}       
              inputProps={{style: {textAlign: 'center'}}}
              onChange={(e) => setMessage(e.target.value)}/>
            )}
            
            
            <br/>
            <br/>  
            <Fab color='primary' variant='extended' onClick={handleAction}>Press Me</Fab>      

          </Container>  

          

        </Container>  
      </Zoom>     
        
    )

}
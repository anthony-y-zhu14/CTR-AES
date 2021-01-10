import { makeStyles } from '@material-ui/core/styles'
import Zoom from '@material-ui/core/Zoom';
import { Container, Icon,  InputAdornment,  TextField,  Typography, Fab } from '@material-ui/core';
import VpnKeyIcon from '@material-ui/icons/VpnKey';
import HourglassEmptyIcon from '@material-ui/icons/HourglassEmpty';

const useStyles = makeStyles((theme) => ({
    content_email: {
      flexGrow: 1,
      padding: theme.spacing(3),
      marginTop: '200px',
      color: "black",  
      background: "rgba(190, 190, 190, 0.3)",
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
    return (
        <Zoom in={true} timeout={750}>     
        <Container>         
                  
          <Container className={classes.content_email}>   

            <Typography>Type your message</Typography>

            <br/>
            <TextField variant='outlined' label="Key" 
              InputProps={{ classes: {root : classes.input}, startAdornment: (<InputAdornment position='start'><Icon><VpnKeyIcon/></Icon></InputAdornment>)}}/>
            <br/>
            <br/>
            <TextField variant='outlined' label="Counter"
              InputProps={{classes: {root : classes.input},startAdornment: (<InputAdornment position='start'><Icon><HourglassEmptyIcon/></Icon></InputAdornment>)}}/>
            <br/>
            <br/>          
            <TextField variant='outlined' label="Text" multiline rows={4} fullWidth  
              InputProps={{classes: {root : classes.input}}}       
              inputProps={{style: {textAlign: 'center'}}}/>

            <br/>
            <br/>  
            <Fab color='primary' variant='extended'>Press Me</Fab>      

          </Container>  

          

        </Container>  
      </Zoom>     
        
    )

}
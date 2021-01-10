import React from 'react'
import logo from './bar-chart.svg';
import './App.css';
import Fab from "@material-ui/core/Fab"
import MainPage from './MainPage'

function App() {

  const [loaded, setLoad] = React.useState(false);

  const handleLoad = () => {
    setLoad(true);
  }

  return (
    <div className="App">
      <header className="App-header">
        {!loaded && (
          <React.Fragment>
            <img src={logo} className="App-logo" alt="logo" />
            <br/>
            <Fab variant='extended' color='primary' onClick={handleLoad}>
              Let Me Try it
            </Fab> 
          </React.Fragment>       
        )}
        {loaded && (<MainPage/>)}
      </header>
    </div>
  );
}

export default App;

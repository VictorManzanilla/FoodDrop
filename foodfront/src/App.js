import React from 'react'
import Login from './components/Login';
import Home from './components/Home'
// import Google from './components/GoogleApi'
import {Switch, Route} from 'react-router-dom'
import addUser from './components/addUser'
import './App.css'


function App() {
  return (
    <div>
       <Switch>
       {/* <Route path='/Explore' component={Google} /> */}
        <Route path='/Login' component={Login} />
        <Route path='/addUser' component={addUser} />
        {/* put routing before the one below */}
        <Route path='/' component={Home}/>
        
       </Switch>
       
    </div>
  );
}

export default App;

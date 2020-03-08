import React from 'react';
import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import { OtherPage } from './otherPage';
import { Fib } from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <h1>Fib calculator v2</h1>
          <img src={logo} className="App-logo" alt="logo" />
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other Page</Link>
          <div>
            <Route exact path="/" component={Fib}/>
            <Route exact path="/otherpage" component={OtherPage}/>
          </div>
        </header>
      </div>
    </Router>
  );
}

export default App;

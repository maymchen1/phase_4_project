// App.js
import React, { useState } from 'react';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import axios from 'axios';

import Home from './components/Home';
import UserProfile from './components/UserProfile';
import GameDetails from './components/GameDetails';

const App = () => {
    const [loggedInUser, setLoggedInUser] = useState(null);
  
    const handleLogout = () => {
      // Implement logout logic here, e.g., making a DELETE request to the backend to clear the session
      setLoggedInUser(null);
    };

    const handleLogin = (userData) => {
        // Implement login logic here, e.g., making a POST request to the backend to authenticate the user
        axios.post('/api/login', userData)
        .then((response) => {
            setLoggedInUser(response.data);
          })
          .catch((error) => {
            console.log(error);
          });
      };
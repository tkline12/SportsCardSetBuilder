import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000"
});

export default {

  getPlayers() {
    return http.get('/players');
  },

  getTeams(){
    return http.get('/teams')
  },

getSports(){
  return http.get('/sports')
},

getSets(){
  return http.get('/sets')
},

getCards(){
  return http.get('/cards')
},
}

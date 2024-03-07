import axios from 'axios';

export default {

  getPlayers() {
    return axios.get('/players');
  },

  getTeams() {
    return axios.get('/teams')
  },

  getSports() {
    return axios.get('/sports')
  },

  getSets() {
    return axios.get('/sets')
  },

  getCards() {
    return axios.get('/cards')
  },

  getCardsByPlayerId(playerId){
    return axios.get(`/cards?playerId=${playerId}`)
  },

  getCardsBySetId(setId){
    return axios.get(`/cards?setId=${setId}`)
  }
}

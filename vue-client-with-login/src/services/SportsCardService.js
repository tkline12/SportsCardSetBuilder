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

  getSubsets(){
    return axios.get(`/subsets`)
  },

  getCardsByPlayerId(playerId){
    return axios.get(`/cards/players/${playerId}`)
  },

  getCardsBySetId(setId){
    return axios.get(`/cards/sets/${setId}`)
  },

  getCardsBySubsetId(subsetId){
    return axios.get(`/cards/sets/${subsetId}`)
  }, 

  changeOwnedStatus(card){
    return axios.put('/cards', card)
  },
  addCardToUser(userId, cardId){
    return axios.post(`/users/${userId}/cards`, {userId : userId, cardId : cardId})
  },
  deleteCardFromUser(userId, cardId){
    return axios.delete(`/users/${userId}/cards/${cardId}`)
  },
  getUserCardsByUserId(userId){
    return axios.get(`/users/${userId}/cards`)
  }
}

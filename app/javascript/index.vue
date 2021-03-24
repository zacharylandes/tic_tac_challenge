<template>
  <div id="new">
		<h3>All Games</h3>
		<a href='/games/new'>New Game</a>
		<div v-for='id in games' >
			<a :href="'/games/'+id">{{id}}</a>
		</div>
  </div>
</template>
<script>
  import axios from 'axios'
	export default {
		data: function () {
			return {
				games:[]
			}
		},
		methods: {
			getGames(){
				return axios.get(`/games.json`)
					.then((response) =>{
						console.log(response.data)
							this.games = response.data.map(game=>game.id)

					})
					.catch((error) =>console.log(error))
			},
		},
  created(){
		this.getGames()
  }
}
</script>

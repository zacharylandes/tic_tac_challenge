<template>
  <div id="new">
		<h3><a href='/games'> All Games</a></h3>
		<h3> Game {{game.id}}</h3>
		<div v-for='row, outerIndex in game.board' >
			<p>
				<button @click='registerClick(outerIndex,innerIndex)'v-for='cell, innerIndex in row'>
					{{cell}}
				</button> 
			</p>
		</div>
  </div>
</template>
<script>
  import axios from 'axios'
	export default {
		data: function () {
			return {
				game:{},
				firstPlayer:true,
			}
		},
		methods: {

			registerClick(outerIndex,innerIndex){
				let data = {
					outerIndex: outerIndex,
					innerIndex: innerIndex,
					firstPlayer: this.firstPlayer,
				}
				this.firstPlayer = this.firstPlayer ? false : true
				return axios.put(`/games/${this.game.id}.json`,data)
					.then((response) =>{
						console.log(response.data)
						if(response.data.winner){
							this.board = response.data.board
							let winner = response.data.winner == "X" ? "First Player!" : "Second Player!"
							alert(`WINNER IS ${winner}`)
						}
						else{
							this.game.board = response.data.board

						}

					})
					.catch((error) =>console.log(error))
			},
			newBoard(){
				const board = new Array();
				const rows = 3;
				for (var i = 0; i < rows; i++)
						board[i] = new Array('*', '*', '*');
				return board
			},
			showGame(){
				return axios.get(`/games/${location.pathname.split('games/').pop()}.json`)
					.then((response) =>{
						this.game = response.data
					})
					.catch((error) =>console.log(error))
			}
		},
  created(){
		this.showGame()
  }
}
</script>

<template>
  <div id="new">
		<a href='/games'>All Games</a>
		<h3>New Game</h3>
		<div v-for='row, outerIndex in board' >
			<p>
				<button @click='registerClick(outerIndex,innerIndex)'v-for='cell, innerIndex in row'>
					{{cell}}
				</button> 
			</p>
		</div>
		<button @click='reload()'>New Game</button>
  </div>
</template>
<script>
  import axios from 'axios'
	export default {
		data: function () {
			return {
				board: this.newBoard(),
				id:"",
				firstPlayer:true,
				gameOver:false
			}
		},
		methods: {
			reload(){
				window.location.reload()
			},

			registerClick(outerIndex,innerIndex){
				let data = {
					outerIndex: outerIndex,
					innerIndex: innerIndex,
					firstPlayer: this.firstPlayer,
				}
				this.firstPlayer = this.firstPlayer ? false : true
				return axios.put(`/games/${this.id}.json`,data)
					.then((response) =>{
						console.log(response.data)
						if(response.data.winner){
							this.board = response.data.board
							let winner = response.data.winner == "X" ? "First Player!" : "Second Player!"
							alert(`WINNER IS ${winner}`)
						}
						else{
							this.board = response.data.board

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
			initGame(){
				return axios.get(`/games/new.json`)
					.then((response) =>{
						this.id = response.data
					})
					.catch((error) =>console.log(error))
			}
		},
  created(){
		this.initGame()
  }
}
</script>

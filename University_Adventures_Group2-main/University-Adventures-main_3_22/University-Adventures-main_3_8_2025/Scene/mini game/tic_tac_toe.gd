extends Control

var board = ["", "", "", "", "", "", "", "", ""]
var current_player = "X"
var game_over = false

@onready var buttons = $GridContainer.get_children()
@onready var result_label = $Label
@onready var restart_button = $Button

# Called when the scene is loaded
func _ready():
	for i in range(9):
		buttons[i].connect("pressed", Callable(self, "_on_cell_pressed").bind(i))  # ✅ Correct in Godot 4


# When a button (cell) is pressed
func _on_cell_pressed(index):
	if board[index] == "" and not game_over:
		board[index] = current_player
		buttons[index].text = current_player
		check_winner()
		current_player = "O" if current_player == "X" else "X"

# Check for a win or draw
func check_winner():
	var win_conditions = [
		[0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
		[0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
		[0, 4, 8], [2, 4, 6]             # Diagonals
	]
	
	for condition in win_conditions:
		var a = condition[0]
		var b = condition[1]
		var c = condition[2]
		
		if board[a] != "" and board[a] == board[b] and board[a] == board[c]:
			result_label.text = board[a] + " Wins!"
			game_over = true
			return
			
			if "" not in board:
				result_label.text = "Draw!"
				game_over = true
				
				

# Restart Game
func _restart_game():
	board = ["", "", "", "", "", "", "", "", ""]
	for button in buttons:
		button.text = ""
		result_label.text = ""
		game_over = false
		current_player = "X"

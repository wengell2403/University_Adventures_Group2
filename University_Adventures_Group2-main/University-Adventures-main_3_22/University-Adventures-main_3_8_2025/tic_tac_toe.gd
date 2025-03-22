extends Control

signal game_finished  # Create signal for ending

var board = ["", "", "", "", "", "", "", "", ""]
var current_player = "X"
var game_over = false
var buttons = []

@onready var result_label = $result_label  # Ensure this matches the node path in your scene
@onready var grid_container = $GridContainer  # Ensure this matches your scene
@onready var restart_button = $restart_button  # Ensure this matches your scene

func _ready():
	buttons = grid_container.get_children()  # Get all button nodes
	for i in range(9):
		buttons[i].connect("pressed", Callable(self, "_on_cell_pressed").bind(i))  # Connect buttons to function

	restart_button.connect("pressed", Callable(self, "_restart_game"))  # Restart game on button press

func _on_cell_pressed(index):
	if board[index] == "" and not game_over:
		board[index] = current_player
		print("Player moves: ", index, " -> ", current_player)  # Debugging
		buttons[index].text = current_player  # Set text correctly
		check_winner()
		
		if not game_over:
			current_player = "O" if current_player == "X" else "X"
			if current_player == "O":  
				ai_move()

func ai_move():
	await get_tree().create_timer(0.5).timeout  # Wait half a second before AI moves

	var available_moves = []
	for i in range(board.size()):
		if board[i] == "":
			available_moves.append(i)

	if available_moves.size() > 0:
		var move = available_moves[randi() % available_moves.size()]  # Random move
		board[move] = current_player
		buttons[move].text = current_player
		print("AI moves: ", move, " -> ", current_player)  # Debugging
		check_winner()
		
		if not game_over:
			current_player = "X"

func check_winner():
	var win_patterns = [
		[0,1,2], [3,4,5], [6,7,8],  # Rows
		[0,3,6], [1,4,7], [2,5,8],  # Columns
		[0,4,8], [2,4,6]            # Diagonals
	]
	
	for pattern in win_patterns:
		if board[pattern[0]] != "" and board[pattern[0]] == board[pattern[1]] and board[pattern[1]] == board[pattern[2]]:
			game_over = true
			result_label.text = current_player + " Wins!"  # Properly update label
			print(current_player + " Wins!")  # Debugging
			emit_signal("game_finished")  # Tell the main game that Tic-Tac-Toe ended
			return
	
	if "" not in board:
		game_over = true
		result_label.text = "Draw!"  # Properly update label
		print("Draw!")  # Debugging
		emit_signal("game_finished")  # Also remove game on draw
		

func _restart_game():
	board = ["", "", "", "", "", "", "", "", ""]  # Reset board state
	game_over = false
	current_player = "X"
	result_label.text = ""  # Clear result label

	for i in range(9):
		buttons[i].text = ""  # Reset button texts

	print("Game restarted")  # Debugging

# In your TicTacToe.gd script
signal finished

func end_game():
	emit_signal("finished")  # Call this when the game is done
	queue_free()  # Remove itself from the scene

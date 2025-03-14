extends AudioStreamPlayer

const level_music = preload("res://Assets/Game_Elements/music1.wav")
const transition_sfx = preload("res://Assets/Game_Elements/lvl_transition_music.wav") 

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)
	
func play_FX(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()
	
	
func play_transition_and_change_scene(target_level: PackedScene):
	play_FX(transition_sfx)  # Play transition SFX
	await get_tree().create_timer(0.5).timeout  # Delay to let SFX play properly
	get_tree().change_scene_to_packed(target_level)  # Now change the scene
	

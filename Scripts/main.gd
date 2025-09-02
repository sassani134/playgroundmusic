extends Node

@onready var music: AudioStreamPlayer = $AudioStreamPlayerMusic
@onready var sfx: AudioStreamPlayer = $AudioStreamPlayerSFX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MenuMusic.hidden
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		$MenuMusic.visible = !$MenuMusic.visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_sfx_pressed() -> void:
	sfx.play()
	pass # Replace with function body.


func _on_button_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		music.play()
	else :
		music.stop()
	pass # Replace with function body.

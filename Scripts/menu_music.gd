extends Control
class_name UI


@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
@onready var music_slider_label: Label = $MarginContainer/VBoxContainer/GridContainer/MusicSliderLabel
@onready var sfx_slider_label: Label = $MarginContainer/VBoxContainer/GridContainer/SFXSliderLabel

func _ready() -> void:
	music_slider_label.text = str(int($MarginContainer/VBoxContainer/GridContainer/MusicHSlider.value * 100)) + "%"
	sfx_slider_label.text = str(int($MarginContainer/VBoxContainer/GridContainer/SFXHSlider.value * 100)) + "%" 
	pass

func _on_music_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value)) #if value is 0 to 1
	#AudioServer.set_bus_volume_db(MUSIC_BUS_ID, value)
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < .05)
	music_slider_label.text = str(int(value * 100 )) + "%"
	pass # Replace with function body.

func _on_sfxh_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	#AudioServer.set_bus_volume_db(SFX_BUS_ID, value)
	AudioServer.set_bus_mute(SFX_BUS_ID, value < .05)
	sfx_slider_label.text = str(int(value * 100)) + "%"
	pass # Replace with function body.

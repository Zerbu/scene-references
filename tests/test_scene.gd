extends Control

@export var scene_to_instantiate: NamedSceneReference

func _ready():
	%Button.text = "Instantiate %s" % scene_to_instantiate.scene_name

func _on_button_pressed() -> void:
	var inst = scene_to_instantiate.instantiate()
	%VBoxContainer.add_child(inst)

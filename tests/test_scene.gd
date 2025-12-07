extends Control

# Reference to another scene (in this case, using a subclass called NamedSceneReference)
@export var scene_to_instantiate: NamedSceneReference

func _ready():
	# Set button text to use the scene name
	%Button.text = "Instantiate %s" % scene_to_instantiate.scene_name

func _on_button_pressed() -> void:
	# Instantiate the referenced scene
	var inst = scene_to_instantiate.instantiate()
	%VBoxContainer.add_child(inst)

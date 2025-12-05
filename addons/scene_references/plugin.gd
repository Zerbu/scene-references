@tool
extends EditorPlugin

var inspector: SceneInspector = SceneInspector.new()

func _enable_plugin() -> void:
	add_autoload_singleton("SceneReferenceManager", "scene_reference_manager.gd")

func _disable_plugin() -> void:
	remove_autoload_singleton("SceneReferenceManager")


func _enter_tree() -> void:
	inspector.SceneReferenceManager = get_tree().get_root().get_node("/root/SceneReferenceManager")
	add_inspector_plugin(inspector)

func _exit_tree() -> void:
	inspector.SceneReferenceManager = null
	remove_inspector_plugin(inspector)

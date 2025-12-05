@tool
extends EditorPlugin

var inspector: SceneInspector = SceneInspector.new()

func _enable_plugin() -> void:
	add_autoload_singleton("SceneReferenceManager", "scene_reference_manager.gd")
	inspector.SceneReferenceManager = get_tree().get_root().get_node("/root/SceneReferenceManager")

func _disable_plugin() -> void:
	remove_autoload_singleton("SceneReferenceManager")
	inspector.SceneReferenceManager = null


func _enter_tree() -> void:
	add_inspector_plugin(inspector)


func _exit_tree() -> void:
	remove_inspector_plugin(inspector)

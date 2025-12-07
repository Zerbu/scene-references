@tool
extends EditorPlugin

var inspector: SceneInspector = SceneInspector.new()

func _enter_tree() -> void:
	add_autoload_singleton("SceneReferenceManager", "scene_reference_manager.gd")
	
	var root = get_tree().get_root()
	inspector.SceneReferenceManager = root.get_node("/root/SceneReferenceManager")
	add_inspector_plugin(inspector)

func _exit_tree() -> void:
	remove_autoload_singleton("SceneReferenceManager")
	
	inspector.SceneReferenceManager = null
	remove_inspector_plugin(inspector)

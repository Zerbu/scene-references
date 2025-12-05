@tool
extends Node

func get_reference(root_node: Node) -> SceneReference:
	var path = get_reference_path(root_node)
	if not ResourceLoader.exists(path):
		return null
	return ResourceLoader.load(path)

func get_reference_path(root_node: Node) -> String:
	return "%s.tres" % root_node.scene_file_path.get_basename()

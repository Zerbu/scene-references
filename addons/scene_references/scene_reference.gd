extends Resource
class_name SceneReference

func get_scene_path() -> String:
	return "%s.tscn" % resource_path.get_basename()

func instantiate() -> Node:
	var packed_scene = load_packed_scene()
	if not packed_scene:
		return
	return packed_scene.instantiate()

func load_packed_scene() -> PackedScene:
	return load(get_scene_path())

extends Resource
class_name SceneReference

## Gets the path to the scene. This is the same as resource_path, but with
## the extension changed to .tscn
func get_scene_path() -> String:
	return "%s.tscn" % resource_path.get_basename()

## Creates an instance of the [PackedScene] retrieved from [load_packed_scene()]
func instantiate() -> Node:
	var packed_scene = load_packed_scene()
	if not packed_scene:
		return
	return packed_scene.instantiate()

## Loads the [PackedScene] at [get_scene_path()].
func load_packed_scene() -> PackedScene:
	return load(get_scene_path())

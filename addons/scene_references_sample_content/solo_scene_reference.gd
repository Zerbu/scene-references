## A [SceneReference] class that allows only a single instance and assigns
## that to [scene_root] when [instantiate()] is called.
## Calling [instantiate()] when an instance has already been instantiated
## (and hasn't been freed) will return the existing instance instead.
extends SceneReference
class_name SoloSceneReference

## This variable is intended to hold the root node of the scene that was
## instantiated with [instantiate()], although it can also be set manually.
var scene_root: Node

func instantiate() -> Node:
	if not scene_root:
		scene_root = super()
		SceneReferenceManager.add_child(scene_root)
	return scene_root

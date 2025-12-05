extends EditorInspectorPlugin
class_name SceneInspector

var SceneReferenceManager

func _can_handle(object: Object) -> bool:
	return object.has_method("get_owner") and object.get_owner() == null

func _parse_begin(object: Object) -> void:
	if not SceneReferenceManager: return
	
	var picker = EditorResourcePicker.new()

	picker.base_type = "SceneReference"
	picker.edited_resource = SceneReferenceManager.get_reference(object)

	picker.resource_changed.connect(
		func(resource):
			if not resource: return
			var path = SceneReferenceManager.get_reference_path(object)
			if resource.resource_path != path and not resource.resource_path.ends_with(".tres"):
				resource = resource.duplicate()
			ResourceSaver.save(resource, path)
			picker.edited_resource = SceneReferenceManager.get_reference(object)
	)

	picker.resource_selected.connect(
		func(resource, inspect):
			EditorInterface.edit_resource(resource)
	)

	add_custom_control(picker)

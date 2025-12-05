Godot offers two ways to reference scenes in variables: by using `PackedScene`, or by setting the scene path with `@export_file_path`. Both of these options come with limitations. You can't restrict a `PackedScene` or file path variable to only allow scenes with certain root nodes. They will always show every scene in the project, which may not be ideal. You also can't load information about scenes, like names, without loading the entire scene.

The solution to this is to use a `SceneReference`. A `SceneReference` is a type of resource that can be referenced by a variable and used to "link" to a scene. This plugin provides a `SceneReference` base class with, `instantiate` and `load_packed_scene` functions, which will load or instantiate the identically named `".tscn"` file.

This plugin adds a custom inspector to the top of all scene root nodes that lets you quickly create resources without having to go through the process of manually creating resources through the "Create New" menu. Just click the dropdown arrow, select either `"SceneReference"` or a subclass, and it will automatically create an identically named .tres file. If you try to assign an existing resource, it will automatically create a duplicate. Clicking on the resource picker opens the resource in the inspector.

You can create your own resource class that inherits `SceneReference`. So, unlike with a `PackedScene` or file path, you can restrict a variable to only show certain types of scenes. On top of that, you can add additional data to a reference such as a name of description, and use that data without having to load the entire scene.

![scene-references](https://github.com/Zerbu/scene-references/blob/main/.screenshots/scene-references.png)
![scene-references-example](https://github.com/Zerbu/scene-references/blob/main/.screenshots/scene-references-example.png)

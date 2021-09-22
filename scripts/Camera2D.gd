extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Wait until the frame has finished before getting the texture.
	yield(VisualServer, "frame_post_draw")
	# You can get the image after this.
	# Retrieve the captured Image using get_data().
	var img = get_viewport().get_texture().get_data()
	# Flip on the Y axis.
	# You can also set "V Flip" to true if not on the root Viewport.
	img.flip_y()
	# Convert Image to ImageTexture.
	var tex = ImageTexture.new()
	
	img.save_png("D:/Godot projects/a.png")

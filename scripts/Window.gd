extends Control

var pressed = false
var dragging = false
var offset = Vector2()

#######

func _gui_input(event):
	if Input.is_action_just_pressed("left_click") and is_mouse_on_panel():
		pressed = true
		offset = compute_offset()
	
	elif Input.is_action_just_released("left_click"):
		pressed = false
		dragging = false
	
	elif pressed and event is InputEventMouseMotion:
		dragging = true

func _process(delta):
	if dragging:
		set_position(get_global_mouse_position() + offset)

#######

func is_mouse_on_panel():
	return $Panel.get_global_rect().has_point(get_global_mouse_position())

func compute_offset():
	return $Panel.get_global_position() - get_global_mouse_position()

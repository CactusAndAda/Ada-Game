extends Area2D

var entered = false

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://LivingRoom.tscn")
		elif Input.is_action_just_pressed("MOUSE"):
			get_tree().change_scene("res://LivingRoom.tscn")
		else:
			entered == false

func _on_CityToAdaHome_body_entered(body: Node) -> void:
	entered = true


func _on_CityToAdaHome_body_exited(body: Node) -> void:
	entered = false

extends Area2D

var entered = false
	
func _process(delta):
	if entered == true:
			get_tree().change_scene("res://KITCHEN.tscn")

func _on_Area2D_body_entered(body: Node) -> void:
	entered = true


func _on_Area2D_body_exited(body: Node) -> void:
	entered = false

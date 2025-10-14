extends Node2D

var qnt : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	qnt = get_tree().get_nodes_in_group("quest1").size()

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	if qnt <= 0:
		GlobalVariables.quest_completed.append("Utah")
		return
	qnt -= 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends NPCBase

var player_inside := false

func _ready() -> void:
	player_inside = false

func _on_area_2d_body_entered(_body: Node2D) -> void:
	player_inside = true
	if player_inside:
		playerEnteredArea()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	player_inside = false
	if !player_inside:
		playerGotOutArea()
		mural_npc2.visible = false
		painel_label_warning.visible = false

func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("mural_quests"):
		if !GlobalVariables.mural1_completed:
			warning("Ops", "Necesario completar missao 1")
			return
		mural("npc2")

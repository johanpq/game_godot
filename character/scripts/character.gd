extends CharacterBody2D
class_name PlayerCharacter  # nome da classe

@export_category("Variables")
@export var move_speed: float = 40.0
@export var friction: float = 0.2
@export var acceleration: float = 0.2

@export_category("Objects")
@export var animation_tree: AnimationTree

# --- Variáveis internas ---
var state_machine

func _ready() -> void:
	# Se não tiver atribuído no inspetor, pega pelo nome
	if animation_tree == null:
		animation_tree = $AnimationTree
	
	if animation_tree:
		state_machine = animation_tree.get("parameters/playback")
	else:
		push_error("AnimationTree não encontrado!")

func _physics_process(_delta: float) -> void:
	_move(_delta)
	_animate()
	move_and_slide()

# --- Método de movimento ---
func _move(_delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if direction != Vector2.ZERO:
		var normalized_dir = direction.normalized()
		
		velocity.x = lerp(velocity.x, normalized_dir.x * move_speed, acceleration)
		velocity.y = lerp(velocity.y, normalized_dir.y * move_speed, acceleration)
		
		if animation_tree:
			animation_tree["parameters/idle/blend_position"] = normalized_dir
			animation_tree["parameters/walk/blend_position"] = normalized_dir
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
		velocity.y = lerp(velocity.y, 0.0, friction)

# --- Método de animação ---
func _animate() -> void:
	if state_machine == null:
		return
	
	if velocity.length() > 10:
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")

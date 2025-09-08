extends CharacterBody2D

@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _friction: float = 0.2 # Fricao para parar
@export var _acceleration: float = 0.2 # Aceleracao 
@export_category("Objects")
@export var _animation_tree: AnimationTree
	
var _state_machine

func _ready() -> void:
	# Se não tiver atribuído no inspetor, pega pelo nome
	if _animation_tree == null:
		_animation_tree = $AnimationTree
	
	if _animation_tree:
		_state_machine = _animation_tree["parameters/playback"]
	else:
		push_error("AnimationTree não encontrado!")

func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()

func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	if _direction != Vector2.ZERO: # Se for diferente de (0,0)
		#interpolacao 
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	
	velocity = _direction.normalized() * _move_speed

	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction

		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, _friction)
		velocity.y = lerp(velocity.y, 0.0, _friction)

func _animate() -> void:
	if velocity.length() > 10:
		_state_machine.travel("walk")
	else:
		_state_machine.travel("idle")

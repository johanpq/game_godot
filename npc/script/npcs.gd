extends Node2D
class_name Npc

@export var quest_title: String = "Quest"
@export var quest_text: String = "Apanhe o lixo"

# Sprites para animacao
@export var sprite_frames: SpriteFrames        
@export var animation_name: String = "default"    

@export var labelKeyboard: Node2D
@export var mural_npc: PanelContainer
@export var title_mural: RichTextLabel
@export var text_mural: RichTextLabel

var player_in_area = false
@onready var sprite: AnimatedSprite2D = $Npc/Texture

func _ready() -> void:
	if sprite and sprite_frames:
		sprite.sprite_frames = sprite_frames   # aplica o recurso exportado
		if sprite_frames.has_animation(animation_name):
			sprite.play(animation_name)
		else:
			print("Animacao não encontrada: ", animation_name)

	# Oculta o teclado no início
	if labelKeyboard:
		labelKeyboard.visible = false

func open_label_keyboard(_keyboard: String):
	var label_label = labelKeyboard.get_node("Label") as Label
	labelKeyboard.visible = true
	label_label.text = _keyboard

func close_label_keyboard():
	labelKeyboard.visible = false

func mural():
	if mural_npc.visible:
		mural_npc.visible = false
	else:
		title_mural.text = quest_title
		text_mural.text = quest_text
		mural_npc.visible = true

func in_area(_body: Node2D) -> void:
	player_in_area = true
	open_label_keyboard("i")

func out_area(_body: Node2D) -> void:
	player_in_area = false
	close_label_keyboard()

func _process(_delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("mural_quests"):
		mural()

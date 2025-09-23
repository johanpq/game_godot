extends Node2D
class_name Npc

# Lista de falas exportadas — dá pra editar no Inspector
@export var dialogues: Array[String] = [
	"Olá, aventureiro!",
	"Preciso que você colete o lixo da vila.",
	"Volte aqui quando terminar!"
]

@export var sprite_frames: SpriteFrames
@export var animation_name: String = "default"

@export var labelKeyboard: Node2D
@export var mural_npc: PanelContainer
@export var name_npc: String
@export var title_mural: RichTextLabel
@export var text_mural: RichTextLabel

var player_in_area = false
var dialogue_index: int = 0
var dialogue_open: bool = false

@onready var sprite: AnimatedSprite2D = $Npc/Texture

func _ready() -> void:
	if sprite and sprite_frames:
		sprite.sprite_frames = sprite_frames
		if sprite_frames.has_animation(animation_name):
			sprite.play(animation_name)

	if labelKeyboard:
		labelKeyboard.visible = false

	if mural_npc:
		mural_npc.visible = false

# Abre/fecha o painel de diálogo
func toggle_dialogue():
	if not dialogue_open:
		# começa o diálogo
		dialogue_index = 0
		_show_current_dialogue()
		GlobalVariables.quest_open = true
		mural_npc.visible = true
		dialogue_open = true
	else:
		_next_dialogue()

# Mostra a fala atual
func _show_current_dialogue():
	if dialogues.size() > 0 and dialogue_index < dialogues.size():
		title_mural.text = name_npc
		text_mural.text = dialogues[dialogue_index]
	else:
		# se não tiver mais falas, fecha
		_close_dialogue()

# Vai para a próxima fala
func _next_dialogue():
	dialogue_index += 1
	if dialogue_index < dialogues.size():
		_show_current_dialogue()
	else:
		_close_dialogue()

# Fecha diálogo
func _close_dialogue():
	GlobalVariables.quest_open = false
	mural_npc.visible = false
	dialogue_open = false
	dialogue_index = 0

func open_label_keyboard(_keyboard: String):
	var label_label = labelKeyboard.get_node("Label") as Label
	labelKeyboard.visible = true
	label_label.text = _keyboard

func close_label_keyboard():
	labelKeyboard.visible = false

func in_area(_body: Node2D) -> void:
	player_in_area = true
	open_label_keyboard("i")

func out_area(_body: Node2D) -> void:
	player_in_area = false
	close_label_keyboard()
	_close_dialogue()

func _process(_delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("mural_quests"):
		toggle_dialogue()

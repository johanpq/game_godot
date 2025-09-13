extends Node2D
class_name NPCBase

# classe, por ter ja o node2d herdado nao e possivel herdar essa classe por extends´
@export var LabelKeyboardClass: LabelKeyboard

@export var labelKeyboard: Node2D
@export var mural_npc1: PanelContainer
@export var mural_npc2: PanelContainer
@export var painel_label_warning: PanelContainer
@export var label_warning_title: RichTextLabel
@export var label_warning_text: RichTextLabel 
var mural_open := false
var current_mural: PanelContainer = null

func _ready() -> void:
	var label_keyboard = labelKeyboard.get_node("Label") as Label
	labelKeyboard.visible = false
	
func open_label_keyboard(_keyboard: String):
	var label_keyboard = labelKeyboard.get_node("Label") as Label
	labelKeyboard.visible = true
	label_keyboard.text = _keyboard

func close_label_keyboard():
	var label_keyboard = labelKeyboard.get_node("Label") as Label
	labelKeyboard.visible = false

func mural(which: String):
	if which == "npc1":
		if mural_npc1.visible:
			mural_npc1.visible = false
		else:
			mural_npc1.visible = true
			
	if which == "npc2":
		if mural_npc2.visible:
			mural_npc2.visible = false
		else:
			mural_npc2.visible = true
			

func warning(title: String, text: String):
	if painel_label_warning.visible:
		painel_label_warning.visible = false
	else:
		label_warning_title.text = title
		label_warning_text.text = text
		painel_label_warning.visible = true

func playerEnteredArea():
	open_label_keyboard("i")

func playerGotOutArea():
	close_label_keyboard()

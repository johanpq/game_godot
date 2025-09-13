extends Node2D
class_name LabelKeyboard

@export var label_keyboard: Label

func setKeyboard(_keyboard: String):
	var label = label_keyboard.get_node("Label") as Label
	label.text = _keyboard

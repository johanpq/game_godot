extends Node2D
class_name LabelKeyboard

@export var label_keyboard: Label

func setKeyboard(_keyboard: String):
	label_keyboard.text = _keyboard

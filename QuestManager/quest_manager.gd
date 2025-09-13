# QuestManager.gd
extends Node
class_name QuestManager

var missions_completed = {}

func complete_mission(mission_name: String) -> void:
	missions_completed[mission_name] = true

func is_completed(mission_name: String) -> bool:
	return missions_completed.has(mission_name) and missions_completed[mission_name]

extends Node

func _ready():
	randomize()
	var isClient = ProjectSettings.get_setting("Config/IsClient")
	if OS.has_feature("Server") or not isClient:
		get_tree().change_scene("res://Server/Server.tscn")
	else:
		get_tree().change_scene("res://Client/Client.tscn")


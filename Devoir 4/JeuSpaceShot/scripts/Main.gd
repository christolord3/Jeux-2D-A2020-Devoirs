extends Node2D

# Jeu fait par Christopher Boisvert © 2020 - Tous droits reservés.


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_aread2DStart_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("TODO: Start game !");


func _on_aread2DOptions_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("TODO: Options of game !");


func _on_area2DQuitter_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Quitting game !");
		get_tree().quit();

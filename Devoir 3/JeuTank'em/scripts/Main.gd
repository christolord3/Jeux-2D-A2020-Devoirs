extends Node

var tableaux_munitions;
onready var joueur = $Joueur;
onready var munition = preload("res://scenes/Munitions.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	tableaux_munitions = [];

func _process(delta):
	if Input.is_action_just_pressed("ui_shoot"):
		var new_munition = munition.instance(joueur.rotation);
		new_munition.position = joueur.position;
		new_munition.rotation = joueur.rotation;
		self.add_child(new_munition);
		tableaux_munitions.append(new_munition);
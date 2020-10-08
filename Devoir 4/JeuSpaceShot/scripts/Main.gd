# Jeu fait par Christopher Boisvert © 2020 - Tous droits reservés.
extends Node2D

#Variables
var timer_logo;
var timer_bouton_start;
var timer_bouton_options;
var timer_bouton_quitter;
onready var logo = $Logo;
onready var boutonStart = $BoutonStart;
onready var boutonOptions = $BoutonOptions;
onready var boutonQuitter = $BoutonQuitter;

# Fonction _ready
# On passe sans rien faire !
func _ready():
	
	# On instancie les timers
	timer_logo = Timer.new();
	timer_bouton_start = Timer.new();
	timer_bouton_options = Timer.new();
	timer_bouton_quitter = Timer.new();
	
	timer_logo.set_wait_time(1);
	timer_bouton_start.set_wait_time(2);
	timer_bouton_options.set_wait_time(3);
	timer_bouton_quitter.set_wait_time(4);
	
	timer_logo.connect("timeout",self,"_on_timer_timeout_logo");
	timer_bouton_start.connect("timeout",self,"_on_timer_timeout_bouton_start");
	timer_bouton_options.connect("timeout",self,"_on_timer_timeout_bouton_options");
	timer_bouton_quitter.connect("timeout",self,"_on_timer_timeout_bouton_quitter");
	
	add_child(timer_logo);
	add_child(timer_bouton_start);
	add_child(timer_bouton_options);
	add_child(timer_bouton_quitter);
	
	timer_logo.start();
	timer_bouton_start.start();
	timer_bouton_options.start();
	timer_bouton_quitter.start();

# Fonction _on_aread2DStart_input_event
# Survient quand un événement est généré par area2DStart
# Si l'événement est un clic, on change de scène
func _on_aread2DStart_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://scenes/Jeu.tscn");

# Fonction _on_aread2DOptions_input_event
# Survient quand un événement est généré par aread2DOptions
# Si l'événement est un clic, on change de scène
func _on_aread2DOptions_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://scenes/Options.tscn");

# Fonction _on_area2DQuitter_input_event
# Survient quand un événement est généré par area2DQuitter
# Si l'événement est un clic, on ferme le programme
func _on_area2DQuitter_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("Quitting game !");
		get_tree().quit();
		
func _on_timer_timeout_logo():
	logo.visible = true;
	
func _on_timer_timeout_bouton_start():
	boutonStart.visible = true;
	
func _on_timer_timeout_bouton_options():
	boutonOptions.visible = true;
	
func _on_timer_timeout_bouton_quitter():
	boutonQuitter.visible = true;

extends Node


onready var compteurPoint = $CompteurPoint;
onready var boutonFinJeu =  $RetourMenu;
onready var texteFinJeu = $TexteFinJeu;
onready var joueur = $Joueur;
var points = 0;
var en_jeu = true;

func _ready():
	pass

func _process(delta):
	if en_jeu:
		verifierEnJeu();
		afficherPoints();
	else:
		afficherMenuSortie();

func verifierEnJeu():
	en_jeu = joueur.en_vie

func changerPoints(nouveauPoints):
	points += nouveauPoints;

func afficherPoints():
	compteurPoint.text = str(points) + " points";
	
func afficherMenuSortie():
	texteFinJeu.visible = true;
	boutonFinJeu.visible = true;


func _on_area2DRetourMenu_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://scenes/Main.tscn");

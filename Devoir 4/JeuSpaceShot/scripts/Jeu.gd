extends Node


onready var compteurPoint = $CompteurPoint;
onready var boutonFinJeu =  $RetourMenu;
onready var texteFinJeu = $TexteFinJeu;
onready var joueur = $Joueur;
const asteroides = preload("res://scenes/Asteroides.tscn");
var points = 0;
var en_jeu = true;
var timer = null;
var secondes = 0;

func _ready():
	timer = Timer.new();
	timer.connect("timeout", self, "_on_timer_timeout_asteroides");
	add_child(timer);
	timer.start();

func _process(delta):
	if en_jeu:
		verifierEnJeu();
		afficherPoints();
	else:
		afficherMenuSortie();

func verifierEnJeu():
	en_jeu = joueur.en_vie;

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

func _on_timer_timeout_asteroides():
	if(secondes == 2):
		
		secondes = 0;
		var nouveauAsteroides = asteroides.instance();
		var positionEcran = round(rand_range(0,5));
		
		if(positionEcran == 1):
			nouveauAsteroides.global_position.x = 0;
			nouveauAsteroides.global_position.y = round(rand_range(0,600));
			add_child(nouveauAsteroides);
		elif(positionEcran == 2):
			nouveauAsteroides.global_position.x = round(rand_range(0,1024));
			nouveauAsteroides.global_position.y = 0;
			add_child(nouveauAsteroides);
		elif(positionEcran == 3):
			nouveauAsteroides.global_position.x = 1024;
			nouveauAsteroides.global_position.y = round(rand_range(0,600));
			add_child(nouveauAsteroides);
		elif(positionEcran == 3):
			nouveauAsteroides.global_position.x = round(rand_range(0,1024));
			nouveauAsteroides.global_position.y = 600;
			add_child(nouveauAsteroides);
	else:
		secondes += 1;

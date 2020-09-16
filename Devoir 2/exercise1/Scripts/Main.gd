extends Node

var supposition = 500;
var valeur_minimale = 0;
var valeur_maximale = 1000;
var fin = false;
var response_recu = false;
var tab_response = [];
var rejouer = false;

# Initialise le jeu Devin des nombres
func _ready():
	var message_intro = ["-------------------------","Bonjour, je suis le devin des nombres!","-------------------------"];
	var explication_jeu = "Je vais deviner le nombre auquel tu penses entre " + str(valeur_minimale) + " et " + str(valeur_maximale) + " !";
	
	for valeur_tableau in message_intro:
		print(valeur_tableau);	
	print(explication_jeu);
	print("Est-ce votre nombre est : " + str(supposition));
	print("Cliquer sur la flèche haut si le chiffre est plus grand que ma supposition ou la flèche bas s'il est plus petit !");

# Questionne le joueur à propos de son nombre
func _process(delta):
	if fin == false:
		if response_recu == true:
			print("Est-ce votre nombre est : " + str(supposition));
			print("Cliquer sur la flèche haut si le chiffre est plus grand que ma supposition ou la flèche bas s'il est plus petit !");
			response_recu = false;
		else:
			if Input.is_action_just_pressed("NombrePlusGrand"):
				_essai(true);
			if Input.is_action_just_pressed("NombrePlusPetit"):
				_essai(false);
			if Input.is_action_just_pressed("MachineSucces"):
				print("J'ai trouvé votre nombre !");
				print("Presser ESPACE pour rejouer !");
				fin = true;
	else:
		if rejouer == true:
			get_tree().reload_current_scene();
		else:
			if Input.is_action_just_pressed("MachineSucces"):
				rejouer = true;

func _essai(est_plus_grand):
	response_recu = true;
	if est_plus_grand == true:
		valeur_minimale = supposition;
		if valeur_minimale != valeur_maximale - 1:
			supposition = _trouver_supposition();
		else:
			print("Vous avez tricher !");
			print("Presser ESPACE pour rejouer !");
			fin = true;
	else:
		valeur_maximale = supposition;
		if valeur_minimale != valeur_maximale - 1:
			supposition = _trouver_supposition();
		else:
			print("Vous avez tricher !");
			print("Presser ESPACE pour rejouer !");
			fin = true;

func _trouver_supposition():
	var nouvelle_supposition_valide = false;
	var nouvelle_supposition = null;
	
	if tab_response.size() == 0:
		nouvelle_supposition = round(rand_range(valeur_minimale,valeur_maximale));
		tab_response.append(nouvelle_supposition);
		return nouvelle_supposition;
	else:
		while(nouvelle_supposition_valide == false):
			nouvelle_supposition = round(rand_range(valeur_minimale,valeur_maximale));
			for i in tab_response:
				if i == nouvelle_supposition:
					nouvelle_supposition_valide = false;
					break;
				else:
					nouvelle_supposition_valide = true;
		tab_response.append(nouvelle_supposition);
		return nouvelle_supposition;
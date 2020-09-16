extends Node

var supposition = 500;
var valeur_minimale = 0;
var valeur_maximale = 1000;
var fin = false;
var response_recu = false;
var tab_response = [];
var rejouer = false;

onready var consoleJeu = $ConsoleJeu; 

# Initialise le jeu Devin des nombres
func _ready():
	var message_intro = ["-------------------------","Bonjour, je suis le devin des nombres!","-------------------------"];
	var explication_jeu = "Je vais deviner le nombre auquel tu penses entre " + str(valeur_minimale) + " et " + str(valeur_maximale) + " !";
	
	for valeur_tableau in message_intro:
		_ecrire_console(valeur_tableau,false);	
	_ecrire_console(explication_jeu,false);
	_ecrire_console("Cliquer sur bouton 'Plus haut'/Flèche Haut si votre nombre est plus grand que ma supposition\n ou le bouton 'Plus bas'/Flèche bas s'il est plus petit !",false);
	_ecrire_console("Cliquer sur ESPACE ou le bouton à cet effet si le jeu à trouver votre nombre !",false);
	_ecrire_console("Est-ce votre nombre est " + str(supposition) + " ?",false);

# Questionne le joueur à propos de son nombre
func _process(delta):
	if fin == false:
		if response_recu == true:
			_ecrire_console("Est-ce votre nombre est " + str(supposition) + " ?",true);
			_ecrire_console("Cliquer sur bouton 'Plus haut'/Flèche Haut si votre nombre est plus grand que ma supposition\n ou le bouton 'Plus bas'/Flèche bas s'il est plus petit !",false);
			response_recu = false;
		else:
			if Input.is_action_just_pressed("NombrePlusGrand"):
				_essai(true);
			if Input.is_action_just_pressed("NombrePlusPetit"):
				_essai(false);
			if Input.is_action_just_pressed("MachineSucces"):
				_ecrire_console("J'ai trouvé votre nombre !",true);
				_ecrire_console("Presser ESPACE pour rejouer !",false);
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
			_ecrire_console("Vous avez tricher !",true);
			_ecrire_console("Presser ESPACE pour rejouer !",false);
			fin = true;
	else:
		valeur_maximale = supposition;
		if valeur_minimale != valeur_maximale - 1:
			supposition = _trouver_supposition();
		else:
			_ecrire_console("Vous avez tricher !",true);
			_ecrire_console("Presser ESPACE pour rejouer !",false);
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

func _on_BoutonPlusGrand_pressed():
	_essai(true);


func _on_BoutonPlusPetit_pressed():
	_essai(false);
	
func _ecrire_console(texte_a_ecrire,effacer_texte):
	if effacer_texte == true:
		consoleJeu.text = "";
	consoleJeu.text += texte_a_ecrire + "\n";

func _on_BoutonTrouver_pressed():
	_ecrire_console("J'ai trouvé votre nombre !",true);
	_ecrire_console("Presser ESPACE pour rejouer !",false);
	fin = true;


func _on_QuitterJeu_pressed():
	get_tree().quit();

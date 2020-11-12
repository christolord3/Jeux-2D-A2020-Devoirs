extends KinematicBody2D

onready var joueurAnimation = $JoueurAnimation;
export(int) var nombreVie = 3;
var vitesse = 400;
var velocity = Vector2();
var gravity = 250;
var jump_speed = -225;
var jumping = false;

func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x = vitesse;
		joueurAnimation.flip_h = false;
		joueurAnimation.play();
	if Input.is_action_pressed("ui_left"):
		velocity.x = -vitesse;
		joueurAnimation.flip_h = true;
		joueurAnimation.play();
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		jumping = true;
		velocity.y = jump_speed;
	if Input.is_action_just_released("ui_left"):
		velocity.x = 0
		joueurAnimation.stop();
		joueurAnimation.frame = 0;
	if Input.is_action_just_released("ui_right"):
		velocity.x = 0
		joueurAnimation.stop();
		joueurAnimation.frame = 0;
	
func retirer_vie():
	nombreVie -= 1;
	if(nombreVie == 2):
		var vie3 = get_parent().get_node("Interface/Vie3");
		vie3.visible = false;
	if(nombreVie == 1):
		var vie2 = get_parent().get_node("Interface/Vie2");
		vie2.visible = false;
	if(nombreVie == 0):
		var vie1 = get_parent().get_node("Interface/Vie1");
		vie1.visible = false;
	
func collision():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if(collision.collider.is_in_group("Magma")):
			var plateforme_debut = get_parent().get_node("PlateformeDepart");
			position.x = plateforme_debut.position.x + 30;
			position.y = plateforme_debut.position.y - 20;
			retirer_vie();
		if(collision.collider.name == "PlateformeFin"):
			var message = get_parent().get_node("Interface/Message");
			var fond_succes = get_parent().get_node("Interface/CouleurSucces");
			var bouton_recommencer = get_parent().get_node("Interface/BoutonRecommencer");
			message.visible = true;
			message.text = "Vous avez gagné !";
			fond_succes.visible = true;
			bouton_recommencer.visible = true;
			
func _physics_process(delta):
	if nombreVie != 0 :
		collision();
		get_input();
		velocity.y += gravity * delta;
		if jumping and is_on_floor():
			jumping = false;
		velocity = move_and_slide(velocity, Vector2(0,-1))
	else:
		var message = get_parent().get_node("Interface/Message");
		var fond_succes = get_parent().get_node("Interface/CouleurMort");
		var bouton_recommencer = get_parent().get_node("Interface/BoutonRecommencer");
		message.visible = true;
		message.text = "Vous êtes mort :O !";
		fond_succes.visible = true;
		bouton_recommencer.visible = true;

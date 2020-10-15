extends KinematicBody2D

export var vie = 3;
var vitesse = 250
var velocite = Vector2()
const laser = preload("res://scenes/Laser.tscn");
onready var position2DCanon = $Position2DCanon;

func _ready():
	pass

func _physics_process(delta):
	mouvements()
	tirer()
	teleporter()

func _process(delta):
	pass
		
func mouvements():
	#On vérifie si le joueur bouge
	var avancer = Input.is_action_pressed("ui_up")
	#On calcule la direction entre le joueur et la souris
	var dir = get_global_mouse_position() - global_position
	
	#Si on avance
	if avancer:
		#Si la distance entre la souris et le joueur est plus grand 30 pixels
		#On bouge selon la vitesse prévue
		if dir.length() > 40:
			vitesse = 250;
			velocite = Vector2(vitesse, 0).rotated(rotation)
	else:
		vitesse = vitesse - 5;
		if vitesse <= 0:
			vitesse = 0;
		velocite = Vector2(vitesse, 0).rotated(rotation)
	velocite = move_and_slide(velocite)
	#On change la direction du vaisseau selon la souris
	if dir.length() > 5:
		rotation = dir.angle()

func teleporter():
	if position.x <= 10:
		position.x = 1013;
	elif position.x >= 1013:
		position.x = 10;
	elif position.y <= 10:
		position.y = 590;
	elif position.y >= 590:
		position.y = 10;

func tirer():
	if Input.is_action_just_pressed("ui_tirer"):
		var nouveauLaser = laser.instance();
		nouveauLaser.global_position = position2DCanon.global_position;
		nouveauLaser.global_rotation = global_rotation;
		get_parent().add_child(nouveauLaser);
		
func enlever_vie():
	vie -= 1;

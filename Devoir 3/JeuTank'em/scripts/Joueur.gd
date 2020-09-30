extends KinematicBody2D

var velocity;
var speed;
var tableau_des_munitions;
var vitesse_rotation;
onready var boutCanon = $BoutCanon;
onready var munition = preload("res://scenes/Munitions.tscn");

func _ready():
	velocity = Vector2(0,0);
	speed = 100;
	vitesse_rotation = 5;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouvement_joueur(delta);

func mouvement_joueur(delta):
	# On reset le mouvement
	velocity = Vector2(0,0);
	move_and_slide(velocity);
	
	#Si un utilisateur fait un mouvement alors on bouge
	if Input.is_action_pressed("ui_left"):
		var next_rotation = vitesse_rotation * delta;
		rotate(next_rotation);
	if Input.is_action_pressed("ui_right"):
		var next_rotation = (vitesse_rotation * -1) * delta;
		rotate(next_rotation);
	if Input.is_action_pressed("ui_forward"):
		velocity = Vector2(0,-1).rotated(rotation);
		velocity = velocity * speed;
		move_and_slide(velocity);
	if Input.is_action_pressed("ui_backward"):
		velocity = Vector2(0,1).rotated(rotation);
		velocity = velocity * speed;
		move_and_slide(velocity);
	if Input.is_action_just_pressed("ui_shoot"):
		var new_munition = munition.instance();
		new_munition.start(boutCanon.global_position,rotation);
		get_parent().add_child(new_munition);

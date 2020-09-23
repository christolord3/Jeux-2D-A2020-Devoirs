extends KinematicBody2D

var velocity;
var speed;
var tableau_des_munitions;
onready var scene = preload("res://scenes/Munitions.tscn");

func _ready():
	velocity = Vector2(0,0);
	speed = 100;
	tableau_des_munitions = [];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouvement_joueur(delta);
	actions_joueur();
	
func actions_joueur():
	if Input.is_action_just_pressed("ui_shoot"):
		self.add_child(scene.instance());

func mouvement_joueur(delta):
	# On reset le mouvement
	velocity = Vector2(0,0);
	move_and_slide(velocity);
	
	#Si un utilisateur fait un mouvement alors on bouge
	if Input.is_action_pressed("ui_forward"):
		velocity = Vector2(0,-1).rotated(self.rotation);
		velocity = velocity * speed;
		move_and_slide(velocity);
	if Input.is_action_pressed("ui_backward"):
		velocity = Vector2(0,1).rotated(self.rotation);
		velocity = velocity * speed;
		move_and_slide(velocity);
	if Input.is_action_pressed("ui_left"):
		self.rotate(5 * delta);
	if Input.is_action_pressed("ui_right"):
		self.rotate(-5 * delta);
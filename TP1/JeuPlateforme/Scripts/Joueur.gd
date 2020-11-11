extends KinematicBody2D

onready var joueurAnimation = $JoueurAnimation;
export(int) var nombreVie;
var vitesse = 400;
var velocity = Vector2();
var gravity = 250;
var jump_speed = -250;
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

func _physics_process(delta):
	get_input();
	print(str(velocity.y))
	velocity.y += gravity * delta;
	print(str(velocity.y))
	if jumping and is_on_floor():
		jumping = false;
	velocity = move_and_slide(velocity, Vector2(0,-1))

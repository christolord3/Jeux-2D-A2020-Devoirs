extends KinematicBody2D

onready var animationLaser = $animationLaser;
var velocite;
var vitesse = 10;

func _ready():
	animationLaser.play("default");
	velocite = Vector2(vitesse,0).rotated(rotation);

func _process(delta):
	move_and_collide(velocite);

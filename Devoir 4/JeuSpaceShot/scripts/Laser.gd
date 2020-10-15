extends KinematicBody2D

onready var animationLaser = $animationLaser;
var velocite;
var vitesse = 10;

func _ready():
	animationLaser.play("default");
	velocite = Vector2(vitesse,0).rotated(rotation);

func _process(delta):
	var collision = move_and_collide(velocite);
	if collision:
		if collision.collider.has_method("exploser"):
			collision.collider.exploser();
			get_parent().remove_child(self);

extends KinematicBody2D

onready var animationSpriteAsteroides = $AnimatedSpriteAsteroides;
var velocite = Vector2(0,0);
var vitesse = 100;

func _ready():
	animationSpriteAsteroides.play("default");

func _process(delta):
	mouvements(delta);
	teleporter();

func mouvements(delta):
	if global_position.x == 0:
		velocite = Vector2(vitesse * delta,0);
	elif global_position.x == 1024:
		velocite = Vector2(-vitesse * delta,0);
	elif global_position.y == 0:
		velocite = Vector2(0,vitesse * delta);
	elif global_position.y == 600:
		velocite = Vector2(0,-vitesse * delta);
	var collision = move_and_collide(velocite);
	if collision:
		velocite = velocite.bounce(collision.normal);

func teleporter():
	if position.x <= 0:
		position.x = 1024;
	elif position.x >= 1024:
		position.x = 0;
	elif position.y <= 0:
		position.y = 600;
	elif position.y >= 600:
		position.y = 0;

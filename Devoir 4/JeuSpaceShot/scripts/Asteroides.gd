extends KinematicBody2D

onready var animationSpriteAsteroides = $AnimatedSpriteAsteroides;
export var velocite = Vector2(0,0);
export var est_complet = true;
var vitesse = 100;
var asteroides = load("res://scenes/Asteroides.tscn");

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
		if collision.collider.has_method("enlever_vie"):
			exploser();
			collision.collider.enlever_vie();
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
		
func exploser():
	if est_complet == true:
		var nouveauAsteroides_1 = asteroides.instance();
		var nouveauAsteroides_2 = asteroides.instance();
		nouveauAsteroides_1.est_complet = false;
		nouveauAsteroides_2.est_complet = false;
		nouveauAsteroides_1.global_position = global_position;
		nouveauAsteroides_2.global_position.x = global_position.x + round(rand_range(0,5));
		nouveauAsteroides_2.global_position.y = global_position.y + round(rand_range(0,5));
		nouveauAsteroides_1.velocite = velocite;
		nouveauAsteroides_2.velocite = -velocite;
		nouveauAsteroides_1.scale = Vector2(.5,.5);
		nouveauAsteroides_2.scale = Vector2(.5,.5);
		get_parent().augmenterPoints(100);
		get_parent().add_child(nouveauAsteroides_1);
		get_parent().add_child(nouveauAsteroides_2);
		get_parent().remove_child(self);
	else:
		get_parent().augmenterPoints(50);
		get_parent().remove_child(self);

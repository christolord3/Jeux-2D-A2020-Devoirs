extends KinematicBody2D

onready var animationMunition = $AnimationMunition;
var velocity;
var speed = 250;
var timer_avant_explosion;
var timer_apres_explosion;
var exploded = false;

func _ready():
	animationMunition.play();
	
	#Compte le temps avant explosion
	timer_avant_explosion = Timer.new();
	timer_avant_explosion.set_wait_time(1);
	timer_avant_explosion.connect("timeout",self,"_on_timer_timeout_avant_explosion");
	add_child(timer_avant_explosion);
	timer_avant_explosion.start();
	
	#Comptera le temps après explosion
	timer_apres_explosion = Timer.new();
	timer_apres_explosion.set_wait_time(0.5);
	timer_apres_explosion.connect("timeout",self,"_on_timer_timeout_apres_explosion");
	add_child(timer_apres_explosion);

func _process(delta):
	print(timer_avant_explosion.time_left);

func start(pos,dir):
	rotation = dir;
	position = pos;
	velocity = Vector2(0,-speed).rotated(rotation);

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
func _on_timer_timeout_avant_explosion():
	timer_apres_explosion.start();
	velocity = Vector2(0,0);
	animationMunition.play("exploded");

func _on_timer_timeout_apres_explosion():
	get_parent().remove_child(self);

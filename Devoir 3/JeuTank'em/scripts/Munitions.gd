extends KinematicBody2D

onready var canon = $Canon;
var velocity;
var speed;

# Called when the node enters the scene tree for the first time.
func _ready():
	canon.play("default");
	speed = 100;
	velocity = Vector2(-1,0);

func _process(delta):
	move_and_slide(velocity * speed).rotated(self.rotation);
extends Node2D

onready var animationMagma = $AnimationMagma;

func _ready():
	animationMagma.play();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

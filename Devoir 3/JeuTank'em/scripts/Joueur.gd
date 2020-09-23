extends KinematicBody2D

var velocity;
var speed;
var tableau_des_munitions;

func _ready():
	velocity = Vector2(0,0);
	speed = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouvement_joueur(delta);

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
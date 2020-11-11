extends Node2D

export(int) var vitesse = 50
onready var plateformeVerticaleFollow2D = $PlateformeVerticalePath2D/PlateformeVerticaleFollow2D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset_actuel = plateformeVerticaleFollow2D.get_offset();
	plateformeVerticaleFollow2D.set_offset(offset_actuel + vitesse * delta);

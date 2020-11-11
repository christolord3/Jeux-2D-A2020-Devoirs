extends Node2D

export(int) var vitesse = 50
onready var plateformeTriangleFollow2D = $PlateformeTrianglePath2D/PlateformeTriangleFollow2D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset_actuel = plateformeTriangleFollow2D.get_offset();
	plateformeTriangleFollow2D.set_offset(offset_actuel + vitesse * delta);

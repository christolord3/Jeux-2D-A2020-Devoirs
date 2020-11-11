extends Node2D

export(int) var vitesse = 50
onready var plateformeHorizontaleFollow2D = $PlateformeHorizontalePath2D/PlateformeHorizontaleFollow2D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset_actuel = plateformeHorizontaleFollow2D.get_offset();
	plateformeHorizontaleFollow2D.set_offset(offset_actuel + vitesse * delta);

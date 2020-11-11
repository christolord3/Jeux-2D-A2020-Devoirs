extends Node2D

export(int) var vitesse = 50
onready var plateformeCercleFollow2D = $PlateformeCerclePath2D/PlateformeCercleFollow2D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset_actuel = plateformeCercleFollow2D.get_offset();
	plateformeCercleFollow2D.set_offset(offset_actuel + vitesse * delta);

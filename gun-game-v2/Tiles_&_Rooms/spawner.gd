extends Marker2D

@export var Enemy_TypePath: String

var temp
var Spawned=false

func _on_enimies_spawn_enemies() -> void:
	$SpawnAnimation.show()
	$SpawnAnimation.play("default")

func _process(delta: float) -> void:
	if $SpawnAnimation.frame == 19 and !Spawned:
		temp = load(Enemy_TypePath)
		add_child(temp.instantiate())
		Spawned = true

func _on_spawn_animation_animation_finished() -> void:
	$SpawnAnimation.hide()

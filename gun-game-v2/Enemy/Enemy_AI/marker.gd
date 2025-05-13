extends AnimatedSprite2D

func _ready():
	pass
	
func begin_decay(time):
	$Timer.wait_time = time
	$Timer.start()
	
	


func _on_timer_timeout() -> void:
	self.queue_free()

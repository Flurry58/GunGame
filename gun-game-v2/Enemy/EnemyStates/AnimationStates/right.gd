extends SlimeAnimationState

func enter(previous_state_path: String, data := {}) -> void:
	AniSprite.Player.play("right")
	AniSprite.play("left")

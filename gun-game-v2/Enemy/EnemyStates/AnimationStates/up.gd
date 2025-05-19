extends AnimationState

func enter(previous_state_path: String, data := {}) -> void:
	AniSprite.play("up")

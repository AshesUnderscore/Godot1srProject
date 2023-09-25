extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
    $scoreLabel.hide()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
    
func show_message(text):
    $message.text = text
    $message.show()
    $messageTimer.start()
    
func show_game_over():
    show_message("game over")
    await $messageTimer.timeout
    
    $message.text = "bitch ass"
    $message.show()
    
    await get_tree().create_timer(1.0).timeout
    $startButton.show()
    
func _on_message_timer_timeout():
    $message.hide()
    
func _on_start_button_pressed():
    $startButton.hide()
    $scoreLabel.show()
    start_game.emit()
    
func update_score(score):
    $scoreLabel.text = str(score)

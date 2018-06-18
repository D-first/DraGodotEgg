extends Node2D

func _ready():
	get_tree().paused = false
	$Bgm.play()
	$GodotQuantity.text = str(Game.godot / 3)
	$GodotAmount.text = str(Game.godot)
	$GoldQuantity.text = str(Game.gold / 4)
	$GoldAmount.text = str(Game.gold)
	$PeachQuantity.text = str(Game.peach / 2)
	$PeachAmount.text = str(Game.peach)
	$GreenQuantity.text = str(Game.green / 2)
	$GreenAmount.text = str(Game.green)
	$SilverQuantity.text = str(Game.silver / 2)
	$SilverAmount.text = str(Game.silver)
	$WhiteQuantity.text = str(Game.white)
	$WhiteAmount.text = str(Game.white)
	$Total.text = str(Game.godot + Game.gold + Game.peach + Game.green + Game.silver + Game.white)


func _on_Retry_pressed():
	get_tree().change_scene("res://World/World.tscn")

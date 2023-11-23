extends Control
class_name TranslationDemo


func _on_english_pressed():
	change_language_to("en")


func _on_french_pressed() -> void:
	change_language_to("fr")


func _on_spanish_pressed():
	change_language_to("es")


func _on_japanese_pressed():
	change_language_to("ja")


signal language_changed

func change_language_to(to_new_locale: String) -> void:
	TranslationServer.set_locale(to_new_locale)
	self.language_changed.emit()


func _on_play_pressed():
	$Audio.play()

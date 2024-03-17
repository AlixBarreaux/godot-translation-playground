extends Node
# class_name Settings


signal locale_changed


func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())

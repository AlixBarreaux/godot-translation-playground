extends Node
# class_name Settings


signal locale_changed


func _ready() -> void:
	TranslationServer.set_locale(OS.get_locale())


#func change_locale(new_locale: String) -> void:
#	TranslationServer.set_locale(new_locale)
#	self.locale_changed.emit()

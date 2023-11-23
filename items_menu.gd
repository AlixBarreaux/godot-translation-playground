extends HBoxContainer
class_name ItemsMenu


@onready var apples_spin_box: SpinBox = $ApplesMenu/SpinBox
@onready var brocolis_spin_box: SpinBox = $BrocolisMenu/SpinBox
@onready var items_result_label: Label = $ItemsResultMenu/Label


func _ready() -> void:
	if self.get_parent() is TranslationDemo:
		self.get_parent().language_changed.connect(on_language_changed)
	
	update_items_results_label()


func on_language_changed() -> void:
	update_items_results_label()


func _on_apples_spin_box_value_changed(_value: float) -> void:
	update_items_results_label()


func _on_brocolis_spin_box_value_changed(_value: float) -> void:
	update_items_results_label()



func update_items_results_label() -> void:
	var apples_amount: int = int(apples_spin_box.value)
	var brocolis_amount: int = int(brocolis_spin_box.value)
	
	var apples_result: String = tr_n("You currently have %d apple!", "You currently have %d apples!", apples_amount) % apples_amount
	var brocolis_result: String = tr_n("You currently have %d brocoli!", "You currently have %d brocolis!", brocolis_amount) % brocolis_amount
	items_result_label.text = apples_result + "\n" + brocolis_result

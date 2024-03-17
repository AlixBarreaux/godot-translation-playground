extends HBoxContainer
class_name ItemsMenu


@onready var apples_spin_box: SpinBox = $ApplesMenu/SpinBox
@onready var broccolis_spin_box: SpinBox = $BroccolisMenu/SpinBox
@onready var items_result_label: Label = $ItemsResultMenu/Label


func _ready() -> void:
	if self.get_parent() is TranslationDemo:
		self.get_parent().language_changed.connect(on_language_changed)
	
	update_items_results_label()


func on_language_changed() -> void:
	update_items_results_label()


func _on_apples_spin_box_value_changed(_value: float) -> void:
	update_items_results_label()


func _on_broccolis_spin_box_value_changed(_value: float) -> void:
	update_items_results_label()


func update_items_results_label() -> void:
	var apples_amount: int = int(apples_spin_box.value)
	var broccolis_amount: int = int(broccolis_spin_box.value)
	
	var apples_result: String = ""
	var broccolis_result: String = ""
	
	if apples_amount == 0 and broccolis_amount == 0:
		items_result_label.text = tr("You currently have no fruits!")
		return
	
	apples_result = tr_n("You currently have %d apple!", "You currently have %d apples!", apples_amount) % apples_amount
	broccolis_result = tr_n("You currently have %d broccoli!", "You currently have %d broccolis!", broccolis_amount) % broccolis_amount
	
	items_result_label.text = apples_result + "\n" + broccolis_result

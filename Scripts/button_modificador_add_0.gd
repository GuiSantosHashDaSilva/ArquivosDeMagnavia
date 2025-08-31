extends Button

@export var vSliderEmpurrao: VSlider;
@export var panelVBoxBack: Panel;
@export var vBoxPopUp: VBoxContainer;

signal botao_status();
signal status_selecionado(index:int)
signal valor_empurrao(value:float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panelVBoxBack.visible = false;
	vBoxPopUp.visible = false;
	vSliderEmpurrao.visible = false;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass


func _on_button_add_empurrao_pressed() -> void:
	vSliderEmpurrao.visible = true;
	pass # Replace with function body.


func _on_menu_button_add_status_pressed() ->void:
	vSliderEmpurrao.visible = false;
	botao_status.emit();
	pass # Replace with function body.

func _on_menu_button_add_status_status_selecionado(index:int) -> void:
	status_selecionado.emit(index);
	pass # Replace with function body.


func _on_v_slider_empurrao_value_changed(value:float) -> void:
	valor_empurrao.emit(value);
	pass # Replace with function body.


func _on_toggled(toggled_on:bool) -> void:
	if toggled_on:
		panelVBoxBack.visible = true;
		vBoxPopUp.visible = true;
	else:
		panelVBoxBack.visible = false;
		vBoxPopUp.visible = false;
		vSliderEmpurrao.visible = false;
	pass # Replace with function body.

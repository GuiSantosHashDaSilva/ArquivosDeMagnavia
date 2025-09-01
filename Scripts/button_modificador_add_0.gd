extends Button

@export var panelVBoxBack: Panel;
@export var vBoxPopUp: VBoxContainer;
@export var vSliderEmpurrao: VSlider;
@export var vSliderAlcance: VSlider;

signal botao_status();
signal status_selecionado(index:int);

signal botao_empurrao();
signal valor_empurrao(value:float);

signal botao_add_vantagem_desv();

signal botao_alcance_up();
signal valor_alcance(value:float);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panelVBoxBack.visible = false;
	vBoxPopUp.visible = false;
	vSliderEmpurrao.visible = false;
	vSliderAlcance.visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass

#função do botão principal "controle"
func _on_toggled(toggled_on:bool) -> void:
	if toggled_on:
		panelVBoxBack.visible = true;
		vBoxPopUp.visible = true;
	else:
		panelVBoxBack.visible = false;
		vBoxPopUp.visible = false;
		vSliderEmpurrao.visible = false;
		vSliderAlcance.visible = false;

#region mod add_status
func _on_menu_button_add_status_pressed() ->void:
	vSliderEmpurrao.visible = false;
	botao_status.emit();

func _on_menu_button_add_status_status_selecionado(index:int) -> void:
	status_selecionado.emit(index);
#endregion

#region mod add_empurrao
func _on_button_add_empurrao_pressed() -> void:
	vSliderEmpurrao.visible = true;
	botao_empurrao.emit();

func _on_v_slider_empurrao_value_changed(value:float) -> void:
	valor_empurrao.emit(value);
#endregion

func _on_button_add_vantagem_desv_pressed() -> void:
	botao_add_vantagem_desv.emit();

#region mod alcance_up
func _on_button_aumentar_alcance_pressed() -> void:
	vSliderAlcance.visible = true;
	botao_alcance_up.emit();

func _on_v_slider_alcance_up_value_changed(value:float) -> void:
	valor_alcance.emit(value);
#endregion

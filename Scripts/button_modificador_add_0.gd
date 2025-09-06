extends Button

@export var panelVBoxBack: Panel;
@export var vBoxPopUp: VBoxContainer;
@export var vSliderEmpurrao: VSlider;
@export var vSliderAlcance: VSlider;
@export var vSliderArea: VSlider;
@export var vSliderDuracaoUp: VSlider;
@export var vSliderCdUp: VSlider;

#region sinais
signal botao_status();
signal status_selecionado(index:int);

signal botao_empurrao();
signal valor_empurrao(value:float);

signal botao_add_vantagem_desv();

signal botao_alcance_up();
signal valor_alcance(value:float);

signal botao_area_up();
signal valor_area(value:float);

signal botao_controle_cirurgico();

signal botao_duracao_up();
signal valor_duracao(value:float);

signal botao_acao();
signal acao_selecionada(index:int);

signal botao_toq_dist();

signal botao_multiplicar();

signal botao_cd_up();
signal valor_cd(value:float);

signal botao_uma_mao();

signal botao_mudar_res();
signal res_selecionada(index:int);

signal botao_alc_toque();
#endregion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panelVBoxBack.visible = false;
	vBoxPopUp.visible = false;
	_sliders_invisivel();


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
		_sliders_invisivel();

func _sliders_invisivel() -> void:
	vSliderEmpurrao.visible = false;
	vSliderAlcance.visible = false;
	vSliderArea.visible = false;
	vSliderDuracaoUp.visible = false;
	vSliderCdUp.visible = false;

#region mod add_status
func _on_menu_button_add_status_pressed() ->void:
	_sliders_invisivel();
	botao_status.emit();

func _on_menu_button_add_status_status_selecionado(index:int) -> void:
	status_selecionado.emit(index);
#endregion

#region mod add_empurrao
func _on_button_add_empurrao_pressed() -> void:
	_sliders_invisivel();
	vSliderEmpurrao.visible = true;
	botao_empurrao.emit();

func _on_v_slider_empurrao_value_changed(value:float) -> void:
	valor_empurrao.emit(value);
#endregion

func _on_button_add_vantagem_desv_pressed() -> void:
	_sliders_invisivel();
	botao_add_vantagem_desv.emit();

#region mod alcance_up
func _on_button_aumentar_alcance_pressed() -> void:
	_sliders_invisivel();
	vSliderAlcance.visible = true;
	botao_alcance_up.emit();

func _on_v_slider_alcance_up_value_changed(value:float) -> void:
	valor_alcance.emit(value);
#endregion

#region mod area_up
func _on_button_aumentar_area_pressed() -> void:
	_sliders_invisivel();
	vSliderArea.visible = true;
	botao_area_up.emit();

func _on_v_slider_area_up_value_changed(value:float) -> void:
	valor_area.emit(value);
#endregion

func _on_button_controle_cirurgico_pressed() -> void:
	_sliders_invisivel();
	botao_controle_cirurgico.emit();

#region mod duração_up
func _on_button_duracao_up_pressed() -> void:
	_sliders_invisivel();
	vSliderDuracaoUp.visible = true;
	botao_duracao_up.emit();

func _on_v_slider_duracao_up_value_changed(value:float) -> void:
	valor_duracao.emit(value);
#endregion


#region mod feitiço_rápido
func _on_menu_button_quick_cast_pressed() -> void:
	_sliders_invisivel();
	botao_acao.emit();

func _on_menu_button_quick_cast_acao_selecionada(index:int) -> void:
	acao_selecionada.emit(index);
#endregion

func _on_button_toq_distancia_pressed() -> void:
	_sliders_invisivel();
	botao_toq_dist.emit();

func _on_button_multiplicar_pressed() -> void:
	_sliders_invisivel();
	botao_multiplicar.emit();

#region mod aumentar_cd
func _on_button_aumentar_cd_pressed() -> void:
	_sliders_invisivel();
	vSliderCdUp.visible = true;
	botao_cd_up.emit();

func _on_v_slider_cd_up_value_changed(value:float) -> void:
	valor_cd.emit(value);
#endregion

func _on_button_uma_mao_pressed() -> void:
	_sliders_invisivel();
	botao_uma_mao.emit()

#region mod alterar_teste_res
func _on_menu_button_mudar_res_pressed() -> void:
	_sliders_invisivel();
	botao_mudar_res.emit();

func _on_menu_button_mudar_res_res_selecionada(index:int) -> void:
	res_selecionada.emit(index);
#endregion

func _on_button_alc_toque_pressed() -> void:
	_sliders_invisivel();
	botao_alc_toque.emit();

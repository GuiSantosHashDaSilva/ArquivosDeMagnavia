extends Control

#region variáveis exportadas
@export var optionButtonExec: OptionButton;
@export var lineNome: LineEdit;
@export var lineTesteRes: LineEdit;
@export var lineAlcance: LineEdit;
@export var lineDuracao: LineEdit;
@export var textDescricao: TextEdit;
@export var labelNome: Label;
@export var labelGrau: Label;
@export var labelArea1: Label;
@export var labelArea2: Label;
@export var labelTesteRes: Label;
@export var labelTempoExec: Label;
@export var labelDuracao: Label;
@export var labelComponentes: Label;
@export var labelAtaque: Label;
@export var labelCusto: Label;
@export var labelCD: Label;
@export var labelAlcance: Label;
@export var labelAOE: Label;
@export var hSliderGrau: HSlider;
#endregion

#region variáveis de instância
var limiteSliderGrau: int;
var limiteAreaP: int = 1;
var limiteAreaS: int = 0;
var indiceTempoExec: int;
var qtdAreaP: int = 0;
var qtdAreaS: int = 0;
var valorGrau: int = 1;
var listaAreasP: Array[String] = [];
var listaAreasS: Array[String] = [];
var listaComponentes: Array[String] = [];
var listaAoE: Array[String] = [];
var testeRes: String;
var custo: int;
var ataque: int;
var CD: int;
#endregion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelGrau.text ="Grau: " + str(valorGrau);
	_calcularAtaque()
	_calcularCusto(valorGrau, qtdAreaP, qtdAreaS);

func _on_button_criar_magia_pressed() -> void:
	var nome: String = lineNome.text;
	var tempoExecucao: String = optionButtonExec.get_item_text(indiceTempoExec);
	var duracao: String = lineDuracao.text;
	var alcance: String = lineAlcance.text;
	var descricao: String = textDescricao.text;
	GerenciadorPersonagens.adicionarFeitico(nome,valorGrau,listaAreasP,listaAreasS,testeRes,CD,tempoExecucao,duracao,listaComponentes,ataque,custo,alcance,listaAoE,descricao);
	get_tree().change_scene_to_file("res://Cenas/MainMenu.tscn");

func _on_line_nome_text_changed(new_text:String) -> void: labelNome.text = "Nome: " + new_text;

func _on_line_alcance_text_changed(new_text:String) -> void: labelAlcance.text = "Alcance: " + new_text;

func _on_line_duracao_text_changed(new_text:String) -> void: labelDuracao.text = "Duração: " + new_text;

func _on_h_slider_value_changed(value:int) -> void:
	if value < limiteSliderGrau: 
		hSliderGrau.value = limiteSliderGrau;
		return
	self.valorGrau = value;
	_limite_areas(value);
	_calcularCD(value,qtdAreaP,qtdAreaS);
	_calcularCusto(value,qtdAreaP,qtdAreaS)
	labelGrau.text = "Grau: " + str(value);

func _limite_areas(grau:int) -> void:
	limiteAreaS = grau - 1
	limiteAreaP = (grau / 2) + 1
	if grau == 2:
		limiteAreaP = 1
	print("AreaP, AreaS: ", limiteAreaP, ", ", limiteAreaS)

func calcular_grau_minimo_necessario() -> int:
	var qtd_p: int = listaAreasP.size()
	var qtd_s: int = listaAreasS.size()

	# Itera por todos os graus possíveis, do menor para o maior.
	for grau_teste:int in range(1, 10): # Testa do grau 1 ao 9
		# Calcula os limites que este grau de teste oferece.
		var limite_p_teste: int = (grau_teste / 2) + 1
		if grau_teste == 2:
			limite_p_teste = 1
		
		var limite_s_teste: int = grau_teste - 1

		# Verifica se os limites deste grau são suficientes.
		if limite_p_teste >= qtd_p and limite_s_teste >= qtd_s:
			# Se forem, o menor grau possível foi encontrado.
			return grau_teste

	# Caso de segurança (não deve acontecer com lógica normal).
	return 1

func atualizar_limite_do_slider() -> void:
	limiteSliderGrau = calcular_grau_minimo_necessario()
	print("Slider atualizado. Grau mínimo permitido: ", limiteSliderGrau)

func _on_option_area_1_item_selected(index:int) -> void:
	var areaP: String
	match index:
		0: areaP = "Água"
		1: areaP = "Terra"
		2: areaP = "Ar"
		3: areaP = "Alma"
		4: areaP = "Mente"
		_:
			print("Índice Inválido")
			return
	
	if not listaAreasP.has(areaP):
		if listaAreasP.size() < limiteAreaP:
			qtdAreaP += 1;
			_calcularCusto(valorGrau,qtdAreaP,qtdAreaS);
			_calcularCD(valorGrau,qtdAreaP,qtdAreaS);
			listaAreasP.append(areaP);
			atualizar_limite_do_slider();
		else:
			print("Limite de áreas atingido")
	else:
		print("Área já adicionada");
		listaAreasP.erase(areaP);
		atualizar_limite_do_slider();
	labelArea1.text = "Área(s) Primária(s): " + ", ".join(listaAreasP)

func _on_option_area_2_item_selected(index:int) -> void:
	var areaS: String
	match index:
		0: areaS = "Transformação"
		1: areaS = "Natureza"
		2: areaS = "Metal"
		3: areaS = "Sintropia"
		4: areaS = "Fogo"
		5: areaS = "Entropia"
		6: areaS = "Casca"
		7: areaS = "Senso"
		8: areaS = "Emoção"
		9: areaS = "Lógica"
		_:
			print("Índice Inválido");
			return
	if not listaAreasS.has(areaS):
		if listaAreasS.size() < limiteAreaS:
			qtdAreaS += 1;
			_calcularCusto(valorGrau,qtdAreaP,qtdAreaS);
			_calcularCD(valorGrau,qtdAreaP,qtdAreaS);
			listaAreasS.append(areaS);
			atualizar_limite_do_slider();
		else:
			print("Limite de áreas secundárias atingido");
	else:
		print("Área já adicionada");
		listaAreasS.erase(areaS);
		atualizar_limite_do_slider();
	labelArea2.text = "Área(s) Secundária(s): " + ", ".join(listaAreasS);

func _on_option_componentes_item_selected(index:int) -> void:
	var componente: String;
	match index:
		0: componente = "Vocal"
		1: componente = "Semântico"
		_:
			print("Índice inválido");
			return
	listaComponentes.append(componente);
	labelComponentes.text = "Componentes: " + ", ".join(listaComponentes);

func _on_option_formato_item_selected(index:int) -> void:
	var aoe: String;
	match index:
		0: 
			aoe = "Cone"
			self.testeRes = "Reflexo"
		1:
			aoe = "Cilindro"
			self.testeRes = "Vontade"
		2:
			aoe = "Linha"
			self.testeRes = "Reflexo"
		3:
			aoe = "Esfera"
			self.testeRes = "Reflexo"
		4:
			aoe = "Cubo"
			self.testeRes = "Reflexo"
		5:
			aoe = "N/A"
			self.testeRes = "Fortitude"
		_:
			print("Índice inválido");
			return
	listaAoE.clear();
	listaAoE.append(aoe);
	labelAOE.text = "Área(s) de Efeito: " + ", ".join(listaAoE);
	labelTesteRes.text = "Teste de Resistência: " + testeRes;

func _on_option_tempo_exec_item_selected(index:int) -> void:
	var tempo: String;
	self.indiceTempoExec = index;
	match index:
		0: tempo = "Ação";
		1: tempo = "Ação Bônus";
		2: tempo = "Reação";
		3: tempo = "Ação Completa";
		_:
			print("Índice inválido")
			return
	labelTempoExec.text = "Tempo de Execução: " + tempo;
	pass # Replace with function body.

func _calcularCusto(grau:int,qtdAreaP:int,qtdAreaS:int) -> void:
	self.custo = grau + qtdAreaP + (qtdAreaS*2);
	labelCusto.text = "Custo: " + str(custo);

func _calcularCD(grau:int,qtdAreaP:int,qtdAreaS:int) -> void:
	self.CD = 5 + grau + qtdAreaP + (qtdAreaS*2);
	labelCD.text = "Classe de Dificuldade: " + str(CD);

func _calcularAtaque()->void:
	var personagem: Personagem = GerenciadorPersonagens.personagemSelecionado;
	var BBA: int = personagem.valorBBA;
	var VAC: int = personagem.valorAtributoConj;
	self.ataque = BBA + VAC;
	labelAtaque.text = "Ataque: " + str(ataque);

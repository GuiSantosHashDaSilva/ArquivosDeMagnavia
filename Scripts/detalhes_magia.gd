extends Control

#region variáveis exportadas
@export var labelNome: Label;
@export var labelGrau: Label;
@export var labelArea1: Label;
@export var labelArea2: Label;
@export var labelTesteRes: Label;
@export var labelCD: Label;
@export var labelTempoExec: Label;
@export var labelDuracao: Label;
@export var labelComponentes: Label;
@export var labelAOE: Label;
@export var labelAlcance: Label;
@export var labelAtaque: Label;
@export var labelCusto: Label;
@export var labelModificador: Label;
@export var labelExigencia: Label;
@export var labelCustoMod: Label;
@export var labelModificadores: Label;
@export var labelDescricao: RichTextLabel;
@export var labelEfeito: RichTextLabel;
#endregion

var nomeMod:String;
var efeitoMod:String;
var exigenciaMod:String;
var custoMod:int;


#variáveis do modificador "aumentar alcance"
var alcanceDobrado: int;
var alcancePos60: int;
var valorSliderAlcanceOld: float;

#variáveis do modificador "aumentar área
var areaDobrada: int;
var areaPos30: int;
var valorSliderAreaOld: float;

#variáveis do modificador "duração prolongada"
var duracaoDobrada: int;
var duracaoPos60: int;
var valorSliderDuracaoOld: float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelNome.text = "Nome: " + GerenciadorPersonagens.feiticoSelecionado.nome;
	labelGrau.text = "Grau: " + str(GerenciadorPersonagens.feiticoSelecionado.grau);
	labelArea1.text = "Área(s) Primária(s): " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.area1);
	labelArea2.text = "Área(s) Secundária(s): " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.area2);
	labelTesteRes.text = "Teste de Resistência: " + GerenciadorPersonagens.feiticoSelecionado.testeResistencia;
	labelCD.text = "Classe de Dificuldade: " + str(GerenciadorPersonagens.feiticoSelecionado.CD);
	labelTempoExec.text = "Tempo de Execução: " + GerenciadorPersonagens.feiticoSelecionado.tempoExecucao;
	labelDuracao.text = "Duração: " + str(GerenciadorPersonagens.feiticoSelecionado.duracao);
	labelComponentes.text = "Componentes: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.componentes);
	labelAOE.text = "Área de Efeito: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.areaEfeito);
	labelAlcance.text = "Alcance: " + str(GerenciadorPersonagens.feiticoSelecionado.alcance);
	labelAtaque.text = "Ataque: " + str(GerenciadorPersonagens.feiticoSelecionado.ataque);
	labelCusto.text = "Custo: " + str(GerenciadorPersonagens.feiticoSelecionado.custo);
	labelModificadores.text = "Modificadores: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.modificadores)
	labelDescricao.text = "Descrição: " + GerenciadorPersonagens.feiticoSelecionado.descricao;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass


func _on_button_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MainMenu.tscn");

func _atualizar_label_mod() -> void:
	labelModificador.text = "Modificador: " + nomeMod;
	labelExigencia.text = "Exigência: " + exigenciaMod;
	labelEfeito.text = "Efeito: " + efeitoMod;
	labelCustoMod.text = "Custo: " + str(custoMod);

#region mod add_status
func _on_button_modificador_add_0_botao_status() -> void:
	nomeMod = "Adicionar Condição";
	exigenciaMod = "Nenhuma."
	efeitoMod = "Concede ao feitiço a capacidade de impor uma ou mais condições à uma criatura. Caso a condição escolhida não possua uma duração própria, ela dura até o início do seu próximo turno ou até o final do próximo turno de uma outra criatura afetada, caso não defina uma duração por meio da característica “DURAÇÃO PROLONGADA”. Uma condição deve sempre exigir um Teste de Resistência para que a criatura possa não sofrer seus efeitos.";
	custoMod = 0;
	_atualizar_label_mod();

func _on_button_modificador_add_0_status_selecionado(index:int) -> void:
	match index:
		0:  custoMod = 1;
		1: custoMod = 1;
		2: custoMod = 2;
		3: custoMod = 3;
		4: custoMod = 4;
		5: custoMod = 1;
		6: custoMod = 1;
		7: custoMod = 2;
		8: custoMod = 5;
		9: custoMod = 2;
		10: custoMod = 4;
		11: custoMod = 2;
		12: custoMod = 2;
		13: custoMod = 1;
		14: custoMod = 2;
		15: custoMod = 2;
		16: custoMod = 2;
		17: custoMod = 8;
		18: custoMod = 5;
		19: custoMod = 2;
		20: custoMod = 2;
		21: custoMod = 6;
		22: custoMod = 2;
		23: custoMod = 8;
		24: custoMod = 1;
		25: custoMod = 1;
		26: custoMod = 3;
		27: custoMod = 2;
		28: custoMod = 1;
		29: custoMod = 3;
	labelCustoMod.text = "Custo: " + str(custoMod);
#endregion

#region mod add_empurrão
func _on_button_modificador_add_0_botao_empurrao() -> void:
	nomeMod = "Adicionar Empurrão";
	exigenciaMod = "Nenhuma.";
	efeitoMod = "Concede ao feitiço a capacidade de empurrar uma criatura. Para ser empurrada, a criatura deve falhar em um Teste de Fortitude. Para cada 3 metros que uma criatura é empurrada, caso ela bata em um objeto ou estrutura com mais de 1,5 metro de raio, ela receberá 1d8 de dano Contundente extra por metro do objeto ou estrutura, até o máximo de 8d8. Esse dano é aplicado apenas uma vez e não é necessário que a criatura empurrada percorra todo o alcance do empurrão para receber o dano máximo possível de cada empurrão.";
	custoMod = 0;
	_atualizar_label_mod();

func _on_button_modificador_add_0_valor_empurrao(value:float) -> void:
	custoMod = value/3;
	labelCustoMod.text = "Custo: " + str(custoMod);
#endregion

func _on_button_modificador_add_0_botao_add_vantagem_desv() -> void:
	nomeMod = "Adicionar Vantagem/Desvantagem";
	efeitoMod = "Concede ao feitiço a capacidade de atribuir para uma criatura vantagem ou desvantagem em um dos próximos tipos de jogadas: jogada de ataque, Testes de Habilidade ou Testes de Resistência. Deve ser escolhido apenas um dos tipos (vantagem +2 ou desvantagem -3), que dura até o início do seu próximo turno ou até o final do próximo turno de uma outra criatura afetada, caso não aumente.";
	exigenciaMod = "Nenhuma";
	custoMod = 4;
	_atualizar_label_mod();

#region aumentar_alcance
func _on_button_modificador_add_0_botao_alcance_up() -> void:
	nomeMod = "Aumentar Alcance";
	efeitoMod = "Concede ao feitiço a capacidade de aumentar o seu alcance de “Toque” para “Linha”.";
	exigenciaMod = "Nenhuma";
	custoMod = 0;
	_atualizar_label_mod();

func _on_button_modificador_add_0_valor_alcance(value:float) -> void:
	if GerenciadorPersonagens.feiticoSelecionado.alcance + value <= 60:
		custoMod = value/6;
		labelCustoMod.text = "Custo: " + str(custoMod);
		alcancePos60 = GerenciadorPersonagens.feiticoSelecionado.alcance + value;
		valorSliderAlcanceOld = value;
	elif valorSliderAlcanceOld < value:
		alcanceDobrado = alcancePos60 * 2;
		custoMod += 4;
		alcancePos60 = alcanceDobrado;
		labelCustoMod.text = "Custo: " + str(custoMod);
		valorSliderAlcanceOld = value;
	else:
		alcanceDobrado = alcancePos60 / 2;
		custoMod -= 4;
		alcancePos60 = alcanceDobrado;
		labelCustoMod.text = "Custo: " + str(custoMod);
		valorSliderAlcanceOld = value;
#endregion

#region aumentar_área
func _on_button_modificador_add_0_botao_area_up() -> void:
	nomeMod = "Aumentar Área";
	efeitoMod = "Concede ao feitiço a capacidade de criar uma área onde o feitiço terá ação, como “Cone”, “Esfera”, “Cilindro”, ou “Cubo”.";
	exigenciaMod = "Nenhuma";
	custoMod = 0;
	_atualizar_label_mod();


func _on_button_modificador_add_0_valor_area(value:float) -> void:
	if GerenciadorPersonagens.feiticoSelecionado.alcance + value <= 30:
		custoMod = 2 * (value/3);
		labelCustoMod.text = "Custo: " + str(custoMod);
		areaPos30 = GerenciadorPersonagens.feiticoSelecionado.alcance + value;
		valorSliderAreaOld = value;
	elif valorSliderAreaOld < value:
		areaDobrada = areaPos30 * 2;
		custoMod += 8;
		areaPos30 = areaDobrada;
		labelCustoMod.text = "Custo: " + str(custoMod);
		valorSliderAreaOld = value;
	else:
		areaDobrada = areaPos30 / 2;
		custoMod -= 8;
		areaPos30 = areaDobrada;
		labelCustoMod.text = "Custo: " + str(custoMod);
		valorSliderAreaOld = value;
#endregion

func _on_button_modificador_add_0_botao_controle_cirurgico() -> void:
	nomeMod = "Controle Cirurgíco";
	efeitoMod = "Concede ao feitiço a capacidade de manter criaturas aliadas e o conjurador seguras na área do feitiço. Ao executar, você pode escolher um número de criaturas igual ao grau, dentro da área do feitiço, para não sofrer nenhum dano ou condição.";
	exigenciaMod = "Um feitiço que obriga outras criaturas a realizarem um Teste de Resistência para não sofrer dano ou condição.";
	custoMod = 5;
	_atualizar_label_mod();

#region duração_prolongada
func _on_button_modificador_add_0_botao_duracao_up() -> void:
	nomeMod = "Duração Prolongada";
	efeitoMod = "Concede ao feitiço a capacidade de estender a duração de condições ou efeitos.";
	exigenciaMod = "O feitiço deve ter algum efeito ou condição.";
	custoMod = 0;
	_atualizar_label_mod();

func _on_button_modificador_add_0_valor_duracao(value:float) -> void:
	if GerenciadorPersonagens.feiticoSelecionado.duracao + value <= 60:
		if GerenciadorPersonagens.feiticoSelecionado.duracao + value == 1 and valorSliderDuracaoOld == 0:
			custoMod += 4;
			labelCustoMod.text = "Custo: " + str(custoMod);
			valorSliderDuracaoOld = value;
		elif valorSliderDuracaoOld < value:
			custoMod += 2;
			labelCustoMod.text = "Custo: " + str(custoMod);
			duracaoPos60 = GerenciadorPersonagens.feiticoSelecionado.duracao + value;
			valorSliderDuracaoOld = value;
	elif valorSliderDuracaoOld < value:
		duracaoDobrada = duracaoPos60 * 2;
		custoMod += 8;
		duracaoPos60 = duracaoDobrada;
		labelCustoMod.text = "Custo: " + str(custoMod);
		valorSliderDuracaoOld = value;
	if value < valorSliderDuracaoOld:
		if valorSliderDuracaoOld <= 60:
			if valorSliderDuracaoOld == 1 and value < valorSliderDuracaoOld:
				custoMod -= 4;
				labelCustoMod.text = "Custo: " + str(custoMod);
				valorSliderDuracaoOld = value;
			else:
				custoMod -= 2;
				labelCustoMod.text = "Custo: " + str(custoMod);
				valorSliderDuracaoOld = value;
		elif valorSliderDuracaoOld > 60:
			duracaoDobrada = duracaoPos60 / 2;
			custoMod -= 8;
			duracaoPos60 = duracaoDobrada;
			labelCustoMod.text = "Custo: " + str(custoMod);
			valorSliderDuracaoOld = value;
#endregion

#region feitiço_rápido
func _on_button_modificador_add_0_botao_acao() -> void:
	nomeMod = "Feitiço Rápido";
	efeitoMod = "Concede ao feitiço a possibilidade de tornar sua execução possível com uma “Ação Bônus” ou “Reação”.";
	exigenciaMod = "Feitiços que tenham o requisito do seu uso como “Ação”.";
	custoMod = 0;
	_atualizar_label_mod();

func _on_button_modificador_add_0_acao_selecionada(index:int) -> void:
	if not GerenciadorPersonagens.feiticoSelecionado.tempoExecucao.to_lower() == "ação":
		print("precisa ser ação");
		return;
	match index:
		0:
			print("Ação bônus")
			custoMod = GerenciadorPersonagens.feiticoSelecionado.grau * 2;
			labelCustoMod.text = "Custo: " + str(custoMod);
		1:
			print("Reação")
			custoMod = GerenciadorPersonagens.feiticoSelecionado.grau * 4;
			labelCustoMod.text = "Custo: " + str(custoMod);
#endregion

func _on_button_modificador_add_0_botao_toq_dist() -> void:
	if not GerenciadorPersonagens.feiticoSelecionado.alcance > 0:
		labelExigencia.text = "Exigência: O feitiço deve ser a distancia e ter a característica “AUMENTAR ALCANCE”";
		return;
	nomeMod = "Toque a Distância";
	efeitoMod = "Concede ao feitiço um ataque de toque a distancia ignorando a CA de equipamento não magico mas não de feitiço.";
	exigenciaMod = "O feitiço deve ser a distancia e ter a característica “AUMENTAR ALCANCE”";
	custoMod = 8;
	_atualizar_label_mod();

func _on_option_controle_item_selected(index:int) -> void:
	match index:
		9: 
			nomeMod = "Multiplicar";
			efeitoMod = "Concede ao feitiço a capacidade de ter vários alvos, como por exemplo invocar varias paredes, invocar vários lacaios, laminas que atingem varias pessoas em distancia de linha, caso seja um feitiço que causa dano, o alvo só recebe dano de uma só área, caso elas se sobreponham";
			exigenciaMod = "O feitiço deve ser a distancia";
			custoMod = 0; #5 PM para cada vez que for multiplicado
		10: 
			nomeMod = "Aumento de CD";
			efeitoMod = "Concede ao feitiço mais potência para tornar mais difícil de se resistir a ele.";
			exigenciaMod = "O feitiço deve ter CD";
			custoMod = 0; #2 PM para cada +1 = Máximo de aumentos igual ao dobro do grau
		11: 
			nomeMod = "Feitiço de Uma Só Mão";
			efeitoMod = "Concede ao feitiço a necessidade de se usar apenas uma mão para se realizar o feitiço, podendo usar a outra mão livre para atacar se quiser.";
			exigenciaMod = "Nenhuma.";
			custoMod = 0 #dobro do grau; 
		12: 
			nomeMod = "Alteração de Teste de Resistência";
			efeitoMod = "Troca o teste de resistência do feitiço.";
			exigenciaMod = "Nehuma.";
			custoMod = 20;
		13: 
			nomeMod = "Alcance de Toque";
			efeitoMod = "Faz com que o alcance do feitiço seja definido para toque, necessitando que toque no alvo com seu corpo ou armas corpo a corpo, além disso faz com que caso use o feitiço para se atacar, as armas utilizadas ou não, se beneficia dos bônus de dano delas quando forem aplicados no dano do feitiço";
			exigenciaMod = "Nenhuma";
			custoMod = 1;
	labelModificador.text = "Modificador: " + nomeMod;
	labelExigencia.text = "Exigência: " + exigenciaMod;
	labelCustoMod.text = "Custo: " + str(custoMod);
	pass # Replace with function body.

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
#endregion

var nomeMod:String;
var efeitoMod:String;
var exigenciaMod:String;
var custoMod:int;
var dobroGrau: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelNome.text = "Nome: " + GerenciadorPersonagens.feiticoSelecionado.nome;
	labelGrau.text = "Grau: " + str(GerenciadorPersonagens.feiticoSelecionado.grau);
	labelArea1.text = "Área(s) Primária(s): " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.area1);
	labelArea2.text = "Área(s) Secundária(s): " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.area2);
	labelTesteRes.text = "Teste de Resistência: " + GerenciadorPersonagens.feiticoSelecionado.testeResistencia;
	labelCD.text = "Classe de Dificuldade: " + str(GerenciadorPersonagens.feiticoSelecionado.CD);
	labelTempoExec.text = "Tempo de Execução: " + GerenciadorPersonagens.feiticoSelecionado.tempoExecucao;
	labelDuracao.text = "Duração: " + GerenciadorPersonagens.feiticoSelecionado.duracao;
	labelComponentes.text = "Componentes: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.componentes);
	labelAOE.text = "Área de Efeito: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.areaEfeito);
	labelAlcance.text = "Alcance: " + GerenciadorPersonagens.feiticoSelecionado.alcance;
	labelAtaque.text = "Ataque: " + str(GerenciadorPersonagens.feiticoSelecionado.ataque);
	labelCusto.text = "Custo: " + str(GerenciadorPersonagens.feiticoSelecionado.custo);
	labelModificadores.text = "Modificadores: " + ", ".join(GerenciadorPersonagens.feiticoSelecionado.modificadores)
	labelDescricao.text = "Descrição: " + GerenciadorPersonagens.feiticoSelecionado.descricao;
	
	dobroGrau = GerenciadorPersonagens.feiticoSelecionado.grau * 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass


func _on_button_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MainMenu.tscn");

func _on_button_modificador_add_0_botao_status() -> void:
	nomeMod = "Adicionar Condição";
	efeitoMod = "Concede ao feitiço a capacidade de impor uma ou mais condições à uma criatura. Caso a condição escolhida não possua uma duração própria, ela dura até o início do seu próximo turno ou até o final do próximo turno de uma outra criatura afetada, caso não defina uma duração por meio da característica “DURAÇÃO PROLONGADA”.
Uma condição deve sempre exigir um Teste de Resistência para que a criatura possa não sofrer seus efeitos.";
	exigenciaMod = "Nenhuma."
	labelModificador.text = "Modificador: " + nomeMod;
	labelExigencia.text = "Exigência: " + exigenciaMod;
	labelCustoMod.text = "Custo: " + str(custoMod);
	pass # Replace with function body.

func _on_option_controle_item_selected(index:int) -> void:
	match index:
		0: 
			nomeMod = "Adicionar Status";
			efeitoMod = "Concede ao feitiço a capacidade de impor uma ou mais condições à uma criatura. Caso a condição escolhida não possua uma duração própria, ela dura até o início do seu próximo turno ou até o final do próximo turno de uma outra criatura afetada, caso não defina uma duração por meio da característica “DURAÇÃO PROLONGADA”.
Uma condição deve sempre exigir um Teste de Resistência para que a criatura possa não sofrer seus efeitos.";
			exigenciaMod = "Nenhuma."
			custoMod = 0; #o mesmo valor de pm do status
		1: 
			nomeMod = "Adicionar Empurrão";
			efeitoMod = "Concede ao feitiço a capacidade de empurrar uma criatura. Para ser empurrada, a criatura deve falhar em um Teste de Fortitude.
Para cada 3 metros que uma criatura é empurrada, caso ela bata em um objeto ou estrutura com mais de 1,5 metro de raio, ela receberá 1d8 de dano Contundente extra por metro do objeto ou estrutura, até o máximo de 8d8. Esse dano é aplicado apenas uma vez e não é necessário que a criatura empurrada percorra todo o alcance do empurrão para receber o dano máximo possível de cada empurrão.";
			exigenciaMod = "Nenhuma.";
			custoMod = 0; #1pm para cada 3 metros de distância do empurrão adicionados
		2: 
			nomeMod = "Adicionar Vantagem/Desvantagem";
			efeitoMod = "Concede ao feitiço a capacidade de atribuir para uma criatura vantagem ou desvantagem em um dos próximos tipos de jogadas: jogada de ataque, Testes de Habilidade ou Testes de Resistência.
Deve ser escolhido apenas um dos tipos (vantagem +2 ou desvantagem -3), que dura até o início do seu próximo turno ou até o final do próximo turno de uma outra criatura afetada, caso não aumente.";
			exigenciaMod = "Nenhuma";
			custoMod = 4;
		3: 
			nomeMod = "Aumentar Alcance";
			efeitoMod = "Concede ao feitiço a capacidade de aumentar o seu alcance de “Toque” para “Linha”.";
			exigenciaMod = "Nenhuma";
			custoMod = 0; #1 PM para cada 6 metros adicionais, caso chegue a 60 metros pode se usar 4 PM para se duplicar cada vez.
		4: 
			nomeMod = "Aumentar Área";
			efeitoMod = "Concede ao feitiço a capacidade de criar uma área onde o feitiço terá ação, como “Cone”, “Esfera”, “Cilindro”, ou “Cubo”.";
			exigenciaMod = "Nenhuma.";
			custoMod = 0; #2 PM para cada 3 metros adicionais caso chegue a 30 metros pode se usar 8 PM para se duplicar cada vez.
		5: 
			nomeMod = "Controle Cirurgíco";
			efeitoMod = "Concede ao feitiço a capacidade de manter criaturas aliadas e o conjurador seguras na área do feitiço. Ao executar, você pode escolher um número de criaturas igual ao grau, dentro da área do feitiço, para não sofrer nenhum dano ou condição.";
			exigenciaMod = "Um feitiço que obriga outras criaturas a realizarem um Teste de Resistência para não sofrer dano ou condição.";
			custoMod = 5;
		6: 
			nomeMod = "Duração Prolongada";
			efeitoMod = "Concede ao feitiço a capacidade de estender a duração de condições ou efeitos.";
			exigenciaMod = "O feitiço deve ter algum efeito ou condição.";
			custoMod = 0; #4 PM para o primeiro minuto e 2 PM para cada minuto posterior, depois de 60 minutos caso gaste 8 PM dobra.
		7: 
			nomeMod = "Feitiço Rápido";
			efeitoMod = "Concede ao feitiço a possibilidade de tornar sua execução possível com uma “Ação Bônus” ou “Reação”.";
			exigenciaMod = "Feitiços que tenham o requisito do seu uso como “Ação”.";
			custoMod = 0; #Valor de PM igual ao dobro grau do feitiço para ação bônus, e o quadruplo para reação.
		8: 
			nomeMod = "Toque a Distância";
			efeitoMod = "Concede ao feitiço um ataque de toque a distancia ignorando a CA de equipamento não magico mas não de feitiço.";
			exigenciaMod = "O feitiço deve ser a distancia e ter a característica “AUMENTAR ALCANCE”";
			custoMod = 8;
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
			custoMod = dobroGrau; 
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


func _on_button_modificador_add_0_status_selecionado(index:int) -> void:
	print("index status: " + str(index));
	pass # Replace with function body.


func _on_button_modificador_add_0_valor_empurrao(value:float) -> void:
	print("valor empurrão: " + str(value));
	pass # Replace with function body.

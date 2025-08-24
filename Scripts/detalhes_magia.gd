extends Control

#region varáveis exportadas
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
@export var labelDescricao: RichTextLabel;
#endregion

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
	labelDescricao.text = "Descrição: " + GerenciadorPersonagens.feiticoSelecionado.descricao;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass


func _on_button_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/MainMenu.tscn");

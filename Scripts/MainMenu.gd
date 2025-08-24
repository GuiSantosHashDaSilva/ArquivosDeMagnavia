extends Control

@export var itemListChar : ItemList;
@export var itemListFeitico : ItemList;
@export var labelNomeChar : Label;
@export var labelAtributoConj : Label;
@export var labelBBA : Label;
@export var labelErroCharNull : Label;

@onready var listaPersonagens: Array[Personagem] = GerenciadorPersonagens.lista_de_personagens;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not itemListChar.get_item_count() == 0:
		GerenciadorPersonagens.registrar_itemlist(itemListChar);
	atualizarItemListChar();
	if not GerenciadorPersonagens.personagemSelecionado == null:
		atualizarItemListFeitico();

func atualizarItemListChar() -> void:
	if itemListChar != null:
		itemListChar.clear()
		for personagem:Personagem in listaPersonagens:
			itemListChar.add_item(personagem.nome, load(personagem.Icone), true)
	print("Interface do ItemList atualizada.")

func atualizarItemListFeitico() -> void:
	if itemListFeitico != null:
		itemListFeitico.clear();
		for feitico:Feitico in GerenciadorPersonagens.personagemSelecionado.feiticos:
			itemListFeitico.add_item(feitico.nome, load(feitico.Icone), true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass


func _on_button_criar_personagem_pressed() -> void:
	labelErroCharNull.visible = false
	get_tree().change_scene_to_file("res://Cenas/criacao_char.tscn");


func _on_button_criar_magia_pressed() -> void: 
	if GerenciadorPersonagens.personagemSelecionado == null:
		labelErroCharNull.visible = true
		print("Selecione um char");
	else:
		get_tree().change_scene_to_file("res://Cenas/criacao_magia.tscn");


func _on_item_list_personagens_item_selected(index:int) -> void:
	GerenciadorPersonagens.setPersonagemSelecionado(listaPersonagens[index]);
	labelErroCharNull.visible = false
	labelAtributoConj.text = "Modificador do Atributo de Conjuração: " + str(GerenciadorPersonagens.personagemSelecionado.valorAtributoConj);
	labelBBA.text = "Bônus Base de Ataque: " + str(GerenciadorPersonagens.personagemSelecionado.valorBBA);
	labelNomeChar.text = GerenciadorPersonagens.personagemSelecionado.nome;
	atualizarItemListFeitico();

#fazer as funções do item list de feitico e tela de detalhe
func _on_item_list_magias_item_selected(index:int) -> void:
	GerenciadorPersonagens.setFeiticoSelecionado(GerenciadorPersonagens.personagemSelecionado.feiticos[index]);
	get_tree().change_scene_to_file("res://Cenas/detalhes_magia.tscn");
	pass # Replace with function body.

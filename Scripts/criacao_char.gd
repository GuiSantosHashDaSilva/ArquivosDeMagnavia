extends Control

#region variáveis exportadas
@export var textNomeChar: TextEdit;
@export var textAtributoConj: TextEdit;
@export var textBBA: TextEdit;
#endregion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_button_criar_char_pressed() -> void:
	var nomePersonagem: String = textNomeChar.text;
	var valorAtributoConj: int= int(textAtributoConj.text);
	var valorBBA: int = int(textBBA.text);

	GerenciadorPersonagens.adicionar_novo_personagem(nomePersonagem, valorAtributoConj, valorBBA)
	
	get_tree().change_scene_to_file("res://Cenas/MainMenu.tscn")

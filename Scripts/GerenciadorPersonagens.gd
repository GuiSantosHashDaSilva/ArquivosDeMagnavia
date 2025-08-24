# GerenciadorPersonagens.gd
extends Node


var lista_de_personagens: Array[Personagem] = [];
var item_list_node: Node = null
var feiticoSelecionado: Feitico = null;
var personagemSelecionado: Personagem = null;

func setFeiticoSelecionado(_feiticoSelecionado:Feitico) -> void:
	self.feiticoSelecionado = _feiticoSelecionado;

func setPersonagemSelecionado(_personagemSelecionado:Personagem) -> void:
	self.personagemSelecionado = _personagemSelecionado;

func adicionar_novo_personagem(nome:String, valorAtributoConj:int, valorBBA:int) -> void:
	var novo_personagem: Personagem = Personagem.new(nome, valorAtributoConj, valorBBA);
	lista_de_personagens.append(novo_personagem)
	print("Novo personagem adicionado aos dados: ", novo_personagem.nome)

func adicionarFeitico(nome: String,
	grau: int,
	area1: Array[String],
	area2: Array[String],
	testeResistencia: String,
	CD: int,
	tempoExecucao: String,
	duracao: String,
	componentes: Array[String],
	ataque: int,
	custo: int,
	alcance: String,
	areaEfeito: Array[String],
	descricao: String) -> void:
		var novoFeitico: Feitico = Feitico.new(nome,grau,area1,area2,testeResistencia,CD,tempoExecucao,duracao,componentes,ataque,custo,alcance,areaEfeito,descricao)
		personagemSelecionado.adicionarFeitico(novoFeitico)

extends Resource

class_name Feitico


var nome: String;
var grau: int;
var area1: Array[String];
var area2: Array[String];
var testeResistencia: String;
var CD: int;
var tempoExecucao: String;
var duracao: String;
var componentes: Array[String];
var areaEfeito: Array[String];
var alcance: String;
var ataque: int;
var custo: int;
var descricao: String;
const Icone: String = "res://Assests/Icones/icone_de_feitico_carvalho.png";

func _init(
	_nome: String = "",
	_grau: int = 0,
	_area1: Array[String] = [],
	_area2: Array[String] = [],
	_testeResistencia: String = "",
	_CD: int = 0,
	_tempoExecucao: String = "",
	_duracao: String = "",
	_componentes: Array[String] = [],
	_ataque: int = 0,
	_custo: int = 0,
	_alcance: String = "",
	_areaEfeito: Array[String] = [],
	_descricao: String = ""
) -> void:
	self.nome = _nome;
	self.grau = _grau;
	self.area1 = _area1;
	self.area2 = _area2;
	self.testeResistencia = _testeResistencia;
	self.CD = _CD;
	self.tempoExecucao = _tempoExecucao;
	self.duracao = _duracao;
	self.componentes = _componentes;
	self.ataque = _ataque;
	self.custo = _custo;
	self.alcance = _alcance;
	self.areaEfeito = _areaEfeito;
	self.descricao = _descricao;

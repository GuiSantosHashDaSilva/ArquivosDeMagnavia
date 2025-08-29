extends Node

class_name Personagem

var nome: String;
var valorAtributoConj: int;
var valorBBA: int;
var feiticos: Array = [];
const Icone: String = "res://Assests/Icones/icone_do_personagem_carvalho.png";

func _init(_nome:String, _valorAtributoConj:int, _valorBBA:int) -> void:
	self.nome = _nome;
	self.valorAtributoConj = _valorAtributoConj;
	self.valorBBA = _valorBBA;

func adicionarFeitico(feitico:Feitico) ->void:
	feiticos.append(feitico)

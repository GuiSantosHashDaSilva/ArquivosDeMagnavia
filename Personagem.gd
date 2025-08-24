extends Node

class_name Personagem

var nome: String;
var valorAtributoConj: int;
var valorBBA: int;
var feiticos: Array = [];
const Icone: String = "res://Assests/Icones/icone_do_personagem_carvalho.png";

func _init(nome:String, valorAtributoConj:int, valorBBA:int) -> void:
	self.nome = nome;
	self.valorAtributoConj = valorAtributoConj;
	self.valorBBA = valorBBA;

func adicionarFeitico(feitico:Feitico) ->void:
	feiticos.append(feitico)

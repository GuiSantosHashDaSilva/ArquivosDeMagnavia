extends Resource

class_name Modificador

@export var nome: String = "Adicia";
@export var exigencia: String;
@export var efeito: String;
@export var custo: int;
@export var condicaocusto: Condicao;

func _getCalcCusto()->void:
	if not condicaocusto:
		return
	self.custo = condicaocusto.calculoCusto()

extends Condicao

class_name CondicaoEmpurrao

func calculoCusto() -> int:
	pm = (int(GerenciadorPersonagens.feiticoSelecionado.alcance)/3);
	return pm;

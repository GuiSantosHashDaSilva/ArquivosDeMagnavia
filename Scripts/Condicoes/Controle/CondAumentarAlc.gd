extends Condicao

class_name CondicaoAlmentarAlc

func calculoCusto() -> int:
	pm = (int(GerenciadorPersonagens.feiticoSelecionado.alcance)/3);
	return pm;

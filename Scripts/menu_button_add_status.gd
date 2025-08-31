extends MenuButton

# Sinal emitido quando um item do menu é pressionado.
# Conecte este sinal ao seu script principal para saber qual opção foi escolhida.
signal status_selecionado(index:int)

func _ready() -> void:
	# Pega o menu pop-up associado ao botão
	var popup:PopupMenu = get_popup()

	# Adiciona os itens que aparecerão na lista
	popup.add_item("Agarrado",0)
	popup.add_item("Alucinado",1)
	popup.add_item("Amedrontado",2)
	popup.add_item("Apaixonado",3)
	popup.add_item("Atordoado",4)
	popup.add_item("Bêbado",5)
	popup.add_item("Caído",6)
	popup.add_item("Cego",7)
	popup.add_item("Congelado",8)
	popup.add_item("Desisdratado",9)
	popup.add_item("Empoderado",10)
	popup.add_item("Enfeitiçado",11)
	popup.add_item("Enfurecido",12)
	popup.add_item("Envenenado",13)
	popup.add_item("Estremecido",14)
	popup.add_item("Impedido",15)
	popup.add_item("Incapacitado",16)
	popup.add_item("Inconsciente",17)
	popup.add_item("Invisível",18)
	popup.add_item("Hipotérmico",19)
	popup.add_item("Letárgico",20)
	popup.add_item("Paralisado",21)
	popup.add_item("Pesado",22)
	popup.add_item("Petrificado",23)
	popup.add_item("Queimado",24)
	popup.add_item("Sangramento",25)
	popup.add_item("Sonolento",26)
	popup.add_item("Sufocado",27)
	popup.add_item("Surdo",28)
	popup.add_item("Instável",29)

	# Conecta o sinal 'index_pressed' do pop-up a uma função local.
	# Este sinal é emitido quando um item é clicado, passando seu índice.
	popup.index_pressed.connect(_on_item_pressed)

# Esta função será chamada quando um item for selecionado.
func _on_item_pressed(index: int) -> void:
	# Opcional: Imprime o índice e o texto do item selecionado para depuração
	#print("Item selecionado: ", get_popup().get_item_text(index))

	# Emite um sinal personalizado para que outros nós (como o script principal do jogo)
	# saibam qual dificuldade foi escolhida.
	status_selecionado.emit(index)

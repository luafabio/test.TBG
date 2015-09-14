package preguntados

class EstadisticasController {

    def index() {
		[currentGameInstanceList: (CurrentGame.findAll())]
	}
}

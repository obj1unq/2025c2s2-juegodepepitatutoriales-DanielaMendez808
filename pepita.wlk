
object pepita {
	var property position = game.center() 
	var property energia = 500
	method image(){
		if(self.atrapada() || self.energia() < 9){
		return  "pepita-gris.png"
		}else {return "pepita.png"}
	}
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}
	method gravedad(){
		self.position(game.at(self.position().x(),self.position().y()-1))
	}
	method volar(kms) {
		energia = energia - kms*9 
	}
	method atrapada(){
		return (self.position() == silvestre.position()) 
	}
	method irA(positionDestino){
        if(energia >= position.distance(positionDestino)*9 && !self.estaEnBorde(positionDestino)){
            self.volar(position.distance(positionDestino))
            position= positionDestino
	}
	}
	method estaEnBorde(positionDestino){
		return positionDestino.x() == -1 || positionDestino.x() == 10 || positionDestino.y() == -1 || positionDestino.y() == 10
	}
}
object manzana{
	var property position = game.at(2,4)
	method image(){
		return "manzana.png"
	}
	
}
object nido{
	var property position = game.at(5,6)
	method image(){
		return "nido.png"
	}
}
object alpiste{
	var property position = game.at(3,4)
	method image(){
		return "alpiste.png"
	}
	method energia(){
		return 30
	}
}
object silvestre{
	var property position = game.origin()
	method image(){
		return "silvestre.png"
	}
	  method centrar() {
    	position = game.center()
    }
	method position(){
		if (pepita.position().x() < 3){
			return game.at(3,0)
		}else{
		return game.at(pepita.position().x(),0)
		}
	}
	method derecha() {
    position = position.right(1)
	}
	method izquierda() {
    position = position.left(1)
	}
}
object config {
    method configTeclas() {
      keyboard.left().onPressDo({pepita.irA(pepita.position().left(1))})
      keyboard.right().onPressDo({pepita.irA(pepita.position().right(1))})
      keyboard.up().onPressDo({pepita.irA(pepita.position().up(1))})
      keyboard.down().onPressDo({pepita.irA(pepita.position().down(1))})

    }
}
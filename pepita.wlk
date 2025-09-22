
object pepita {
	var property position = game.center() 
	var energia = 100
	method image(){
		if(self.atrapada()){
		return  "pepita-gris.png"
		}else {return "pepita.png"}
	}
	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	method atrapada(){
		return (self.position() == silvestre.position()) 
	}
	
	method energia() {
		return energia
	}
	method derecha() {
    	position = position.right(1)
	}
	method izquierda() {
    	position = position.left(1)
	}
	method arriba() {
		position = position.up(1)
	}
	method abajo() {
    	position = position.down(1)
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
	method perseguirAPepita(){
		if (pepita.derecha()){
			self.derecha()
		}else if (pepita.izquierda()){
			self.izquierda()
		}
	}
	method position(){
		if (pepita.position().x() > 3){
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

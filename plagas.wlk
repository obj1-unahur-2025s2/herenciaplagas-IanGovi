import elementos.*

class Plagas{
    var property poblacion
    method transmiteEnfermedades() = poblacion >= 10
    method atacar(unElemento) {
      unElemento.recibirAtaque(self)
      poblacion = poblacion * 1.1
    }

}

class PlagaDeCucarachas inherits Plagas {
    var property pesoPromedio

    method nivelDeDanio() = poblacion / 2
    // super() es para cosas dentro de los metodos que se repiten, haciendo que llame al mismo metodo en la clase padre
    // el mismo metodo de clase padre debe ser del mismo tipo, indicacion o consulta
    override method transmiteEnfermedades() = pesoPromedio >= 10 && super()
    override method atacar(unElemento) {
        super(unElemento)
        pesoPromedio += 2
    }
}

class PlagaDePulgas inherits Plagas {
    method nivelDeDanio() = poblacion * 2
}

class PlagaDeGarrapatas inherits PlagaDePulgas{
    override method atacar(unElemento) {
        unElemento.recibirAtaque(self)
        poblacion = poblacion * 1.2
    }
}

class PlagaDeMosquitos inherits Plagas {
    method nivelDeDanio() = poblacion
    override method transmiteEnfermedades()= poblacion % 3 == 0 && super()

}
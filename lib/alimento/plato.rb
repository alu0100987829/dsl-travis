require "alimento/version"

class Error < StandardError; end
module Alimento
  # Plato formado por cantidades de uno o más alimentos.
  class Plato
    include Comparable
    attr_reader :nombre, :listaAlimentos, :listaGramos
    def initialize (nombre, listaAlimentos, listaGramos)
      @nombre = nombre
      @listaAlimentos = listaAlimentos
      @listaGramos = listaGramos
    end
    # Devuelve el total de proteínas del plato.
    def getProteinas
      aux = listaAlimentos.head
      aux2 = listaGramos.head
      proteinas = 0
      gramosTotales = 0
      while aux != nil && listaGramos != nil
        proteinas += aux.value.proteinas * (aux2.value/100)
        gramosTotales = aux2.value
        aux = aux.next
        aux2 = aux2.next
      end
      return ((proteinas * 100)/gramosTotales).round(2)
    end
    # Devuelve el total de lípidos del plato.
    def getLipidos
      aux = listaAlimentos.head
      aux2 = listaGramos.head
      lipidos = 0
      gramosTotales = 0
      while aux != nil && listaGramos != nil
        lipidos += aux.value.lipidos * (aux2.value/100)
        gramosTotales = aux2.value
        aux = aux.next
        aux2 = aux2.next
      end
      return ((lipidos * 100)/gramosTotales).round(2)
    end
    # Devuelve el total de carbohidratos del plato.
    def getCarbohidratos
      aux = listaAlimentos.head
      aux2 = listaGramos.head
      carbohidratos = 0
      gramosTotales = 0
      while aux != nil && listaGramos != nil
        carbohidratos += aux.value.carbohidratos * (aux2.value/100)
        gramosTotales = aux2.value
        aux = aux.next
        aux2 = aux2.next
      end
      return ((carbohidratos * 100)/gramosTotales).round(2)
    end
    # Devuelve la cantidad total de gramos del plato.
    def getGramosTotales
      aux = listaGramos.head
      gramosTotales = 0
      while aux != nil
        gramosTotales = aux.value
        aux = aux.next
      end
      return gramosTotales
    end
    # Devuelve el total del valor calórico del plato.
    def getValorCaloricoTotal
      proteinas = (getProteinas * getGramosTotales) / 100
      carbohidratos = (getCarbohidratos * getGramosTotales) / 100
      lipidos = (getLipidos * getGramosTotales) / 100
      return (proteinas*4 + carbohidratos*9 + lipidos*4).round(2)
    end
    def to_s
      ret = "Nombre: #{@nombre}\n"
      ret << listaAlimentos.to_s
      ret += "\n"
      ret
    end
    def <=>(other)
      if other != nil
        getValorCaloricoTotal <=> other.getValorCaloricoTotal
      end
    end
  end
  # Clase que hereda de Plato y añade funcionalidad relacionada
  # con el impacto ambiental de un plato de alimentos.
  class PlatoEnergetico < Plato
    def initialize (nombre, listaAlimentos, listaGramos)
      super(nombre, listaAlimentos, listaGramos)
    end
    # Devuelve las emisiones de gases de efecto invernadero de un plato.
    def getEmisionGEI
      aux = listaAlimentos.head
      aux2 = listaGramos.head
      
      geiTotal = 0
      while aux != nil && aux2 != nil
        geiTotal += aux.value.GEI * (aux2.value / 100)
        aux = aux.next
        aux2 = aux2.next
      end
      geiTotal.round(2)
    end

    # Devuelve el terreno consumido por los alimentos de un plato.
    def getTerreno
      aux = listaAlimentos.head
      aux2 = listaGramos.head

      terrenoTotal = 0
      while aux != nil && aux2 != nil
        terrenoTotal = aux.value.terreno * (aux2.value / 100)
        aux = aux.next
      end
      terrenoTotal.round(2)
    end
    
    def to_s
      super + "Eficiencia energética: #{getValorCaloricoTotal}\n"
    end
  end
end

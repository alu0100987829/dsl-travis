require "alimento/version"

module Alimento
  class Error < StandardError; end
  # Representación de un alimento, junto con las propiedades nutricionales y ambientales
  # que lo definen. Es inicializado con los parámetros "nombre", "proteínas",
  # "carbohidratos", "lípidos", "GEI" (Gases de Efecto Invernadero) y "terreno":
  class Alimento
    include Comparable
    attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :GEI, :terreno
    def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @GEI = gei
      @terreno = terreno
    end
    
    # Devuelve el nombre del alimento.
    def getNombre
      @nombre
    end

    # Devuelve el factor de gases de efecto invernadero.
    def getGEI
      @GEI
    end

    # Devuelve el terreno utilizado.
    def getTerreno
      @terreno
    end

    # Devuelve las proteínas del alimento.
    def getProteinas
      @proteinas
    end

    # Devuelve los lípidos del alimento.
    def getLipidos
      @lipidos
    end

    # Devuelve los carbohidratos del alimento.
    def getCarbohidratos
      @carbohidratos
    end

    # Devuelve el valor calórico en kcal del alimento.
    def getValorCalorico
      resultado = '%0.1f' % ((getProteinas * 4) + (getLipidos * 4) + (getCarbohidratos * 9))
      return resultado.to_f
    end

    def to_s
      "#{@nombre}"
    end

    def <=>(other)
      if other != nil
        getValorCalorico<=>other.getValorCalorico
      end
    end

    # Calcula las calorías de una dieta a partir de los valores calóricos
    # de esta.
    def calcularCaloriasDieta(*valores_caloricos)
      resultado = getValorCalorico
      for valor in valores_caloricos
        resultado += valor
      end
      return resultado.round(1)
    end

    # Calcula el factor de gases de efecto invernadero a partir de valores
    # de gases de efecto invernaderos o GEIs.
    def calcularGEI(*geis)
      resultado = getGEI
      for gei in geis
        resultado += gei 
      end
      return resultado.round(2)
    end

    # Calcula el terreno consumido por la creación del alimento a partir
    # de valores de terreno de este.
    def calcularTerreno(*terrenos)
      resultado = getTerreno
      for terreno in terrenos
        resultado += terreno 
      end
      return resultado.round(2)
    end
  end
end

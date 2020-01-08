require "./lib/alimento.rb"

alimento = Alimento::Alimento.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
carneVaca = Alimento::Alimento.new("carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
carneCordero = Alimento::Alimento.new("carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
camarones = Alimento::Alimento.new("camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
chocolate = Alimento::Alimento.new("chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
salmon = Alimento::Alimento.new("salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
cerdo = Alimento::Alimento.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
pollo = Alimento::Alimento.new("pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
queso = Alimento::Alimento.new("queso", 25.0, 1.3, 33.0, 11.0, 41.0)
cerveza = Alimento::Alimento.new("cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
lecheVaca = Alimento::Alimento.new("leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
huevos = Alimento::Alimento.new("huevos", 13.0, 1.0, 11.0, 4.2, 5.7)
cafe = Alimento::Alimento.new("cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
tofu = Alimento::Alimento.new("tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
lentejas = Alimento::Alimento.new("lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
nuez = Alimento::Alimento.new("nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

RSpec.describe Alimento::Alimento do

  alimentos = [carneVaca, carneCordero, camarones, chocolate, salmon, cerdo, pollo, queso, cerveza,
               lecheVaca, huevos, cafe, tofu, lentejas, nuez]

  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end

  it "Crea un objeto de tipo 'alimento'" do
    expect(alimento).to be_kind_of(Alimento::Alimento)
  end

  it "Existe un nombre para el alimento" do
    expect(alimento).to have_attributes(:nombre => "carne de vaca")
  end

  it "Existe un GEI para el alimento" do
    expect(alimento).to have_attributes(:GEI => 50.0)
  end

  it "Existe un terreno para el alimento" do
    expect(alimento).to have_attributes(:terreno => 164.0)
  end

  it "Existe getter para el atributo 'nombre'" do
    expect(alimento.getNombre).to eq("carne de vaca")
  end

  it "Existe getter para el atributo 'GEI'" do
    expect(alimento.getGEI).to eq(50.0)
  end

  it "Existe getter para el atributo 'terreno'" do
    expect(alimento.getTerreno).to eq(164.0)
  end

  it "Existe método que convierte nombre a string" do
    expect(alimento.to_s).to eq("carne de vaca")
  end

  it "Existe método que calcule valor calórico para un alimento" do
    expect(alimento.getValorCalorico).to eq(96.8)
  end

  it "Existe método para evaluar si la alimentación es buena (3kcal hombre, 2.3kcal mujer)" do
    expect(cafe.calcularCaloriasDieta(chocolate.getValorCalorico * 3, lentejas.getValorCalorico,
                                      cerveza.getValorCalorico)).to eq(2295.0)
  end

  it "Existe método para calcular GEI de la dieta" do
    expect(cafe.calcularGEI(chocolate.getGEI * 3, lentejas.getGEI, cerveza.getGEI)).to eq(7.94)
  end

  it "Existe método para calcular terreno de la dieta" do
    expect(cafe.calcularTerreno(chocolate.getTerreno * 3, lentejas.getTerreno, cerveza.getTerreno)).to eq(14.12)
  end
end

# Unit tests para la clase List
RSpec.describe Alimento::List do

  it "has a version number" do
    expect(Alimento::VERSION).not_to be nil
  end

  it "Crea un objeto de tipo 'lista'" do
    lista = Alimento::List.new()
    expect(lista).to be_kind_of(Alimento::List)
  end

  it "Crea un objeto de tipo 'lista' con argumentos" do
    lista = Alimento::List.new(3, "ruby", true)
    expect(lista).to be_kind_of(Alimento::List)
    expect(lista.first).to eq(3)
    expect(lista.last).to eq(true)
  end

  it "Comprobar que la lista comienza vacía" do
    lista = Alimento::List.new()
    expect(lista.empty).to eq(true)
  end
  
  it "Existe nodo con datos, nodo siguiente y nodo previo" do
    lista = Alimento::List.new()
    lista << 5
    lista << 10
    lista << 15
    first = lista.head
    second = first.next
    third = second.next
    expect(first.value).to eq(5)
    expect(second.value).to eq(10)
    expect(third.value).to eq(15)
  end

  it "Existe lista con cabeza y cola" do
    lista = Alimento::List.new()
    lista << 5
    lista << "ruby"
    expect(lista.head).not_to be nil
    expect(lista.tail).not_to be nil
  end

  it "Se puede insertar un elemento en la lista" do
    lista = Alimento::List.new()
    lista << 8
    expect(lista.tail.value).to eq(8)
  end

  it "Se pueden insertar varios elementos en la lista" do
    lista = Alimento::List.new()
    lista << 3
    expect(lista.tail.value).to eq(3)
    lista << "ruby"
    expect(lista.tail.value).to eq("ruby")
    lista << true
    expect(lista.tail.value).to eq(true)
  end

  it "Se extrae el primer elemento de la lista" do
    lista = Alimento::List.new()
    lista << "test"
    lista << 4
    expect(lista.first).to eq("test")
  end

  it "Se extrae el último elemento de la lista" do
    lista = Alimento::List.new()
    lista << "test"
    lista << 4
    expect(lista.last).to eq(4)
  end

  it "Estimación emisiones diarias de GEI" do
#    alimento = lista_española.first
#    gei = alimento.calcularGEI(*lista_española)
#    expect(gei).to eq(4.6)
  end
end

# Práctica 8
RSpec.describe Alimento::Alimento do
  context "Clase Alimento es comparable: " do
    it "Comparando operador < " do
      expect(cafe < lentejas).to eq(true)
    end
    it "Comparando operador > " do
      expect(cafe > lentejas).to eq(false)
    end
    it "Comparando operador == " do
      expect(cafe == cafe).to eq(true)
      expect(cafe == lentejas).to eq(false)
    end
  end
end

RSpec.describe Alimento::List do
  context "Clase List es enumerable: " do
    @testList = Alimento::List.new(lentejas.getValorCalorico,
                    cafe.getValorCalorico, tofu.getValorCalorico,
                    nuez.getValorCalorico)
    auxMax = @testList.max

    it "Comprobamos máximo" do
      expect(auxMax).to eq(567.6)
    end

    auxMin = @testList.min

    it "Comprobamos mínimo" do
      expect(auxMin).to eq(0.4)
    end

    sort = [cafe.getValorCalorico, tofu.getValorCalorico, nuez.getValorCalorico,
            lentejas.getValorCalorico]

    auxSort = @testList.sort

    it "Comprobamos ordenación" do
      expect(auxSort).to eq(sort)
    end

    it "Comprobamos collect" do
      array = [nil, nil, nil]
      expect((1..3).collect {}).to eq(array)
    end

    it "Comprobamos condición usando select" do
      selection = auxSort.select { |x| x % 2 == 1 }
      expect(selection).to eq([485.0])
    end
  end
end

RSpec.describe Alimento::Plato do
  context "Funcionalidad básica clase Plato: " do
    before :all do
      @listaAlimentos = Alimento::List.new(carneVaca, huevos, tofu, cerveza)
      @listaGramos = Alimento::List.new(300, 200, 50, 500)
      @plato = Alimento::Plato.new("Plato de la dieta", @listaAlimentos, @listaGramos)
    end

    it "Existe un objeto plato" do
      expect(Alimento::Plato.new(nil, nil, nil)).to be_kind_of(Alimento::Plato)
    end

    it "Comprobamos nombre del plato" do
      expect(@plato.nombre).to eq("Plato de la dieta")
    end

    it "Comprobamos conjunto de alimentos" do
      expect(@plato.listaAlimentos).not_to eq(nil)
    end

    it "Comprobamos conjunto de cantidades" do
      expect(@plato.listaGramos).not_to eq(nil)
    end

    it "Comprobamos porcentaje de proteinas del plato" do
      expect(@plato.getProteinas).to eq(18.36)
    end

    it "Comprobamos porcentaje de lípidos del plato" do
      expect(@plato.getLipidos).to eq(6.26)
    end

    it "Comprobamos porcentaje de carbohidratos del plato" do
      expect(@plato.getCarbohidratos).to eq(4.0)
    end

    it "Comprobamos valor calórico total del plato" do
      expect(@plato.getValorCaloricoTotal).to eq(672.4)
    end

    it "Comprobamos plato formateado" do
      str = "Nombre: Plato de la dieta\n{carne de vaca, huevos, tofu, cerveza}\n"
      # str = "Nombre: \"Plato de la dieta\"\nAlimentos:\ncarne de vaca: 21.1 - 0.0 - 3.1 - 50.0 - 164.0\nhuevos: 13.0 - 1.0 - 11.0 - 4.2 - 5.7\ntofu: 8.0 - 1.9 - 4.8 - 2.0 - 2.2\ncerveza: 0.5 - 3.6 - 0.0 - 0.24 - 0.22\n"
      expect(@plato.to_s).to eq(str)
    end
  end
end

RSpec.describe Alimento::PlatoEnergetico do
  before :all do
    listaAlimentos = Alimento::List.new(carneVaca, huevos, tofu, cerveza)
    listaGramos = Alimento::List.new(300, 200, 50, 500)
    @platoEnergetico = Alimento::PlatoEnergetico.new("Plato de la dieta", listaAlimentos, listaGramos)
  end

  it "Existe una instancia PlatoEnergetico" do
    expect(Alimento::PlatoEnergetico.new(nil, nil, nil)).to be_an_instance_of(Alimento::PlatoEnergetico)
  end

  it "Comprobamos PlatoEnergetico subclase de Platos" do
    expect(Alimento::PlatoEnergetico.new(nil, nil, nil)).to be_kind_of(Alimento::Plato)
  end

  it "Comprobamos valor total de emisiones diarias de GEI" do
    expect(@platoEnergetico.getEmisionGEI).to eq(159.6)
  end

  it "Comprobamos valor total de terreno ocupado" do
    expect(@platoEnergetico.getTerreno).to eq(0.66)
  end

  it "Formato to_s eficiencia energética" do
    str = "Nombre: Plato de la dieta\n{carne de vaca, huevos, tofu, cerveza}\nEficiencia energética: 672.4\n"
    expect(@platoEnergetico.to_s).to eq(str)
  end
end

RSpec.describe Alimento::Plato do
  before :all do
    listaAlimentos = Alimento::List.new(carneVaca, huevos, tofu, cerveza)
    listaGramos = Alimento::List.new(300, 200, 50, 500)
    @platoEnergeticoVaca = Alimento::PlatoEnergetico.new("Plato de la vaca", listaAlimentos, listaGramos)

    listaAlimentos = Alimento::List.new(carneCordero, cafe, salmon, tofu)
    listaGramos = Alimento::List.new(300, 500, 200, 50)
    @platoEnergeticoCordero = Alimento::PlatoEnergetico.new("Plato del cordero", listaAlimentos, listaGramos)
  end

  it "Comprobar dieta cordero más eficiente que dieta vaca" do
    expect(@platoEnergeticoCordero > @platoEnergeticoVaca).to eq(true)
  end
end

# Práctica 9
RSpec.describe Alimento do
  context "Tests menú dietético" do
    before :all do
      @carne = Alimento::List.new(carneVaca, carneCordero, cerdo)
      @gramosCarne = Alimento::List.new(300, 200, 250)
      @platoCarne = Alimento::PlatoEnergetico.new("Plato de carne", @carne, @gramosCarne)
      @vegetariano = Alimento::List.new(tofu, cerveza, lentejas, nuez)
      @gramosVegetariano = Alimento::List.new(300, 100, 200, 50)
      @platoVegetariano = Alimento::PlatoEnergetico.new("Plato vegetariano", @vegetariano, @gramosVegetariano)
      @lacteo = Alimento::List.new(queso, lecheVaca, chocolate, cafe)
      @gramosLacteo = Alimento::List.new(300, 200, 50, 500)
      @platoLacteo = Alimento::PlatoEnergetico.new("Plato con lactosa", @lacteo, @gramosLacteo)

      # Menú dietético -> array[plato<huellaNutricional>]
      @menu = [@platoCarne, @platoVegetariano, @platoLacteo]
      # Conjunto de precios -> array[float]
      @precioMenu = [4.10, 3.50, 3.00]

      @indicesEnergia = @menu.map {
        |x| if x.getValorCaloricoTotal < 670
          1
        elsif x.getValorCaloricoTotal <= 830
          2
        else
          3
        end
      }
      @indicesCarbono = @menu.map {
        |x| if x.getEmisionGEI < 800
          1
        elsif x.getEmisionGEI <= 1200
          2
        else
          3
        end
      }

      # Huellas nutricionales para cada menú -> array[float]
      @huellasNutricionales = [@indicesEnergia, @indicesCarbono].transpose.map { |x| x.reduce(:+) / 2.0 }
    end
    it "Calcular plato con máxima huella nutricional" do
      expect(@menu.zip(@huellasNutricionales).reduce { |a, b| (a.last > b.last) ? a : b }.first).to eq(@platoLacteo)
    end
    it "Incrementar precio de los platos en proporción a la máxima huella nutricional" do
      expect(@precioMenu.map { |x| x * @menu.zip(@huellasNutricionales).reduce { |a, b| (a.last > b.last) ? a : b }.last }).to eq(@precioMenu.map { |x| x * 2.0 })
    end
  end
end
# Práctica 10
RSpec.describe Alimento::PlatoDSL do
  before :all do
      @plato = Alimento::PlatoDSL.new("Hamburguesa") do
        nombre    "Hamburguesa especial de la casa"
        alimento  carneVaca,
                  :gramos => 100
        alimento  huevos,
                  :gramos => 200
      end
  end
  context "Test plato DSL" do
    it "Crear un nuevo plato utilizando el DSL" do
      expect(@plato.to_s).to eq("Hamburguesa especial de la casa\n" +
                                "carne de vaca - 100 gramos\n" +
                                "huevos - 200 gramos")
    end
  end
end

RSpec.describe Alimento::MenuDSL do
  before :all do
      guiso = Alimento::PlatoDSL.new("Guiso de lentejas") do
        nombre    "Guiso de lentejas con carne"
        alimento  lentejas,
                  :gramos => 150
        alimento  carneCordero,
                  :gramos => 75
      end
      hamburguesa = Alimento::PlatoDSL.new("Hamburguesa") do
        nombre    "Hamburguesa especial de la casa"
        alimento  carneVaca,
                  :gramos => 200
        alimento  huevos,
                  :gramos => 100
      end
      cervezaMenu = Alimento::PlatoDSL.new("Cerveza") do
        nombre    "Cerveza de importación"
        alimento  cerveza,
                  :gramos => 250
      end

      # Menú
      @menu = Alimento::MenuDSL.new("Combinado nº. 1") do
        descripcion "Guiso, hamburguesa, cerveza"
        componente  guiso,
                    :precio => 3.50
        componente  hamburguesa,
                    :precio => 4.25
        componente  cervezaMenu,
                    :precio => 2.00
        precio      9.75
      end
  end
  context "Test menú DSL" do
    it "Crear un nuevo menú utilizando el DSL" do
      expect(@menu.to_s).to eq("Menu: Guiso, hamburguesa, cerveza\n" +
                               "Platos:\n" +
                               "Plato 1: 3.5€\n" +
                               "Guiso de lentejas con carne\n" +
                               "lentejas - 150 gramos\n" +
                               "carne de cordero - 75 gramos\n" +
                               "Valor nutricional: 567.58\n" +
                               "Valor ambiental: 0.4\n" +
                               "Plato 2: 4.25€\n" +
                               "Hamburguesa especial de la casa\n" +
                               "carne de vaca - 200 gramos\n" +
                               "huevos - 100 gramos\n" +
                               "Valor nutricional: 298.6\n" +
                               "Valor ambiental: 104.2\n" +
                               "Plato 3: 2.0€\n" +
                               "Cerveza de importación\n" +
                               "cerveza - 250 gramos\n" +
                               "Valor nutricional: 68.8\n" +
                               "Valor ambiental: 0.48")
    end
  end
end

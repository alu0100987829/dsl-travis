require "alimento/version"

class Error < StandardError; end
module Alimento
  # Nodo forma los elementos con valor genérico que forman parte de
  # la lista.
  Nodo = Struct.new(:value, :next, :prev)
  # Lista doblemente enlazada y enumerable. Es posible inicializarla
  # añadiéndole valores desde un principio.
  class List
    include Enumerable
    attr_reader :head, :tail
    def initialize(*values)
      @head = Nodo.new(nil, nil, nil)
      @tail = @head
      if values != nil
        values.each { |value| unshift(value) }
      end
    end
    # Devuelve un booleano indicando si la lista se encuentra vacía.
    def empty
      @head.value == nil
    end
    # Devuelve el número de elementos contenidos en la lista.
    def size
      if empty
        0
      elsif head == tail && head.value != nil
        1
      else
        i = 1
        aux = @head
        while aux != @tail
          i += 1
          aux = aux.next
        end
        i
      end
    end
    # Inserta un elemento "value" al final de la lista
    def unshift(value)
      if empty
        @head.value = value
      elsif size == 1
        @tail = Nodo.new(value, nil, @head)
        @head.next = @tail
      else
        aux = Nodo.new(@tail.value, nil, @tail.prev)
        pre_tail = @tail.prev
        @tail = Nodo.new(value, nil, aux)
        aux.next = @tail
        pre_tail.next = aux
      end
    end
    def <<(value)
      unshift(value)
    end
    # Devuelve la cabeza de la lista
    def first
      @head.value
    end
    # Devuelve la cola de la lista
    def last
      @tail.value
    end
    def to_s
      ret = "{"
      aux = @head
      while (aux != @tail) do
        ret += "#{aux.value.to_s}, "
        aux = aux.next
      end
      ret += "#{aux.value.to_s}}"
      return ret
    end
    def each
      aux = @head
      while (aux != nil)
        yield aux.value
        aux = aux.next
      end
    end
  end
end

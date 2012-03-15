# encoding: utf-8

require "yaml"

class Genero
  GENEROS = YAML::load(DATA)["generos"]
  
  FEMININO = 0
  MASCULINO = 1
  
  def initialize(termo)
    @termo = termo
  end
  
  def feminino
    @feminino ||= genero_para(FEMININO)
  end
  
  def masculino
    @masculino ||= genero_para(MASCULINO)
  end
  
  protected
  def genero(n)
    n == 0 ? "feminino" : "masculino"
  end
  
  def genero_para(genero)
    case
      when by_irregulares(genero) then return by_irregulares(genero)[genero + 1]
      when by_neutros(genero) then return by_neutros(genero)
      else by_rules_for(genero)
    end
  end
  
  def by_neutros(genero)
    @by_neutros ||= GENEROS["neutros"].find {|t| Regexp.new("^#{t}$").match(@termo) } && @termo
  end
  
  def by_irregulares(genero)
    @by_irregulares ||= {}
    @by_irregulares[genero] ||= Genero.irregulares.find {|t| t[genero] == @termo }
  end
  
  def by_rules_for(genero_id)
    genero = self.genero(genero_id)
    
    @by_rules_for ||= {}

    return @by_rules_for[genero] if @by_rules_for[genero]
    
    rule = GENEROS[genero].map {|rule| [Regexp.new("^#{rule[0]}$"), rule[1]] }.find {|rule| rule[0].match(@termo)  }
    
    @by_rules_for[genero] = rule && @termo.gsub(*rule) || @termo
  end
  
  def self.irregulares
    @@irregulares ||= GENEROS["irregulares"].map {|element| [element, element[0]].flatten }
  end
end
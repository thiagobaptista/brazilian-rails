# encoding: utf-8

require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/../lib/brstring/genero'

class GeneroTest < Test::Unit::TestCase
  # Testes de termos irregulates
  [%w[pai mãe], %w[padre madre], %w[boi vaca], %w[ator atriz]].each do |termo| 
    #define_method "test_feminino_de_#{termo[0]}_para_#{termo[1]}" do
    #  assert_equal termo[1], Genero.new(termo[0]).feminino
    #end
  
    define_method "test_masculino_de_#{termo[1]}_para_#{termo[0]}" do
      assert_equal termo[0], Genero.new(termo[1]).masculino
    end
  end
  
  %w[criança estudante fã artista atleta modelo personagem protagonista].each do |termo| 
    #define_method "test_feminino_para_#{termo}_nao_deve_mudar_genero" do
    #  assert_equal termo, Genero.new(termo).feminino
    #end

    define_method "test_masculino_para_#{termo}_nao_deve_mudar_genero" do
      assert_equal termo, Genero.new(termo).masculino
    end
  end
  
  [%w[traidor traidora], %w[aluno aluna], %w[irmão irmã]].each do |termo| 
    #define_method "test_feminino_de_#{termo[0]}_para_#{termo[1]}" do
    #  assert_equal termo[1], Genero.new(termo[0]).feminino
    #end
  
    define_method "test_masculino_de_#{termo[1]}_para_#{termo[0]}" do
      assert_equal termo[0], Genero.new(termo[1]).masculino
    end
  end
end
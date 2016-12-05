#!/usr/bin/env ruby

# Escreva um algoritmo (em qualquer linguagem) que resolva a seguinte questão:
# Um professor citou as seguintes definições:
#   1. Número esotérico é todo número inteiro divisível por 3 e 5
#   2. Número cético é todo número inteiro que não é esotérico
#   3. Número primo é todo número inteiro divisível somente por 1 e ele mesmo
#   Faça um algoritmo que dado um número inteiro descubra se ele é Esotérico, Cético e/ou Primo

require 'prime'

def which_kind_of_number(number_string)
  return "Por favor, forneça um número inteiro." unless number_string.match(/^\d+$/)
  properties = []
  number = number_string.to_i
  (number%3 == 0 || number%5 == 0) ? properties.push('esotérico') : properties.push('cético')
  properties.push('primo') if Prime.prime?(number)

  properties.join(',')
end
puts("#{ARGV[0]} é #{which_kind_of_number(ARGV[0])}")
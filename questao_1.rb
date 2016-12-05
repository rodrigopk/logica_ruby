#!/usr/bin/env ruby

# 1. Escreva um algoritmo (em qualquer linguagem) que resolva a seguinte questão:

# Paulo trabalha na recepção de uma empresa agenciadora de matrimônios, ele faz a primeira triagem das pessoas que procuram a agência e as encaminha para determinada sala de atendimento, dependendo da idade da pessoa. Até 25 anos, dois meses e 15 dias: sala 1, de 25 anos, 2 meses e 16 dias até 45 anos e 1 mês: sala 2, de 45 anos,1 mês e 1 dia até 65 anos : sala 3, mais velhos que isto na sala 4 .
# Faça um algoritmo que dada a data de nascimento descobre a sala correta.
require 'date'
require 'active_support'
require 'active_support/core_ext'

def which_room(date_string)
  date = Date.parse(date_string)
  room = case date 
    when Date.today.advance(years: -25).advance(months:-2).advance(days:-15) .. Date.today
      1
    when Date.today.advance(years: -45).advance(months:-1) .. Date.today.advance(years: -25).advance(months:-2).advance(days:-16)
      2
    when Date.today.advance(years: -65) .. Date.today.advance(years: -45).advance(months:-1).advance(days:-1)
      3
    else
      4
    end
end

puts("Sala: #{which_room(ARGV[0])}")

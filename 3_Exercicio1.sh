#!/bin/bash

####################################################################################
#
# 	Seção 3 : Criando e Executandoo um Shell Script
#	
#	Exercício 1 
#
#	Autor: Rodrigo de Oliveira (rodrigoliveira132@gmail.com.br)
#
#	Exercício: Crie um Script que após executado solicite dois valores como entrada. Esses valores devem ser somados e o resultado exibido para o usuário.
#
#	Exemplo de uso: ./3_Exercicio1.sh
#
#	Alterações:
#	Dia 06/04/2020 - Criação do Script
#
####################################################################################

IFS=\| read VALOR1 VALOR2 <<< "$(zenity --forms --text "Exercício SOMA!!!"\
	--add-entry "Valor 1: " \
	--add-entry "Valor 2: " )" 
RESULTADO=`expr $VALOR1 + $VALOR2` 
zenity --info --title "Resultado da Soma" --text "O resultado é: $RESULTADO" --width="120" --height="100"

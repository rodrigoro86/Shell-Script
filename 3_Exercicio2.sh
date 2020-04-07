#!/bin/bash

####################################################################################
#
# 	Seção 3 : Criando e Executandoo um Shell Script
#	
#	Exercício 2 
#
#	Autor: Rodrigo de Oliveira (rodrigoliveira132@gmail.com.br)
#
# 	2. Crie um script que gere um relatório de algumas informações da máquina atual:
#	• Nome da Máquina
# 	• Data e Hora Atual
# 	• Desde quando a máquina está ativa
#	• Versão do Kernel
#	• Quantidade de CPUs/Cores
#	• Modelo da CPU
#	• Total de Memória RAM Disponível
#	• Partições
#	Abaixo um exemplo de saída, mas faça como achar melhor, desde que cumpra os requisitos acima.
#	===============================================
#	Relatório da Máquina: linux-debian
#	Data/Hora: sáb ago 19 14:38:44 -03 2017
#	===============================================
#	Máquina Ativa desde: 2017-08-19 14:03:28
#	Versão do Kernel: 4.9.0-3-amd64
#	CPUs:
#	Quantidade de CPUs/Core: 4
#	Modelo da CPU: Intel(R) Core(TM) i3 CPU M 370 @ 2.40GHz
#	Memória Total: 7857 MB
#	Partições:
#	Sist. Arq. Tam. Usado Disp. Uso% Montado em
#	/dev/sda1 23G 5,0G 17G 23% /
#	/dev/sda8 255G 14G 229G 6% /home
#	/dev/sda5 9,2G 650M 8,0G 8% /var
#	/dev/sda7 1,9G 6,3M 1,7G 1% /tmp
#
#	Dicas de comandos:
#	• uname – informações do sistema
#	• /proc/cpuinfo – informações de CPUs
#	• /proc/meminfo ou free – informações de memória
#	• hostname – nome da máquina
#	• uptime – último restart
#	• df – Exibir as partições
#	O maior desafo desse exercício é combinar os comandos para extrair e
#	formatar a informação desejada. Use os comandos tr, cut, grep, sed e etc para
#	isso. Use as ajudas pelo man e --help para identifcar a melhor opção em cada
#	parâmetro.
#
#	Exemplo de uso: ./3_Exercicio2.sh
#
#	Alterações:
#	Dia 07/04/2020 - Criação do Script
#
####################################################################################

HOSTNAME=$(hostname)
DATA=$(date  "+%x %X")
UPTIME=$(uptime -s)
VERSAO_KERNEL=$(uname -r)
CPU_CORES=`awk '/cpu cores/ {print $4}' /proc/cpuinfo | tail -n 1`
NOME_MODELO=`awk '/model name/ {print $4,$6 }' /proc/cpuinfo | tail -n 1`
MEMORIA_TOTAL=`awk '/MemTotal/ {print $2,$3}' /proc/meminfo | tail -n 1`
MEMORIA_TOTAL2=`free -h | awk '/Mem/ {print $2}'`
PARTICOES=$(df -h | egrep -v '(tmpfs|udev)')

echo $PARTICOES

echo $MEMORIA_TOTAL2
echo $NOME_MODELO
echo $CPU_CORES
echo $UPTIME
echo $DATA





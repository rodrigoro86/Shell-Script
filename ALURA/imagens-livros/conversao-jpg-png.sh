#!/bin/bash

converte_imagem(){
if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do	
	local IMAGEM_SEM_EXTENSAO=$(ls $imagem | awk -F. '{ print $1 }')
	convert $IMAGEM_SEM_EXTENSAO.jpg png/$IMAGEM_SEM_EXTENSAO.png
done
}

converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then 
	echo "Conversão realizado com sucesso"
else
	echo "Houve uma falha no processo"
fi

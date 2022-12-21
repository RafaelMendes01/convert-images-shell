#!/bin/bash

caminho_arquivo=/home/rafael/Documentos/alura-curso-shell/imagens-novos-livros/
global_caminho=/home/rafael/Documentos/alura-curso-shell/imagens-novos-livros/

cd $caminho_arquivo
if [ ! -d png ]
then
mkdir png
else
rm -r png
mkdir png
fi

vistoria_imagens(){
   cd $1
   $caminho_arquivo={$1%/*}
   for elemento in *
   do
   if [ -f $elemento.png ]
   then
   rm -r $elemento.png
   fi
   local nome_elemento=$(find $caminho_arquivo -name $elemento)
   if [ -d $nome_elemento ]
   then vistoria_imagens $caminho_arquivo/$elemento
   else
   local imagem_sem_extensao=$(ls $elemento | awk -F. '{ print $1 }')
   local extensao=$(ls $elemento | awk -F. '{ print $2 }')
   if [ ! -f $caminho_arquivo/png/$imagem_sem_extensao.png ]
   then
   convert $imagem_sem_extensao.jpg $global_caminho/png$imagem_sem_extensao.png
   mv $global_caminho/png$imagem_sem_extensao.png $global_caminho/png
   echo "$imagem_sem_extensao.jpg converted"
   fi
   fi
   done
   cd $global_caminho  
}

cd $caminho_arquivo
for elemento in *
do
if [ -f $elemento.png ]
then
rm -r $elemento.png
fi
local nome_elemento=$(find $caminho_arquivo -name $elemento)
if [ -d $nome_elemento ]
then vistoria_imagens $caminho_arquivo/$elemento
else
local imagem_sem_extensao=$(ls $elemento | awk -F. '{ print $1 }')
local extensao=$(ls $elemento | awk -F. '{ print $2 }')
if [ ! -f $caminho_arquivo/png$imagem_sem_extensao.png && $extensao == 'jpg' ] 
then
convert $imagem_sem_extensao.jpg /png/$imagem_sem_extensao.png
mv $global_caminho$imagem_sem_extensao.png $global_caminho/png
echo "$imagem_sem_extensao.jpg converted"
fi
fi
done


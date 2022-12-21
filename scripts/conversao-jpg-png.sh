#!/bin/bash

converte_imagem() {
    cd /home/rafael/Documentos/alura-curso-shell/imagens-livros/
    if [ ! -d png ]; then
        mkdir png
    fi

    for imagem in *.jpg; do
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        if [ ! -f png/$imagem_sem_extensao.png ]; then
            rm -r $imagem_sem_extensao.png
            convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
            echo "$imagem_sem_extensao.jpg converted"
        fi
    done
}

converte_imagem
if [ $? -eq 0 ]; then
    echo "Conversao realizada com sucesso"
else
    echo "houve uma falha no processo"
fi

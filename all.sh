#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#
# Este script modificado se encarga de invocar los tres programas que permiten la  
# conversion de un JPG a secuencia de pixeles, se procesan esos pixeles y 
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato 
# PNG para cada imagen ubicada en la carpeta 'img/'
#
# Modificado por: Manuel Felipe Cardoso Forero - manuel.cardoso@correounivalle.edu.co
# Fecha de modificacion: 24-10-2024

for INPUT_JPG in img/*.jpg; do
  TEMP_FILE="${INPUT_JPG%.jpg}.bin"
  
  echo "Procesando ${INPUT_JPG}..."
  python3 fromPNG2Bin.py "${INPUT_JPG}"
  ./main "${TEMP_FILE}"
  python3 fromBin2PNG.py "${TEMP_FILE}.new"
done

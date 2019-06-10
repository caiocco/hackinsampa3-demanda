#!/bin/bash
# 3o. Hack in Sampa 
#
# 03_junta.sh: concatena os csvs sem cabeçalhos para um único arquivo csv
#

# Concatena os csvs limpos num único arquivo
cat *_limpo.csv > dataset.csv

# Verifica se a operação de concatenação foi bem sucedida
if [ $? -gt 0 ]; then
	echo 'Verificar stdout. Um ou mais erros ocorreram'
else
	echo `wc -l dataset.csv | cut -d " " -f 1` 'linhas concatenadas com sucesso'
fi

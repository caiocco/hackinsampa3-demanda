#!/bin/bash
# 3o. Hack in Sampa 
#
# 02_limpa.sh: retira os cabeçalhos indesejáveis dos arquivos csv convertidos
#

# realiza limpeza prévia
find . -maxdepth 1 -name "*_limpo.csv" -exec rm -fv '{}' \; > 02_limpa.log

# loop for para cada arquivo csv, retirando as quatro primeiras linhas 
# indesejáveis com o tail em um arquivo com o sufico "_limpo.csv"
for f in *csv; do tail -n+4 $f > ${f%.csv}_limpo.csv; done

# verifica se a operação de concatenação foi bem sucedida
if [ $? -gt 0 ]; then
        echo 'Verificar stdout. Um ou mais erros ocorreram'
else
        echo `ls -1 *_limpo.csv | wc -l | cut -d " " -f 1` 'arquivos limpos com sucesso'
fi

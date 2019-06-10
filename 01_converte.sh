#!/bin/bash
# 3o. Hack in Sampa
#
# 01_converte.sh: retira espaços dos nomes e converte xls para csv
#
function converte {
# Retira espaços dos nomes, executando o rename 5 vezes
for i in {1..5}
do
	rename ' ' '_' *.xls
done

# Utiliza o find para executar o ssconvert do Gnumeric, convertendo todos os
# arquivos xls em lote. Atenção para a profundidade do find no parâmetro
# maxdepth
echo 'Convertendo' `ls -1 *.xls | wc -l | cut -d " " -f 1` 'arquivos'
find . -maxdepth 1 -name "*.xls" -exec ssconvert {} --export-type=Gnumeric_stf:stf_csv \; >> /dev/null 2>&1

# Verifica se a operação de conversão foi bem sucedida
if [ $? -gt 0 ]; then
        echo 'Verificar stdout. Um ou mais erros ocorreram'
else
        echo `ls -1 *.csv | wc -l | cut -d " " -f 1` 'arquivos convertidos com sucesso'
fi
}

# Verifica se o ssconvert está instalado; se estiver, chama a função converte;
# se não estiver, adverte e aborta
function deps {
which ssconvert >> /dev/null 2>&1

if [ $? -gt 0 ]; then
        echo 'O ssconvert precisa estar instalado. Verifique os pacotes relacionados ao Gnumeric'
        exit
else
        converte
fi
}

# Chama a função deps
deps

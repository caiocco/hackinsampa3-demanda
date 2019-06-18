Scripts para conversão e consolidação de dados de demanda da SPTrans
====================================================================

![Logo colorido](logo-cores.png)

Este repositório é um produto direto da [terceira edição do Hack in Sampa](http://www.saopaulo.sp.leg.br/blog/camara-municipal-sedia-3a-edicao-do-hack-in-sampa/), promovido pelo vereador Police Neto e apoiado por uma série de empresas e organizações.

------------------------------

Os scripts foram executados no openSUSE 42.3 e provavelmente rodarão em qualquer distribuição Linux.

O conjunto de dados utilizado foi obtido e baixado em lote do site da SPTrans utilizando lynx, wget e grep. Para conveniência, você pode baixar os dados de 2019 utilizados durante a hackatona usando o comando `wget -nc -i download.lst` depois de clonar o repositório.

Segue abaixo uma descrição dos scripts:

* `01_converte.sh`: converte os arquivos em formato binário do Excel (XLS) para arquivos de valores separados por vírgula (CSV)
* `02_limpa.sh`: remove os cabeçalhos indesejados
* `03_junta.sh`: concatena os CSVs limpos num arquivo único, chamado de "dataset.csv", pronto para importação num banco de dados relacional

Código licenciado sob a GPL versão 3.

------------------------------

**Observação:** o logo utilizado é parte do projeto e foi desenvolvido por Wanessa Marcondes, responsável pela [prototipagem da interface com o usuário](https://www.figma.com/proto/SdDRWy6ODIlEWmiGs1V7C2TG/Hack-in-Sampa?node-id=0%3A1&scaling=min-zoom).
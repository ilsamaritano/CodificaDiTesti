# Codifica Di Testi (2021/22)
Il progetto contenuto in questo repository è 

Il progetto è stato validato con Xerces.

## Comando per la validazione con Xerces

```shell
$ java -cp \ 
    "Xerces-J-bin.2.12.1/xerces-2_12_1/xml-apis.jar;\
    Xerces-J-bin.2.12.1/xerces-2_12_1/xercesImpl.jar;\
    Xerces-J-bin.2.12.1/xerces-2_12_1/xercesSamples.jar" \
    dom.Counter test.xml
```
## Comando per la trasformazione con il tool di trasformazione XML Saxon-HE

```shell
$ java -jar \
    SaxonHE10-3J/saxon-he-10.3.jar -s:test.xml -xsl:test.xsl -o:test.txt
```

## verificare tool di query con xpath Saxon-HE

```shell
$ java -cp "SaxonHE10-3J/saxon-he-10.3.jar" 
  net.sf.saxon.Query
  \!method=adaptive 
  -s:"Test_maria.xml" 
  -qs:"//titlePart/parent::node()/child::node()/attribute::type"
```

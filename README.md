# Codifica Di Testi (2021/22)
Il progetto contenuto in questo <i>repository</i> è stato realizzato per l'esame di <b>Codifica di Testi</b> con il professor <i>Angelo Mario Del Grosso</i> dagli studenti del <b>Corso di Laurea</b> in <b>Informatica Umanistica</b> (triennale):

- <i>Corrado Baccheschi</i> (mat. 599107)

- <i>Vincenzo Sammartino</i> (mat. 599203) 

Il progetto è stato validato con Xerces con il seguente comando:

## Comando per la validazione con Xerces

```shell
$ java -cp "Xerces-J-bin.2.12.1/xerces-2_12_1/xml-apis.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesImpl.jar;Xerces-J-bin.2.12.1/xerces-2_12_1/xercesSamples.jar" dom.Counter -v prolusioni.xml
```

I file XML e XSL sono stati trasformati con Saxon-HE 10.3 in un file HTML "<i>prolusioni.html</i>" con il seguente comando:

## Comando per la trasformazione con il processore XSLT "Saxon"

```shell
$ java -jar ./SaxonHE10-3J/saxon-he-10.3.jar -s:prolusioni.xml -xsl:stile.xsl -o:prolusioni.html
```
Risultato:
```
prolusioni.xml: 144;31;1 ms (1142 elems, 3177 attrs, 8633 spaces, 39644 chars)
```

## Anteprima

https://hydrerscript.altervista.org/codifica/prolusioni.html

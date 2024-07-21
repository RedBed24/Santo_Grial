---
title: README
author: 
- Samuel Espejo Gil
abstract: |
  Listado de recursos varios para la carrera de Ingeniería Informática de Ciudad Real.
toc-title: Índice
lang: es-ES
linkcolor: blue
---

Este repositorio recoge los archivos fuente usados para crear y publicar el tercer "Santo Grial".

Este documento sirve como explicación del "funcionamiento" del repo y la motivación del mismo.

Se aceptan sugerencias y peticiones para añadir recursos.
De hecho, si has hecho uso de estos recursos y quieres [aportar tu granito de arena](#añadir-recursos), agradecemos cualquier ayuda :D

## Funcionamiento

En este apartado se listan los archivos clave, su estructura y la forma de editarlos.

La base son archivos en formato Markdown los cuales son "traducidos" automáticamente a HTML mediante la herramienta [pandoc](https://pandoc.org/).
Para la automatización se usa un Makefile que indica los archivos a traducir y las reglas para ello.

Una vez se tienen todos los HTML bajo el directorio target/, este se publica a las [github pages](https://pages.github.com/).

### A fondo

#### Estructura

La carpeta src/ contiene la estructura que también tendrá target/ pero, en vez de contener html, son md.
Haciendo que los index.html sean readme.md.

Los archivos md están separados por asignaturas, bajo directorios que indican el año y cuatri.
Todos estos comienzan por un bloque YAML que aportan datos, usados para añadir un título y otros.
Cada archivo contiene lo relativo a la asignatura con *enlaces* a los contenidos correspondientes, ya sean trabajos o apuntes.
La página inicial contiene enlaces a la página de cada asignatura.

#### Compilado de html

Para crear los html, el makefile debe añadir una referencia a estos a la regla all.
Eventualmente se lanzará la regla que construye el html, esta requiere que exista el md fuente, el cual es provisto a pandoc además del fichero de salida.
Se añaden opciones para tener índice y usar la plantilla.

El markdown es traducido mediante una plantilla html base encontrada en template/base.html, que a su vez depende de template/styles.html, quien da un estilo al html.
Cada html contiene este estilo, aunque se podría tener en un fichero a parte y referenciarlo.

#### Publicación

Existe un archivo de CI, .github/workflows/site.yml, este se encarga de que en cada push se prepare una máquina virtual de github que compila el html y publica todo aquello bajo target/.

### Añadir recursos

Para añadir contenidos primero se deben haber publicado de forma que sea acesible, en un repo, drive, mega...

Luego, se puede crear un issue o un PR donde debe verse qué se quiere añadir, de qué asignatura y el enlace.

## Motivación

Altruísmo.
Así de simple.

Pocas veces he necesitado referencias, pero en aquellos momentos en los que me ha hecho falta, he agradecido el trabajo voluntario de otras personas que, en su momento, subieron sus trabajos.
Y como forma de agradecimento, decidí aportar mi parte, que es como creo que más puedo ayudar.

De siempre he tenido una filosofía de ayudar al prójimo.
Creo que es algo que me puede ayudar a mí en un futuro, ya sea directa o indirectamente.
Y si en el camino, puedo beneficiar tambien a otras personas, ¡genial! $2 \times 1$

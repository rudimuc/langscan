# MKV Language Scanner

This script generates symbolic links to your movies which have audio streams containing a specific language.

Example scenario / why I wrote this script: 
I have a DNLA Server with all my movies in a given directory structure (mainly genres).
I don't know by heart which movie has which audio language streams, but I would like to have a folder where I can find all my spanish movies. Of course the solution should match these requirements:
- automated or at least an easy way to rescan my movie library
- to save disk space the language folder should not contain a copy of the movie files - only a link

### Dependencies

The script requires a small MKV library to scan for the audio properties

```sh
$ apt-get install mkvtoolnix
```

### Execution

```sh
$ bash langscan.sh [language] [foldertoscan] [outputfolder]
```

**[language]**
Specifies the language you are searching for. ISO-639-2 coded - see first column of [Wikipedia ISO 639-2](https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes)
e.g. eng for english / spa for spanish / ger for german

**[foldertoscan]**
Path to the folder you want to scan

**[outputfolder]**
Path to the folder you want to save the symbolic links

### Todos
 - Support for other file formats

License
----
MIT


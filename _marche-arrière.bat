:: /--------------------------------------------------------------------------\
:: |                                                                          |
:: |                                                                          |
:: |                      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                      |
:: |                      !!!!!                    !!!!!                      |
:: |                      !!!!!      STOP !!!!     !!!!!                      |
:: |                      !!!!!                    !!!!!                      |
:: |                      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                      |
:: |                                                                          |
:: |                                                                          |
:: |    Tu as ouvert le script _marche-arrière.bat. Il ne faut surtout pas    |
:: |     modifier ce fichier — sinon, ce script ne marchera plus ! Si tu      |
:: |        voulais exécuter (et non modifier) le script, ferme cette         |
:: |       fenêtre et double-clique sur le fichier _marche-arrière.bat.       |
:: |                                                                          |
:: \--------------------------------------------------------------------------/

:: Set echo to off, and set the code page to UTF-8.
@echo off
chcp 65001 > nul

:: Call the real script.
call .bat-scripts\undo\undo.bat
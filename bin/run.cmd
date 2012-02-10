@echo off

rem Инициализируем общие параметры
call common

:
: Обрабатываем параметры командной строки, если первого параметра (т.е.)
: имени файла скрипта нет, то выводим сообщение об использовании скрипта.
:
if "%1" == "" (goto usage) else (set sql=%1)


:
: Установим цель в all, если цель не прописана.
:
if "%2" == "" (set target=all) else (set target=%2)


:
: Проверяем существует ли скрит для выполнения
:
if not exist %sql% ( goto errnoscript ) else ( goto checktarget )

:checktarget
if not exist config\%target% ( goto errnotarget ) 

:::::::::::::::::::::::: MAIN BLOCK :::::::::::::::::::::::::::::::

FOR /F "usebackq" %%i IN (`dir /b config\%target%\*.cmd`) DO  @(

  @runsql.cmd config\%target%\%%i %sql%

)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

goto exit

:errnotarget
:
echo.
echo  Ошибка: Не обнаружена цель %target%
echo.
goto usage

:errnoscript
:
echo.
echo  Ошибка: Не обнаружен скрипт %sql%
echo.
goto usage

:usage
:
echo  Использовать как: run script.sql [target]
echo.
echo   где target это набор конфигурационных файлов в каталоге config.
echo   По умолчанию используется цель all
echo.

:exit


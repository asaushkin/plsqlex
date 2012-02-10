@echo off

rem ���樠�����㥬 ��騥 ��ࠬ����
call common

:
: ��ࠡ��뢠�� ��ࠬ���� ��������� ��ப�, �᫨ ��ࢮ�� ��ࠬ��� (�.�.)
: ����� 䠩�� �ਯ� ���, � �뢮��� ᮮ�饭�� �� �ᯮ�짮����� �ਯ�.
:
if "%1" == "" (goto usage) else (set sql=%1)


:
: ��⠭���� 楫� � all, �᫨ 楫� �� �ய�ᠭ�.
:
if "%2" == "" (set target=all) else (set target=%2)


:
: �஢��塞 ������� �� ��� ��� �믮������
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
echo  �訡��: �� �����㦥�� 楫� %target%
echo.
goto usage

:errnoscript
:
echo.
echo  �訡��: �� �����㦥� �ਯ� %sql%
echo.
goto usage

:usage
:
echo  �ᯮ�짮���� ���: run script.sql [target]
echo.
echo   ��� target �� ����� ���䨣��樮���� 䠩��� � ��⠫��� config.
echo   �� 㬮�砭�� �ᯮ������ 楫� all
echo.

:exit


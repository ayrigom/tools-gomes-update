@echo off
color 1f
cls
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1
IF %ERRORLEVEL% EQU 0 goto verifyupdates

echo =====================================================
echo Este app precisa ser executado como administrador.
echo =====================================================
echo.
pause
exit

:verifyupdates

set locate="%~dp0"
cls
color 1f
echo Nao renomeia esse arquivo!
echo Verificando o git...
timeout /t 3 /nobreak > nul
if exist "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Git" goto veriuod
if exist "%systemdrive%\Program Files\Git" goto veriuod
if exist "%systemdrive%\Program Files (x86)\Git" goto veriuod
echo Para esse programa funcionar, o computador precisa ter o git instalado
echo Deseja instalar o git?
echo [Y] Nao [N] Nao
set /p oppinstagit=Digite sua opcao e de enter: 
if %oppinstagit% equ Y goto installgitaa
if %oppinstagit% equ y goto installgitaa
if %oppinstagit% equ N goto exit
if %oppinstagit% equ n goto exit
goto exit

:installgitaa
cls
echo =========================================================
echo Instalando o git...
echo =========================================================
echo Por favor aguarde...
echo Nao feche essa tela!
powershell winget install --id Git.Git -e --source winget
echo Reiniciando o programa em
timeout /t 3
cd /d "%~dp0"
start tools-gomes-v1.0.bat
exit

:veriuod
set locatefile="%~f0"
echo Verificando por atualizacoes...
cd "%temp%"
git clone https://github.com/ayrigom/tools-gomes-update.git
cd tools-gomes-update
if exist "V3" goto updateencontrado
cd ..
rd /s /q tools-gomes-update
echo Voce esta atualizado!
timeout /t 3 /nobreak > nuk
goto a

:updateencontrado
cls
echo =======================================
echo Atualizando tools-gomes v1 para v2
echo =======================================
copy /y "tools.bat" "%locatefile%"
echo Pronto!
echo Reinciando aplicativo em
timeout /t 5
cd /d "%~dp0"
start tools.bat
exit

:a
color 1f
cls
echo ==============================================
echo [1] Alterar MBR para GPT
echo [2] Ativar gpedit
echo [3] Desinstalar o Microsoft EDGE
echo [4] Habilitar Hyper-V
echo [5] Instalar update ou downgrade
echo [6] Ativar conta admim
echo [7] Desativar conta admim
echo [8] Opcoes avancada
echo [X] Sair
echo ==============================================
set /p o=Digite o numero das opcoes--
if %o% equ 1 goto mbrgpt
if %o% equ 2 goto atigpt
if %o% equ 3 goto uniedge
if %o% equ 4 goto hyper
if %o% equ 5 goto dowupd
if %o% equ 6 goto actad
if %o% equ 7 goto dstad
if %o% equ 8 goto avanoptions
if %o% equ X goto exit
if %o% equ x goto exit
goto a

:avanoptions
color 1f
cls
echo ==============================================
echo [1] Reiniciar o computador
echo [2] Desligar computador
echo [3] Instalar HFW 4.89.2
echo [4] Habilitar o hyper-v
echo [5] Resolver erros Windows update
echo [6] Voltar para a versao anterior do Windows
echo [7] opcoes avancadas 2
echo [8] opcoes atras
echo [X] Sair
echo ==============================================
set /p o2=Digite sua opcao e de enter: 
if %o2% equ 1 goto reboot
if %o2% equ 2 goto shutdown
if %o2% equ 3 goto hfw
if %o2% equ 4 goto hyper
if %o2% equ 5 goto resolvererroswindowsupdate
if %o2% equ 6 goto resta
if %o2% equ 7 goto avanoptions2
if %o2% equ 8 goto a
if %o2% equ X goto exit
if %o2% equ x goto exit
goto avanoptions

:avanoptions2
color 1f
cls
echo ==============================================
echo [1] Ver a chave do meu windows
echo [2] Ativar meu office
echo [3] Opcoes atras
echo [4] Instalar o microsoft edge e escolher
echo [X] Sair
echo ==============================================
set /p o3=Digite sua opcao e de enter=
if %o3% equ 1 goto chavewindows
if %o3% equ 2 goto ativaroffice
if %o3% equ 3 goto avanoptions
if %o3% equ 4 goto instaedge
if %o3% equ X goto exit
if %o3% equ x goto exit
goto avanoptions2

:exit
cls
echo Saindo...
timeout /t 3 /nobreak > nul
exit

:instaedge
cls
echo ===========================================
echo Fazendo download...
echo ===========================================
echo LOG:
cd "%temp%"
git clone https://github.com/ayrigom/edges.git
cd edges
echo Download sucesso!
timeout /t 2 /nobreak > nul
goto instaedgedop

:instaedgedop
cls
echo ===========================================
echo Escolha a versao do edge
echo -------------------------------------------
echo [1] Microsoft Edge comum
echo [2] Microsoft Edge beta
echo [3] Microsoft Edge dev
echo [4] Microsoft Edge canary
echo [5] Voltar
set /p iopaa=Digite sua opcao: 
if %iopaa% equ 1 goto edgecomumin
if %iopaa% equ 2 goto edgebetain
if %iopaa% equ 3 goto edgedevin
if %iopaa% equ 4 goto edgecanaryin
if %iopaa% equ 5 goto deletedgefi
goto instaedgedop

:deleteedgefi
echo Apagando arquivos...
cd..
rmdir /s /q "edges"
echo Voltando...
timeout /t 2 /nobrak > nul
goto a

:edgecomumin
echo Instalando o edge...
start /wait MicrosoftEdgeSetup.exe 
echo Instalado!
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:edgebetain
echo Instalando o edge beta...
start /wait MicrosoftEdgeSetupBeta.exe 
echo Instalado!
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:edgedevin
echo Instalando o edge dev...
start /wait MicrosoftEdgeSetupDev.exe 
echo Instalado!
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:edgecanaryin
echo Instalando o edge canary...
start /wait MicrosoftEdgeSetupCanary.exe 
echo Instalado!
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:ativaroffice
cls
echo Quer ativar o office?
echo [Y] Sim
echo [N] Nao
echo [Y/n]
set /p opativaroffice=Digite sua opcao e de enter: 
if %opativaroffice% equ Y goto actofficeee
if %opativaroffice% equ y goto actofficeee
if %opativaroffice% equ N goto a
if %opativaroffice% equ n goto a
goto ativaroffice

:actofficeee
@echo off
title Activate Microsoft Office 2021 (ALL versions) for FREE - MSGuides.com&cls&echo =====================================================================================&echo #Project: Activating Microsoft software products for FREE without additional software&echo =====================================================================================&echo.&echo #Supported products:&echo - Microsoft Office Standard 2021&echo - Microsoft Office Professional Plus 2021&echo.&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&echo.&echo =====================================================================================&echo Activating your product...&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&cscript //nologo ospp.vbs /unpkey:6F7TH >nul&set i=1&cscript //nologo ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH >nul||goto notsupported
:skms
if %i% GTR 10 goto busy
if %i% EQU 1 set KMS=kms7.MSGuides.com
if %i% EQU 2 set KMS=s8.uk.to
if %i% EQU 3 set KMS=s9.us.to
if %i% GTR 3 goto ato
cscript //nologo ospp.vbs /sethst:%KMS% >nul
:ato
echo =====================================================================================&echo.&echo.&cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo =====================================================================================&echo.&echo #My official blog: MSGuides.com&echo.&echo #How it works: bit.ly/kms-server&echo.&echo #Please feel free to contact me at msguides.com@gmail.com if you have any questions or concerns.&echo.&echo #Please consider supporting this project: donate.msguides.com&echo #Your support is helping me keep my servers running 24/7!&echo.&echo =====================================================================================&choice /n /c YN /m "Would you like to visit my blog [Y,N]?" & if errorlevel 2 exit) || (echo The connection to my KMS server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto skms)
explorer "http://MSGuides.com"&goto halt
:notsupported
echo =====================================================================================&echo.&echo Sorry, your version is not supported.&echo.&goto halt
:busy
echo =====================================================================================&echo.&echo Sorry, the server is busy and can't respond to your request. Please try again.&echo.
:halt
pause >nul
goto a

:chavewindows
echo Fazendo download...
timeout /t 3
git clone https://github.com/ayrigom/getkey.git
cd getkey
start descobrir-chave.vbs
echo Olhe sua chave do seu windows
echo Deseja copiar o arquivo para algum local
echo [1] Sim [2] Nao
set /p chsvaa=Digite sua opcao e de enter: 
if %chsvaa% equ 1 goto choicedirec
if %chsvaa% equ 2 goto a
goto a

:choicedirec
echo ===============================
echo Escolha
echo -------------------------------
echo [1] Area de Trabalho
echo [2] Downloads
echo [3] Documentos
echo [4] Voltar
set /p opdiriria=Digite sua opcao e de enter: 
if %opdiriria% equ 1 goto desktopchoi
if %opdiriria% equ 2 goto downloadschoi
if %opdiriria% equ 3 goto documentoschoi
if %opdiriria% equ 4 goto a
goto choicedirec

:desktopchoi
echo Salvando o arquivo na Area de Trabalho...
copy /y "descobrir-chave.vbs" "%userprofile%\desktop"
echo Pronto
echo Voltando...
timeout /t 3
goto a

:downloadschoi
echo Salvando o arquivo na pasta de Downloads...
copy /y "descobrir-chave.vbs" "%userprofile%\downloads"
echo Pronto
echo Voltando...
timeout /t 3
goto a

:documentoschoi
echo Salvando o arquivo na pasta de documentos...
copy /y "descobrir-chave.vbs" "%userprofile%\documents"
echo Pronto
echo Voltando...
timeout /t 3
goto a

:mbrgpt
cls
echo ========================
echo Alterar MBR para GPT
echo ========================
echo Tem certeza que quer que seu
echo computador mude de bios para
echo UEFI a gente nao sera responsavel
echo ========================
echo [1] Sim [2] Nao
set /p ymg=----
if %ymg% equ 1 goto gp
if %ymg% equ 2 goto a
goto mbrgpt

:gp
cls
echo ========================
echo Alterar MBR para GPT
echo ========================
echo Se seu computador nao
echo for compativel pode
echo dar problema so faca se for compativel
echo Voce nao podera desligar o computador nem fechar esta janela
echo ========================
echo [1] Sim [2] Nao
set /p ymm=----
if %ymg% equ 1 goto mudegpt
if %ymg% equ 2 goto a
goto gp

:mudegpt
cls
echo =====================
echo Migrando MBR para GPT...
echo =====================
echo nao desligue o computador e nem feche esta janela
cd %windir%\system32
mbr2gpt.exe /convert /allowfullos
goto ja

:ja
cls
echo ==========================
echo Processo feito com sucesso
echo Deseja Reiniciar para concluir
echo ==========================
echo [1] Sim [2] Nao
set /p opp=--
if %opp% equ 1 goto reboot
if %opp% equ 2 goto a
goto ja

:reboot
cls
echo Reiniciando em
timeout /t 10
shutdown -r -t 0
exit

:shutdown
cls
echo Desligando em
timeout /t 10
shutdown -s -t 0
exit

:atigpt
cls
echo =====================
echo     Ativar Gpedit
echo =====================
echo Voce quer ativar o gpedit
echo =====================
echo [1] Sim [2] Nao
set /p gpe=--
if %gpe% equ 1 goto act
if %gpe% equ 2 goto a
goto atigpt

:act
echo ====================
echo Ativando o Gpedit...
echo ====================


pushd "%~dp0" 

cd /d "%~dp0"

dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >loggpedit.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>loggpedit.txt

for /f %%i in ('findstr /i . loggpedit.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"


echo Apagando arquivos...
del /s /q List.txt
cd %temp%
cd ..
rd /s /q Temp
md Temp
goto feiact

:feiact
cls
echo ===========================
echo Processo feito com sucesso
echo ===========================
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:uniedge
cls
echo ==============================
echo Tem certeza que voce quer desinstalar
echo o microsoft edge
echo ==============================
echo [1] Sim [2] Nao
set /p unie=--
if %unie% equ 1 goto maisedg
if %unie% equ 2 goto a
goto uniedge

:maisedg
cls
echo ===============================
echo Desinstalar o Microsoft EDGE
echo ===============================
echo Isso pode te prejudicar
echo faca isso só se voce tiver certeza
echo ===============================
echo [1] Sim [2] Nao
set /p vaiunie=--
if %vaiunie% equ 1 goto unidevez
if %vaiunie% equ 2 goto a
goto maisedg

:unidevez
cls
echo ============================================================
echo Desinstalando o Microsoft EDGE...
echo ============================================================
echo LOG:
echo Parando servicos...
taskkill /f /im msedge.exe
echo Desinstalando...
cd "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\1*\Installer"
setup –uninstall –force-uninstall –system-level
cd "%PROGRAMFILES(X86)%\Microsoft\Edge Beta\Application\1*\Installer"
setup –uninstall –force-uninstall –system-level
cd "%PROGRAMFILES(X86)%\Microsoft\Edge Dev\Application\1*\Installer"
setup –uninstall –force-uninstall –system-level
cd "%localappdata%\Microsoft\Edge SxS\Application\1*\Installer"
setup –uninstall –force-uninstall –system-level
echo Apagando arquivos...
cd "%PROGRAMFILES(X86)%\Microsoft
rmdir /s /q "Edge"
rmdir /s /q "Edge Beta"
rmdir /s /q "Edge Dev"
cd "%localappdata%\Microsoft"
rmdir /s /q "Edge SxS"
rmdir /s /q "Edge"
rmdir /s /q "Edge Beta"
rmdir /s /q "Edge Dev"
cd %temp%
cd ..
rd /s /q Temp
md Temp
goto fins

:fins
echo ============================================================
echo Microsoft Edge Desinstalado com suceso!
echo ============================================================
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:hyper
cls
echo =======================
echo Ativar Hyper-V
echo =======================
echo tem certeza que quer
echo habilitar o hyper-v
echo =======================
echo [1] Sim [2] Nao
set /p oph=--
if %oph% equ 1 goto acthy
if %oph% equ 2 goto a
goto hyper

:acthy
cls
echo =======================
echo Ativando o Hyper-V
echo =======================
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL /norestart
echo Apagando arquivos...
del /s /q hyper-v.txt
cd %temp%
cd ..
rd /s /q Temp
md Temp
goto actived

:actived
echo ===================
echo Ativado com sucesso
echo ===================
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:dowupd
cls
cd /d "%~dp0"
cd "files\update-downgrade"
if exit install.cab goto exist upcab

cls
echo ========================
echo Nao foi possivel encontrar o
echo arquivo de update na pasta
echo files\update-downgrade
echo arquivo install.cab
echo ========================
echo Precione qualquer tecla para voltar...
pause > nul
goto dowupd

:upcab
cls
echo ========================
echo Arquivo de update
echo encontrado com sucesso
echo em files\update-downgrade
echo arquivo install.cab
echo ========================
echo [Y] Instalar [N] Cancelar
set /p opudu=---
if %opudu% equ Y goto flashup
if %opudu% equ y goto flashup
if %opudu% equ N goto a
if %opudu% equ n goto a
goto upcab

:flashup
cls
echo LOG
echo Fleshando...
dism /Online /Add-Package /PackagePath:"install.cab"
echo PASS!!
echo ========================
echo Procedimento feito com sucesso
echo Deseja reiniciar
echo ========================
echo [1] Sim [2] Nao
set /p opupaa=--
if %opupaa% equ 1 goto reboot
if %opupaa% equ 2 goto a
goto a

:actad
cls
echo LOG
echo Ativando...
net user administrador /active:yes
echo PASS!!
pause
goto a

:dstad
cls
echo LOG
echo Desativando...
net user administrador /active:yes
echo PASS!!
pause
goto a

:hfw
echo ================================
echo Nao disponivel!
echo ================================
echo Precione qualquer tecla para voltar...
pause > nul
goto a

echo Baixando arquivos...
cd "%temp%"
git clone https://github.com/ayrigom/wget.git
cd wget
copy /y "wget.exe" "%temp%"
cd..
wget https://doc-08-5g-docs.googleusercontent.com/docs/securesc/hp3b9fv7k5gegnp7mi2tvaf95a66dko9/9mss8phe7v1lo3cgh9h88p3dpgplcsd9/1656793575000/02989431407803871257/02989431407803871257/1a4r5MJUQckyMmt5gsJ2GmFHZ3ZIMYMLr?e=download&ax=ACxEAsYZkecM4jov00YIPKi7ZQyDHnGM7k4IDgG0wM1o56rDYORIls41_wJ3LnwiiB15vCMR7gw8ZMrAK7BzBMLbABDk2nXv4UOFkmpiFdIXw8noUbXI8wQzRoe0LMR5h9P7nQlpFmrfQ_3AZptxEvWINk5CWFMIk3BWzD-wDEbctbpIGayAfCReMujuH6Q-7HFdfxJNTAqRpBZ37LjX7z4RSVcNuR4vVAnj5kllmBv9id5WzNtGTtE4OfbkXlaeHp2PjOAVxUyTBQ_-OpqcpilDBb3m9vdCbOv2o9SHgMHiJT738qrOYhEWR1YZjDtw3xymAu2L0-nfRdR9LGZQwBHOrctrKG5-ZeABoyIGiQyvg8UriWJ6dNNPFxQlTL-WEBr9Dkf0cOnfQgcd9DnD0Y7dlnCkkWLo1pinBMuMJOeOppUjv-b9vwUpsUrmpyhJiId-LQwFntKoYU59ecWS1w7UYoPY8zUKZiNl1s1NiKIZA3PFic9L54EOGf4Xetc2L8JlmDnAEc-YC9xroGgQouKe-N9Qbb4G1ShrM20PwCiWmor8zMAqExjaUmjLYcpJy_JRH7rSuBzk_l9KYlSiK4grCyjUHwRMXrdg_KxJiyqhOdQmAO-Iug2VlvnXOCuJVwxFwPg5s0H7Wvi19GR5wQ_t63IehA4Sztbqv_J1sNRsZbHxNAie7f2OVyoOhHI-Vxt-jpQ-vTMV8T9Ej1rDZtCFIZmWV8u5V0FmCv32HNeQyaL6nzwde4O6W_SHMmTZqU9nGlRl6Ip4G7nHNa4p_VmCiujuKVdObQ3QAb3waL4ZrU8j4o8hXJen_OGKlJCqGNpTbDerJSq2eriBhZ3OtpxDc2PXdknc&uuid=16455946-e3ed-4aca-a470-3e004a901d06&authuser=1&nonce=qqml70ob6nagm&user=02989431407803871257&hash=fs31lto24u9n2gi2o3q6oskck5btnopb

cls
echo ============================================
echo O pendrive precisa estar formatado em fat32.
echo Caso seu windows nao apareca a opcao de
echo formatar em fat32, baixe o programa
echo ============================================
echo [1] Meu pendrive ja esta em fat32
echo [2] Abrir o programa
echo [3] Usar o diskpart do windows para a formatacao em fat32
echo [4] Sair
set /p hfwop=Coloque o numero da opcao--
if %hfwop% equ 1 goto seguir
if %hfwop% equ 2 start FAT32-Format.exe
if %hfwop% equ 3 diskpart
if %hfwop% equ 4 goto a
goto hfw

:seguir
cls
echo ============================================
echo Agora coloque a letra da paricao do pendrive
echo ============================================
set /p letter=--
goto hfwinstallorno

:hfwinstallorno
cd /
cd %letter%
if exist Windows goto naopodewin
echo =========================
echo %letter% e essa?
echo Lembrando esse processo
echo apaga os dados do pendrive
echo =========================
echo [1] Sim
echo [2] Nao
echo [3] Sair
set /p opyesornolet=Coloque a letra da particao--
if %opyesornolet% equ 1 goto fleshhfw
if %opyesornolet% equ 2 goto seguir
if %opyesornolet% equ 3 goto a
goto hfwinstallorno

:fleshhfw
cls
echo LOG
echo Apagando os dados do pendrive...
rmdir /s /q %letter%:
echo Instalando a hfw 4.89.2 em %letter%:
cd /
%letter%:
md PS3
cd PS3
md UPDATE
cd /d "%~dp0%
cd files\hfw-4.89.2
copy /y "PS3UPDAT.PUP" "%letter%:\PS3\UPDATE"
echo PASS!!
echo =======================================
echo Processo feito com sucesso em %letter%:
echo =======================================
pause
goto a

:naopodewin
cls
echo ==============================================
echo A gente nao pode instalar a HFW nessa particao
echo Tem instalado o Windows!!!
echo ==============================================
echo Precione qualquer tecla para voltar...
pause > nul
goto a

:nohfw
cls
echo Arquivo nao encontrado
echo Precione qualquer tecla para voltar...
pause > nu
goto a

:ahy
cls
echo ===========================
echo Você quer ativar o hyper-v?
echo ---------------------------
echo [1] Sim
echo [2] Nao
set /p opablhypervorno=Coloque o numero da opcao--
if %opablhypervorno% equ 1 goto ablhyperv
if %opablhypervorno% equ 2 goto a
goto ahy

:ablhyperv
cls
cd /d "%~dp0"
cd files
hyper-v-enable.bat

:resolvererroswindowsupdate
cls
echo LOG:
echo Resolvendo erros do Windows update...
echo Por favor aguarde pode demorar um pouco
net stop wuauserv
cd /d %SystemRoot%\SoftwareDistribution
del /s /q /f Download
net start wuauserv
dism /Online /Cleanup-image /Restorehealth
chkdsk
sfc /scannow
cd..
cd..
cd /
net stop wuauserv
net stop cryptsvc
net stop bits
net stop msiserver
net stop appidsvc
cd windows
ren c:\windows\SoftwareDistribution softwaredistribuiton.old
cd System32
ren Catroot2 Catroot2.old
net start wuauserv
net start cryptsvc
net start bits
net start msiserver
net start appidsvc
echo Deseja reiniciar o computador?
echo [Y/n]
set /p opchoicea=--
if %opchoicea% equ y shutdown -r -t  10 -c "Seu computador vai ser reiniciado em 10 segundos"
echo PASS!!
echo echo precione qualquer tecla para voltar...
pause > nul
goto a

:resta
cls
dism /image:%systemdrive%\ /get-package
set /p versionupdaaa23=--
echo ===================================================
echo Você quer voltar para a versao anterior do windows?
echo ---------------------------------------------------
echo [1] Sim [2] Nao
set /p opresta=-Coloque o numero da opcao--
if %opresta% equ 1 goto avan23
if %opresta% equ 2 goto a
echo Digite novamente
set /p opresta=-Coloque o numero da opcao--
if %opresta% equ 1 goto avan23
if %opresta% equ 2 goto a
echo ============================
echo Certeza digite yes para sim
echo digite no para nao
echo Seu computador reiniciara automaticamente
echo ============================
set /p opresta=---
if %opresta% equ yes goto yesresta
if %opresta% equ YES goto yesresta
if %opresta% equ no goto a
if %opresta% equ NO goto a
goto a

:yesresta
cls
echo =============================
echo Trabalhando em downgrades
echo Nao feche esta janela
echo Nao desligue o computador
echo Seu computador reiniciara automaticamente
echo -----------------------------
LOG:
dism /image:%systemdrive%\ /remove-package /packagename:%versionupdaaa23%
cd /d "%~dp0"
cd files
copy /y "downgrade-is-complete.bat" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
echo Reiniciando...
shutdown -r -t 0
timeout /t 15 /nobrak > nul
exit
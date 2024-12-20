@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo.
echo  Se necesita ejecutar el script como Administrador para continuar.
echo  Por favor, cierre el programa y vuelva a ejecutarlo.
pause>nul
exit /B
)
:winOS
pushd %~dp0
ver | findstr /i "10." > nul
if %errorlevel% == 0 (
if exist "%~dp0wget.exe" (
echo.
) else (
echo Necesitamos Wget para que las descargas sean seguras y eficientes.
echo Esta descarga se realiza una vez por equipo.
echo Espere por favor...
powershell -Command "Invoke-WebRequest -Uri https://eternallybored.org/misc/wget/1.21.4/32/wget.exe -OutFile "wget.exe""
)
cls
goto :M_SoPI
) else (
cls
echo.
if exist "%~dp0wget.exe" (                                    
goto :cat
) else (
echo Nota: "Recuerde que muchos programas ya no son compatibles con Windows 7"
echo.
echo Necesitamos Wget para que las descargas sean seguras y eficientes.
echo Esta descarga se realiza una vez por equipo.
echo Espere por favor...
echo.
certutil -urlcache -split -f "https://eternallybored.org/misc/wget/1.21.4/32/wget.exe" wget.exe>nul
cls
goto :cat
    )
)
:M_SoPI
mode con lines=37 cols=110&color 0a
:variables
set g=[92m
set u=[0m
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.
echo 					███████╗ ██████╗ ██████╗ ██╗
echo 					██╔════╝██╔═══██╗██╔══██╗██║
echo 					███████╗██║   ██║██████╔╝██║%u%
echo 					╚════██║██║   ██║██╔═══╝ ██║
echo 					███████║╚██████╔╝██║     ██║
echo 					╚══════╝ ╚═════╝ ╚═╝     ╚═╝
echo 	%g%		╔═════════════════════════════════════════════════════════════╗
echo 					    (Software Post Install)
echo 				   Tus Software Post Install en un solo lugar
echo 	%u%			           https://hiberhernandez.com/
echo 	%g%			        https://hiberhernandez.com/sopi/
echo 			╚═════════════════════════════════════════════════════════════╝
echo.
echo.
echo.

:cat
title SoPI (Software Post Install) v24.12.19
echo Categorias:
echo.
echo 	[1] Navegadores web      [4] Ofimatica		[7] Herramientas
echo.
echo 	[2] Multimedia	 	 [5] Runtimes           [8] Internet
echo.
echo.	[3] Graficos		 [6] Seguridad          [9] Acerca de
echo.
echo.
if not exist "%tmp%/SoPI/" md "%tmp%/SoPI/"
if not exist "%homedrive%/SoPI/" md "%homedrive%/SoPI/"
choice /C:123456789 /N /M "choice | Seleccione una categoria:"
if errorlevel 9 goto:about
if errorlevel 8 goto:internet
if errorlevel 7 goto:herramientas
if errorlevel 6 goto:seguridad
if errorlevel 5 goto:runtimes
if errorlevel 4 goto:ofimatica
if errorlevel 3 goto:graficos
if errorlevel 2 goto:multimedia
if errorlevel 1 goto:navegadores

:navegadores
title %~n0 - Categoria: Navegadores web
mode con lines=20 cols=108
cls
echo.
echo [1] Google Chrome
echo [2] Mozilla Firefox (Windows 10/11)
echo [3] Microsoft Edge
echo [4] Brave (Windows 10/11)
echo [5] OperaOne
echo [6] OperaGX
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto google
if "%hbz%"=="2" goto firefox
if "%hbz%"=="3" goto edge
if "%hbz%"=="4" goto brave
if "%hbz%"=="5" goto opera1
if "%hbz%"=="6" goto operagx
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto navegadores

:google
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)

:x86
call :dw echo "Google Chrome (x86) Descarga aproximada 1.3 MB"
if %confirm%==1 goto ix86
goto navegadores
:ix86
cls
echo Descargando...
"%~dp0wget.exe" "https://hiberhernandez.com/sopi/wp-content/uploads/2023/12/ChromeSetup86.exe" --no-check-certificate -O %TMP%\SoPI\ChromeSetup86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\ChromeSetup86.exe
call :ic

:x64
call :dw echo "Google Chrome (x64) Descarga aproximada 1.3 MB"
if %confirm%==1 goto ix64
goto navegadores
:ix64
cls
echo Descargando...
"%~dp0wget.exe" "https://hiberhernandez.com/sopi/wp-content/uploads/2023/12/ChromeSetup.exe" --no-check-certificate -O %TMP%\SoPI\ChromeSetup.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\ChromeSetup.exe
call :ic

:firefox
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)

:x86
call :dw echo "Mozilla Firefox (x86) Descarga aproximada 58 MB"
if %confirm%==1 goto ix86
goto navegadores
:ix86
cls
echo Descargando...
"%~dp0wget.exe" "https://download.mozilla.org/?product=firefox-latest-ssl&os=win&lang=es-ES" -O %TMP%\SoPI\FirefoxSetup_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\FirefoxSetup_x86.exe /silent
call :ic


:x64
call :dw echo "Mozilla Firefox (x64) Descarga aproximada 60 MB"
if %confirm%==1 goto ix64
goto navegadores
:ix64
cls
echo Descargando...
"%~dp0wget.exe" "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=es-ES" -O %TMP%\SoPI\FirefoxSetup_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\FirefoxSetup_x64.exe /silent
call :ic

:edge
cls
call :dw echo "Microsoft Edge. Descarga aproximada 1.6 MB"
if %confirm%==1 goto ixe
goto navegadores
:ixe
cls
echo Descargando...
"%~dp0wget.exe" "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=es-419&brand=M100" --no-check-certificate -O %TMP%\SoPI\MicrosoftEdgeSetup.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MicrosoftEdgeSetup.exe
call :ic

:brave
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)

:x86
call :dw echo "Brave (x86) Descarga aproximada 1.4 MB"
if %confirm%==1 goto ix86
goto navegadores
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://referrals.brave.com/latest/BraveBrowserSetup32-BRV001.exe -O %TMP%\SoPI\BraveBrowserSetup32-BRV001.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\BraveBrowserSetup32-BRV001.exe
call :ic

:x64
call :dw echo "Brave (x64) Descarga aproximada 1.4 MB"
if %confirm%==1 goto ix64
goto navegadores
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://referrals.brave.com/latest/BraveBrowserSetup-BRV001.exe -O %TMP%\SoPI\BraveBrowserSetup-BRV001.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\BraveBrowserSetup-BRV001.exe
call :ic

:opera1
cls
call :dw echo "Opera One. Descarga aproximada 2.7 MB"
if %confirm%==1 goto ixe
goto navegadores
:ixe
cls
echo Descargando...
"%~dp0wget.exe" "https://net.geo.opera.com/opera/stable/windows?utm_source=mg&utm_medium=apb&utm_campaign=downloadpage" -O %TMP%\SoPI\OperaOne.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\OperaOne.exe
call :ic

:operagx
cls
call :dw echo "Opera GX. Descarga aproximada 3.4 MB"
if %confirm%==1 goto ixe
goto navegadores
:ixe
cls
echo Descargando...
"%~dp0wget.exe" "https://net.geo.opera.com/opera_gx/stable/windows?utm_tryagain=yes&utm_source=(direct)&utm_medium=doc&utm_campaign=(direct)&http_referrer=missing&utm_site=opera_com&&utm_lastpage=opera.com/gx" -O %TMP%\SoPI\OperaGX.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\OperaGX.exe
call :ic

:multimedia
title %~n0 - Categoria: Multimedia
mode con lines=20 cols=108
cls
echo.
echo [1] VLC Media Player
echo [2] Media Player Clasic
echo [3] AIMP
echo [4] foobar2000
echo [5] Winamp
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto vlc
if "%hbz%"=="2" goto mpc
if "%hbz%"=="3" goto aimp
if "%hbz%"=="4" goto foobar
if "%hbz%"=="5" goto winamp
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto multimedia

:vlc
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "VLC Media Player (x86) Descarga aproximada 42 MB"
if %confirm%==1 goto ix86
goto multimedia
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://get.videolan.org/vlc/3.0.21/win32/vlc-3.0.21-win32.exe --no-check-certificate -O %TMP%\SoPI\vlc_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\vlc_x86.exe /S
call :ic


:x64
call :dw echo "VLC Media Player (x64) Descarga aproximada 44 MB"
if %confirm%==1 goto ix64
goto multimedia
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://get.videolan.org/vlc/3.0.21/win64/vlc-3.0.21-win64.exe --no-check-certificate -O %TMP%\SoPI\vlc_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\vlc_x64.exe /S
call :ic

:mpc
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "Media Player Clasic (x86) Descarga aproximada 18 MB"
if %confirm%==1 goto ix86
goto multimedia
:ix86
cls
echo Descargando...
echo.
"%~dp0wget.exe" https://github.com/clsid2/mpc-hc/releases/download/2.3.9/MPC-HC.2.3.9.x86.exe --no-check-certificate -O %TMP%\SoPI\MPC_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MPC_x86.exe /silent
call :ic

:x64
call :dw echo "Media Player Clasic (x64) Descarga aproximada 20 MB"
if %confirm%==1 goto ix64
goto multimedia
:ix64
cls
echo Descargando...
echo.
"%~dp0wget.exe" https://github.com/clsid2/mpc-hc/releases/download/2.3.9/MPC-HC.2.3.9.x64.exe --no-check-certificate -O %TMP%\SoPI\MPC_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MPC_x64.exe /silent
call :ic

:aimp
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "AIMP (x86) Descarga aproximada 15 MB"
if %confirm%==1 goto ix86
goto multimedia
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://aimp.ru/files/windows/builds/aimp_5.30.2563_w32.exe -O %TMP%\SoPI\aimp_32.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\aimp_32.exe
call :ic

:x64
call :dw echo "AIMP (x64) Descarga aproximada 19 MB"
if %confirm%==1 goto ix64
goto multimedia
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://aimp.ru/files/windows/builds/aimp_5.30.2563_w64.exe -O %TMP%\SoPI\aimp_64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\aimp_64.exe
call :ic

:foobar
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "foobar (x86) Descarga aproximada 6 MB"
if %confirm%==1 goto ix86
goto multimedia
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://www.foobar2000.org/files/foobar2000_v2.24.1.exe --no-check-certificate -O %TMP%\SoPI\foobar2000_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\foobar2000_x86.exe /S
call :ic

:x64
call :dw echo "foobar (x64) Descarga aproximada 6 MB"
if %confirm%==1 goto ix64
goto multimedia
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://www.foobar2000.org/files/foobar2000-x64_v2.24.1.exe --no-check-certificate -O %TMP%\SoPI\foobar2000_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\foobar2000_x64.exe /S
call :ic

:winamp
cls
call :dw echo "Winamp + Lenguaje Descarga aproximada 12+7 MB"
if %confirm%==1 goto ixa
goto multimedia
:ixa
cls
echo Descargando...
"%~dp0wget.exe" https://download.winamp.com/winamp/winamp_latest_full.exe --no-check-certificate -O %TMP%\SoPI\winamp_latest_full.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\winamp_latest_full.exe /S
echo Instalacion completa
ping -n 3 localhost>nul
cls
echo Descargando Lenguaje Pack
"%~dp0wget.exe" https://download.nullsoft.com/winamp/client/Winamp_Language_Packs_v1.7.exe --no-check-certificate -O %TMP%\SoPI\Winamp_Language_Packs_v1.7.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\Winamp_Language_Packs_v1.7.exe /S
call :ic

:graficos
title %~n0 - Categoria: Graficos
mode con lines=20 cols=108
cls
echo.
echo [1] FocusOnImageViewer
echo [2] ShareX
echo [3] Lightshot
echo [4] Paint.NET (64 bits)
echo [5] GIMP
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto foiv
if "%hbz%"=="2" goto sharex
if "%hbz%"=="3" goto lgts
if "%hbz%"=="4" goto paintn
if "%hbz%"=="5" goto gimp
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto graficos

:foiv
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "FocusOnImageViewer (x86) Descarga aproximada 5 MB"
if %confirm%==1 goto ix86
goto graficos
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/pintosoft/FocusOnImageViewer/releases/download/1.31/FocusOnIV_1.31.exe --no-check-certificate -O %TMP%\SoPI\FocusOnIV.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\FocusOnIV.exe /S
call :ic
:x64
call :dw echo "FocusOnImageViewer (x64) Descarga aproximada 5 MB"
if %confirm%==1 goto ix64
goto graficos
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/pintosoft/FocusOnImageViewer/releases/download/1.31/FocusOnIV64_1.31.exe --no-check-certificate -O %TMP%\SoPI\FocusOnIV64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\FocusOnIV64.exe /S
call :ic

:sharex
cls
call :dw echo "ShareX. Descarga aproximada 38 MB"
if %confirm%==1 goto ixs
goto graficos
:ixs
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/ShareX/ShareX/releases/download/v16.1.0/ShareX-16.1.0-setup.exe --no-check-certificate -O %TMP%\SoPI\ShareX-setup.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\ShareX-setup.exe /silent
call :ic

:lgts
cls
call :dw echo "Lightshot. Descarga aproximada 3 MB"
if %confirm%==1 goto ixl
goto graficos
:ixl
cls
echo Descargando...
"%~dp0wget.exe" https://app.prntscr.com/build/setup-lightshot.exe --no-check-certificate -O %TMP%\SoPI\lightshot.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\lightshot.exe /silent
call :ic

:paintn
call :ds
cls
call :dw echo "Paint.NET (x64) Descarga aproximada 65 MB"
if %confirm%==1 goto ix64
goto graficos
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/paintdotnet/release/releases/download/v5.1.1/paint.net.5.1.1.install.x64.zip --no-check-certificate -O %TMP%\SoPI\paint.net_x64.zip
cls
echo Descomprimiendo...
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\paint_x64.zip" -o%tmp%\SoPI\
cls
echo Instalando
start /wait %TEMP%\SoPI\paint_x64.exe
taskkill /f /im SetupFrontEnd.exe
call :ic

:gimp
cls
call :dw echo "GIMP. Descarga aproximada 330 MB"
if %confirm%==1 goto ixg
goto graficos
:ixg
cls
echo Descargando...
"%~dp0wget.exe" https://download.gimp.org/gimp/v2.10/windows/gimp-2.10.38-setup-1.exe --no-check-certificate -O %TMP%\SoPI\GIMP.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\GIMP.exe /silent
call :ic

:ofimatica
title %~n0 - Categoria: Oficina
mode con lines=20 cols=108
cls
echo.
echo [1] LibreOffice
echo [2] ONLYOFFICE
echo [3] FreeOffice
echo [4] SumatraPDF
echo [5] Foxit Reader
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto libreo
if "%hbz%"=="2" goto onlyo
if "%hbz%"=="3" goto freeo
if "%hbz%"=="4" goto sumatra
if "%hbz%"=="5" goto foxit
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto ofimatica

:libreo
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "LibreOffice (x86) Descarga aproximada 340 MB"
if %confirm%==1 goto ix86
goto ofimatica
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://download.documentfoundation.org/libreoffice/stable/24.8.4/win/x86/LibreOffice_24.8.4_Win_x86.msi -O %TMP%\SoPI\LibreOffice_x86.msi
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\LibreOffice_x86.msi /passive
call :ic

:x64
call :dw echo "LibreOffice (x64) Descarga aproximada 360 MB"
if %confirm%==1 goto ix64
goto ofimatica
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://ftp.osuosl.org/pub/tdf/libreoffice/stable/24.8.4/win/x86_64/LibreOffice_24.8.4_Win_x86-64.msi -O %TMP%\SoPI\LibreOffice_x64.msi
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\LibreOffice_x64.msi /passive
call :ic

:onlyo
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "ONLYOFFICE (x86) Descarga aproximada 233 MB"
if %confirm%==1 goto ix86
goto ofimatica
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://download.onlyoffice.com/install/desktop/editors/windows/distrib/onlyoffice/DesktopEditors_x86.exe --no-check-certificate -O %TMP%\SoPI\DesktopEditors_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\DesktopEditors_x86.exe /silent
call :ic


:x64
call :dw echo "ONLYOFFICE (x64) Descarga aproximada 254 MB"
if %confirm%==1 goto ix64
goto ofimatica
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://download.onlyoffice.com/install/desktop/editors/windows/distrib/onlyoffice/DesktopEditors_x64.exe --no-check-certificate -O %TMP%\SoPI\DesktopEditors_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\DesktopEditors_x64.exe /silent
call :ic

:freeo
cls
call :dw echo "FreeOffice. Descarga aproximada 124 MB"
if %confirm%==1 goto ixf
goto ofimatica
:ixf
cls
echo Descargando...
"%~dp0wget.exe" https://www.freeoffice.com/download.php?filename=https://www.softmaker.net/down/freeoffice2024.msi --no-check-certificate -O %TMP%\SoPI\freeoffice2021.msi
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\freeoffice2021.msi /passive
call :ic

:sumatra
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "SumatraPDF (x86) Descarga aproximada 7 MB"
if %confirm%==1 goto ix86
goto ofimatica
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://www.sumatrapdfreader.org/dl/rel/3.5.2/SumatraPDF-3.5.2-install.exe --no-check-certificate -O %TMP%\SoPI\SumatraPDF-3.5.1-install.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\SumatraPDF-3.5.1-install.exe /silent
call :ic

:x64
call :dw echo "SumatraPDF (x64) Descarga aproximada 8 MB"
if %confirm%==1 goto ix64
goto ofimatica
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://www.sumatrapdfreader.org/dl/rel/3.5.2/SumatraPDF-3.5.2-64-install.exe --no-check-certificate -O %TMP%\SoPI\SumatraPDF-3.5.1-64-install.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\SumatraPDF-3.5.1-64-install.exe /silent
call :ic


:foxit
cls
call :dw echo "Foxit Reader. Descarga aproximada 153 MB"
if %confirm%==1 goto ixfo
goto ofimatica
:ixfo
cls
echo Descargando...
"%~dp0wget.exe" https://cdn78.foxitsoftware.com/product/reader/desktop/win/2023.3.0/FoxitPDFReader20233_L10N_Setup_Prom.exe --no-check-certificate -O %TMP%\SoPI\FoxitPDFReader20233_L10N_Setup_Prom.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\FoxitPDFReader20233_L10N_Setup_Prom.exe /silent
call :ic

:runtimes
title %~n0 - Categoria: runtimes
mode con lines=20 cols=108
cls
echo.
echo [1] NetFramework 4.8
echo [2] VisualC++ AIO Recpack
echo [3] DirectX Redist Repack
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto netf
if "%hbz%"=="2" goto visualc
if "%hbz%"=="3" goto directx
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto runtimes

:netf
cls
call :dw echo "NetFramework 4.8. Descarga aproximada 121 MB"
if %confirm%==1 goto ixnt
goto runtimes
:ixnt
cls
echo Descargando...
"%~dp0wget.exe" https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe --no-check-certificate -O %TMP%\SoPI\ndp48-x86-x64-allos-enu.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\ndp48-x86-x64-allos-enu.exe
call :ic

:visualc
cls
call :dw echo "VisualC++ AIO Recpack. Descarga aproximada 29 MB"
if %confirm%==1 goto ixv
goto runtimes
:ixv
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/abbodi1406/vcredist/releases/download/v0.85.0/VisualCppRedist_AIO_x86_x64.exe --no-check-certificate -O %TMP%\SoPI\VCRedist_AIO_x86_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\VCRedist_AIO_x86_x64.exe
call :ic

:directx
cls
if exist "%~dp07za.exe" (
    echo.
  ) else (
"%~dp0wget.exe" https://raw.githubusercontent.com/a-sync/7z-extra/master/7za.exe --no-check-certificate >nul
    )
)
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "DirectX Redist Repack (x86) Descarga aproximada 14 MB"
if %confirm%==1 goto ix86
goto runtimes
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/stdin82/htfx/releases/download/v0.0.3/DirectX_Redist_Repack_x86_v2.zip -O %TMP%\SoPI\DirX_RRx_86.zip
cls
echo Descomprimiendo
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\DirX_RR_x86.zip" -o"%tmp%\SoPI\"
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\DirectX_Redist_Repack_x86.exe
call :ic

:x64
call :dw echo "DirectX Redist Repack (x64) Descarga aproximada 26 MB"
if %confirm%==1 goto ix64
goto runtimes
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/stdin82/htfx/releases/download/v0.0.3/DirectX_Redist_Repack_x86_x64_v2.zip -O %TMP%\SoPI\DirX_RR_x64.zip
cls
echo Descomprimiendo
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\DirX_RR_x86.zip" -o"%tmp%\SoPI\"
cls
echo Instalando, espere...
@start /wait %tmp%\SoPI\DirectX_Redist_Repack_x86_x64.exe
call :ic

:seguridad
title %~n0 - Categoria: Seguridad/Antivirus
mode con lines=20 cols=108
cls
echo.
echo [1] 360 Total Security
echo [2] Avast Free
echo [3] BitDefender
echo [4] Malwarebytes
echo [5] Malwarebytes AdwCleaner
echo [6] Microsoft Security Essentials (Windows 7)
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto 360
if "%hbz%"=="2" goto avast
if "%hbz%"=="3" goto bitd
if "%hbz%"=="4" goto mbt
if "%hbz%"=="5" goto mbac
if "%hbz%"=="6" goto mse
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto seguridad

:360
cls
call :dw echo "360 Total Security. Descarga aproximada 101 MB"
if %confirm%==1 goto ix3
goto seguridad
:ix3
cls
echo Descargando...
"%~dp0wget.exe" https://free.360totalsecurity.com/totalsecurity/360TS_Setup.exe --no-check-certificate -O %TMP%\SoPI\360TS_Setup.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\360TS_Setup.exe /S
call :ic

:avast
cls
call :dw echo "Avast Free. Descarga aproximada 648 MB"
if %confirm%==1 goto ixav
goto seguridad
:ixav
cls
echo Descargando...
"%~dp0wget.exe" https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_FULL/build_RELEASE/ -O %TMP%\SoPI\AvastOff.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\AvastOff.exe /silent
call :ic

:bitd
cls
call :dw echo "BitDefender Free. Descarga aproximada 13 MB"
if %confirm%==1 goto ixdfe
goto seguridad
:ixdfe
cls
echo Descargando...
"%~dp0wget.exe" "https://download.bitdefender.com/windows/installer/en-us/bitdefender_avfree.exe" -O %TMP%\SoPI\avfree.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\avfree.exe /silent
call :ic

:mbt
cls
call :dw echo "Malwarebytes. Descarga aproximada 2.6 MB"
if %confirm%==1 goto ixdfe
goto seguridad
:ixdfe
cls
echo Descargando...
"%~dp0wget.exe" "https://data-cdn.mbamupdates.com/web/mb5-setup-consumer/MBSetup.exe" -O %TMP%\SoPI\MBSetup.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MBSetup.exe /silent
call :ic

:mbac
cls
call :dw echo "Malwarebytes AdwCleaner. Descarga aproximadas%u% 8.4 MB%g%"
if %confirm%==1 goto ixdfe
goto seguridad
:ixdfe
cls
echo Descargando...
"%~dp0wget.exe" "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release" -O %TMP%\SoPI\adwcleaner.exe
cls
start %TMP%\SoPI\adwcleaner.exe
goto :WinOS

:mse
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "Microsoft Security Essentials (x86) Descarga aproximada 12 MB"
if %confirm%==1 goto ix86
goto seguridad
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://download.microsoft.com/download/2/A/C/2AC6E889-9EBB-4E06-A011-1AA9DAEDDB69/ESES/x86/MSEInstall.exe --no-check-certificate -O %TMP%\SoPI\MSEInstall.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MSEInstall.exe /silent
call :ic


:x64
call :dw echo "Microsoft Security Essentials (x64) Descarga aproximada 15 MB"
if %confirm%==1 goto ix64
goto seguridad
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://download.microsoft.com/download/2/A/C/2AC6E889-9EBB-4E06-A011-1AA9DAEDDB69/ESES/amd64/MSEInstall.exe --no-check-certificate -O %TMP%\SoPI\MSEInstall.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\MSEInstall.exe /silent
call :ic

:herramientas
title %~n0 - Categoria: Herramientas del sistema
mode con lines=20 cols=108
cls
echo.
echo [1] 7-Zip
echo [2] PeaZIP
echo [3] CCleaner Free
echo [4] Everything
echo [5] Windows Update Blocker
echo [6] Optimizer
echo [7] GeekUninstaller
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto 7zip
if "%hbz%"=="2" goto peazip
if "%hbz%"=="3" goto ccleaner
if "%hbz%"=="4" goto everything
if "%hbz%"=="5" goto wub
if "%hbz%"=="6" goto optimizer
if "%hbz%"=="7" goto geeku
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto herramientas

:7zip
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "7-Zip (x86) Descarga aproximada 1 MB"
if %confirm%==1 goto ix86
goto herramientas
:ix86
cls
echo Descargando...
echo.
"%~dp0wget.exe" "https://www.7-zip.org/a/7z2408.exe" --no-check-certificate -O %TMP%\SoPI\7z_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\7z_x86.exe /S
call :ic
:x64
call :dw echo "7-Zip (x64) Descarga aproximada 1.5 MB"
if %confirm%==1 goto ix64
goto herramientas
:ix64
cls
echo Descargando...
echo.
"%~dp0wget.exe" "https://www.7-zip.org/a/7z2408-x64.exe" --no-check-certificate -O %TMP%\SoPI\7z_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\7z_x64.exe /S
call :ic

:peazip
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "PeaZIP (x86) Descarga aproximada 8 MB"
if %confirm%==1 goto ix86
goto herramientas
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/peazip/PeaZip/releases/download/10.1.0/peazip-10.1.0.WINDOWS.exe --no-check-certificate -O %TMP%\SoPI\peazip_x86.exe 
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\peazip_x86.exe /silent
call :ic
:x64
call :dw echo "PeaZIP (x64) Descarga aproximada 9 MB"
if %confirm%==1 goto ix64
goto herramientas
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://github.com/peazip/PeaZip/releases/download/10.1.0/peazip-10.1.0.WIN64.exe --no-check-certificate -O %TMP%\SoPI\peazip_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\peazip_x64.exe /silent
call :ic

:ccleaner
cls
call :dw echo "CCleaner Free. Descarga aproximada 72 MB"
if %confirm%==1 goto ixcc
goto herramientas
:ixcc
cls
echo Descargando...
"%~dp0wget.exe" https://bits.avcdn.net/productfamily_CCLEANER/insttype_SLIM/platform_WIN_PIR/installertype_ONLINE/build_RELEASE -O %TMP%\SoPI\ccsetup619.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\ccsetup619.exe /S
call :ic

:everything
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "Everything (x86) Descarga aproximada 1.5 MB"
if %confirm%==1 goto ix86
goto herramientas
:ix86
cls
echo Descargando...
"%~dp0wget.exe" https://www.voidtools.com/Everything-1.4.1.1026.x86-Setup.exe --no-check-certificate -O %TMP%\SoPI\Everything_x86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\Everything_x86.exe /S
call :ic
:x64
call :dw echo "Everything (x64) Descarga aproximada 1.8 MB"
if %confirm%==1 goto ix64
goto herramientas
:ix64
cls
echo Descargando...
"%~dp0wget.exe" https://www.voidtools.com/Everything-1.4.1.1026.x86-Setup.exe --no-check-certificate -O %TMP%\SoPI\Everything_x64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\Everything_x64.exe /S
call :ic


:wub
call :ds
cls
call :dw echo "Windows Update Blocker. Descarga aproximada 1 MB"
if %confirm%==1 goto ixwu
goto herramientas
:ixwu
cls
echo Descargando...
"%~dp0wget.exe" https://drive.usercontent.google.com/download?id=1N_XtcQHA6iSMC8YvL0_WIJ6n2AH0wePf -O %homedrive%\SoPI\WUB.ZIP
cls
if exist "%homedrive%\SoPI\Wub" rd /s /q "%homedrive%\SoPI\Wub"
echo Descomprimiendo...
@pushd "%~dp0"
@7za.exe x "%homedrive%\SoPI\WUB.ZIP" -o%homedrive%\SoPI\
del /f /q %homedrive%\SoPI\WUB.ZIP
start %homedrive%\SoPI\
goto WinOS

:optimizer
cls
call :dw echo "Optimizer. Descarga aproximada 2.5 MB"
if %confirm%==1 goto ixop
goto herramientas
:ixop
cls
if exist "%homedrive%\SoPI\Optimizer.exe" del /f /q "%homedrive%\SoPI\Optimizer.exe"
echo Descargando...
"%~dp0wget.exe" https://github.com/hellzerg/optimizer/releases/download/16.7/Optimizer-16.7.exe -O %homedrive%\SoPI\Optimizer.exe
cls
start %homedrive%\SoPI\
goto WinOS

:geeku
call :ds
cls
call :dw echo "GeekUninstaller. Descarga aproximada 3 MB"
if %confirm%==1 goto ixgu
goto herramientas
:ixgu
cls
echo Descargando...
"%~dp0wget.exe" https://geekuninstaller.com/geek.zip -O %homedrive%\SoPI\geek.zip
cls
if exist "%homedrive%\SoPI\geek.exe" del /f /q "%homedrive%\SoPI\geek.exe"
echo Descomprimiendo...
@pushd "%~dp0"
@7za.exe x "%homedrive%\SoPI\geek.ZIP" -o%homedrive%\SoPI\
del /f /q %homedrive%\SoPI\geek.ZIP
start %homedrive%\SoPI\
goto WinOS

:internet
title %~n0 - Categoria: Internet
mode con lines=20 cols=108
cls
echo.
echo [1] qBittorrent (x64)
echo [2] Telegram
echo.
echo  -Presiona 0 para regresar al menu principal
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto qbit
if "%hbz%"=="2" goto telegram
if "%hbz%"=="0" goto winOS
echo Opcion invalida
pause>nul
cls
goto internet

:qbit
cls
call :dw echo "qBittorrent (x64) Descarga aproximada 37 MB"
if %confirm%==1 goto ix64
goto internet
:ix64
cls
echo Descargando...
"%~dp0wget.exe" "https://sourceforge.net/projects/qbittorrent/files/qbittorrent-win32/qbittorrent-5.0.2/qbittorrent_5.0.2_x64_setup.exe/download" --no-check-certificate -O %TMP%\SoPI\qBittorrent.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\qBittorrent.exe /S
call :ic

:telegram
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
call :dw echo "Telegram (x86) Descarga aproximada 40 MB"
if %confirm%==1 goto ix86
goto internet
:ix86
cls
echo Descargando...
"%~dp0wget.exe" "https://github.com/telegramdesktop/tdesktop/releases/download/v5.9.0/tsetup.5.9.0.exe" -O %TMP%\SoPI\telegram86.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\telegram86.exe /silent
call :ic

:x64
call :dw echo "Telegram (x64) Descarga aproximada 44 MB"
if %confirm%==1 goto ix64
goto internet
:ix64
cls
echo Descargando...
"%~dp0wget.exe" "https://github.com/telegramdesktop/tdesktop/releases/download/v5.9.0/tsetup-x64.5.9.0.exe" -O %TMP%\SoPI\telegram64.exe
cls
echo Instalando, espere...
start /wait %TMP%\SoPI\telegram64.exe /silent
call :ic
:about
cls
mode con lines=20 cols=90
title %~n0 - Acerca de
echo.
echo SoPI es un proyecto gratuito y de codigo abierto que te ofrece una lista de 
echo programas para descargar y usar en tu ordenador despues de una instalacion
echo limpia de Windows. Estos programas son seleccionados cuidadosamente por su utilidad,
echo popularidad y funcionalidad, permitiendote realizar tus actividades diarias.
echo Ademas, la mayoría de estos programas son gratuitos o tienen versiones gratuitas.
echo.
echo La seleccion se basa en mi experiencia personal y laboral; asi como tambien en las
echo recomendaciones de algunos usuarios.
echo.
echo PD. SoPI funciona gracias a Wget y 7za.
pause
goto winOS

:dw
set url=%1
set mensaje=%2
echo %mensaje%
choice /c YN /m "Presiona Y para continuar o N para cancelar."
if errorlevel 2 set confirm=0
if errorlevel 1 set confirm=1
goto :eof

:ic
echo Instalacion completa
ping -n 3 localhost>nul
cls
echo Limpiando archivos temporales...
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:ds
if exist "%~dp07za.exe" (
    echo.
  ) else (
"%~dp0wget.exe" https://raw.githubusercontent.com/a-sync/7z-extra/master/7za.exe --no-check-certificate >nul
    )
)
goto :eof

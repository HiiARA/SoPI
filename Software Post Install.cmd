@echo off
title SoPI (Software Post Install)
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
title SoPI (Software Post Install)
mode con lines=40 cols=108&color 0a
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
echo 					   (Software Post Install)
echo 				 Tus Software Post Install en un solo lugar
echo 				       https://hiberhernandez.com/sopi/
echo 			╚══════════════════════════════════════════════════════════════╝
echo.
echo.
echo.
:cat
title SoPI (Software Post Install)
echo Categorias:
echo.
echo 	[1] Navegadores web      [4] Ofimatica		[7] Herramientas
echo.
echo 	[2] Multimedia	 	 [5] Runtimes           [8] Acerca de
echo.
echo.	[3] Graficos		 [6] Seguridad          [9] Otros proyectos
echo.
echo.
if not exist "%tmp%/SoPI/" md "%tmp%/SoPI/"
choice /C:123456789 /N /M "choice | Seleccione una categoria:"
if errorlevel 9 goto:proyectos
if errorlevel 8 goto:about
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
echo [7] Regresar
echo.										
set /p hbz=Opcion: 
if "%hbz%"=="1" goto google
if "%hbz%"=="2" goto firefox
if "%hbz%"=="3" goto edge
if "%hbz%"=="4" goto brave
if "%hbz%"=="5" goto opera1
if "%hbz%"=="6" goto operagx
if "%hbz%"=="7" goto winOS
echo Opcion invalida
pause>nul
cls
goto navegadores

:google
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de 1.3 MB. Presione cualquier tecla para continuar
pause>nul
echo Descargando Google Chrome de 32 bits
"%~dp0wget.exe" https://hiberhernandez.com/sopi/wp-content/uploads/2023/12/ChromeSetup86.exe --no-check-certificate -O %TMP%\SoPI\ChromeSetup86.exe
cls
echo Descargando/Instalando espere...
start /wait %TMP%\SoPI\ChromeSetup86.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [1.3 MB]. Presione cualquier tecla para continuar
pause>nul
echo Descargando Google Chrome de 64 bits
"%~dp0wget.exe" https://hiberhernandez.com/sopi/wp-content/uploads/2023/12/ChromeSetup.exe --no-check-certificate -O %TMP%\SoPI\ChromeSetup.exe
cls
echo Descargando/Instalando espere...
start /wait %TMP%\SoPI\ChromeSetup.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:firefox
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [58 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Mozilla Firefox de 32 bits
"%~dp0wget.exe" "https://download.mozilla.org/?product=firefox-latest-ssl&os=win&lang=es-ES" -O %TMP%\SoPI\FirefoxSetup_x86.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\FirefoxSetup_x86.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [60 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Mozilla Firefox de 64 bits
"%~dp0wget.exe" "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=es-ES" -O %TMP%\SoPI\FirefoxSetup_x64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\FirefoxSetup_x64.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:edge
cls
echo Descarga aprox. de [1.6 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Microsoft Edge
"%~dp0wget.exe" "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=es-419&brand=M100" -O %TMP%\SoPI\MicrosoftEdgeSetup.exe
cls
echo Descargando/Instalando...
start /wait %TMP%\SoPI\MicrosoftEdgeSetup.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:Brave
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [1.4 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Brave de 32 bits
"%~dp0wget.exe" https://referrals.brave.com/latest/BraveBrowserSetup32-BRV001.exe -O %TMP%\SoPI\BraveBrowserSetup32-BRV001.exe
cls
echo Descargando/Instalando...
start /wait %TMP%\SoPI\BraveBrowserSetup32-BRV001.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [1.4 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Brave de 64 bits
"%~dp0wget.exe" https://referrals.brave.com/latest/BraveBrowserSetup-BRV001.exe -O %TMP%\SoPI\BraveBrowserSetup-BRV001.exe
cls
echo Descargando/Instalando...
start /wait %TMP%\SoPI\BraveBrowserSetup-BRV001.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:opera1
cls
echo Descarga aprox. de [2.7 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando OperaOne
"%~dp0wget.exe" "https://net.geo.opera.com/opera/stable/windows?utm_source=mg&utm_medium=apb&utm_campaign=downloadpage" -O %TMP%\SoPI\OperaOne.exe
cls
echo Continue con la instalacion...
start /wait %TMP%\SoPI\OperaOne.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:operagx
cls
echo Descarga aprox. de [3.4 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando OperaGX
"%~dp0wget.exe" "https://net.geo.opera.com/opera_gx/stable/windows?utm_tryagain=yes&utm_source=(direct)&utm_medium=doc&utm_campaign=(direct)&http_referrer=missing&utm_site=opera_com&&utm_lastpage=opera.com/gx" -O %TMP%\SoPI\OperaGX.exe
cls
echo Continue con la instalacion...
start /wait %TMP%\SoPI\OperaGX.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:multimedia
title %~n0 - Categoria: Multimedia
mode con lines=20 cols=108
cls
echo.
echo [1] VLC Media Player
echo [2] Media Player Clasic
echo [3] AIMP
echo [4] foobar2000
echo [5] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto vlc
if "%hbz%"=="2" goto mpc
if "%hbz%"=="3" goto aimp
if "%hbz%"=="4" goto foobar
if "%hbz%"=="5" goto winOS
echo Opcion invalida
pause>nul
cls
goto multimedia

:vlc
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [42.8 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando VLC Media Player de 32 bits
"%~dp0wget.exe" https://get.videolan.org/vlc/3.0.20/win32/vlc-3.0.20-win32.exe --no-check-certificate -O %TMP%\SoPI\vlc-3.0.20-win32.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\vlc-3.0.20-win32.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [44.4 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando VLC Media Player de 64 bits
"%~dp0wget.exe" https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe --no-check-certificate -O %TMP%\SoPI\vlc-3.0.20-win64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\vlc-3.0.20-win64.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:mpc
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [18 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Media Player Clasic de 32 bits
"%~dp0wget.exe" https://github.com/clsid2/mpc-hc/releases/download/2.1.3/MPC-HC.2.1.3.x86.exe --no-check-certificate -O %TMP%\SoPI\MPC-HC.2.1.3.x86.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\MPC-HC.2.1.3.x86.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [20 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Media Player Clasic de 64 bits
"%~dp0wget.exe" https://github.com/clsid2/mpc-hc/releases/download/2.1.3/MPC-HC.2.1.3.x64.exe --no-check-certificate -O %TMP%\SoPI\MPC-HC.2.1.3.x64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\MPC-HC.2.1.3.x64.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:aimp
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [15 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando AIMP de 32 bits
"%~dp0wget.exe" https://aimp.ru/files/windows/builds/aimp_5.30.2533_w32.exe -O %TMP%\SoPI\aimp_5.30.2533_w32.exe
cls
echo Continue con la instalacion...
start /wait %TMP%\SoPI\aimp_5.30.2533_w32.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [19 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando AIMP de 64 bits
"%~dp0wget.exe" https://aimp.ru/files/windows/builds/aimp_5.30.2533_w64.exe -O %TMP%\SoPI\aimp_5.30.2533_w64.exe
cls
echo Continue con la instalacion...
start /wait %TMP%\SoPI\aimp_5.30.2533_w64.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
goto winOS

:foobar
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [6 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando foobar2000 de 32 bits
"%~dp0wget.exe" https://www.foobar2000.org/files/foobar2000_v2.1.exe --no-check-certificate -O %TMP%\SoPI\foobar2000_v2.1.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\foobar2000_v2.1.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [6 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando foobar2000 de 64 bits
"%~dp0wget.exe" https://www.foobar2000.org/files/foobar2000-x64_v2.1.exe --no-check-certificate -O %TMP%\SoPI\foobar2000-x64_v2.1.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\foobar2000-x64_v2.1.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:graficos
title %~n0 - Categoria: Graficos
mode con lines=20 cols=108
cls
echo.
echo [1] FocusOnImageViewer
echo [2] ShareX
echo [3] Paint.NET (64 bits)
echo [4] Lightshot
echo [5] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto foiv
if "%hbz%"=="2" goto sharex
if "%hbz%"=="3" goto paintn
if "%hbz%"=="4" goto lgts
if "%hbz%"=="5" goto winOS
echo Opcion invalida
pause>nul
cls
goto graficos

:foiv
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [5 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando FocusOnImageViewer de 32 bits
"%~dp0wget.exe" https://github.com/pintosoft/FocusOnImageViewer/releases/download/1.30/FocusOnIV_1.30.exe --no-check-certificate -O %TMP%\SoPI\FocusOnIV_1.29.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\FocusOnIV_1.29.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [5 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando FocusOnImageViewer de 64 bits
"%~dp0wget.exe" https://github.com/pintosoft/FocusOnImageViewer/releases/download/1.30/FocusOnIV64_1.30.exe --no-check-certificate -O %TMP%\SoPI\FocusOnIV64_1.29.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\FocusOnIV64_1.29.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:sharex
cls
echo Descarga aprox. de [35 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando ShareX
"%~dp0wget.exe" https://github.com/ShareX/ShareX/releases/download/v15.0.0/ShareX-15.0.0-setup.exe --no-check-certificate -O %TMP%\SoPI\ShareX-15.0.0-setup.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\ShareX-15.0.0-setup.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:paintn
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Paint.NET no es compatible con sistemas de 32 bits
pause
cls
goto winOS
:x64
echo Descarga aprox. de [65 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Paint.NET de 64 bits
if exist "%~dp07za.exe" (
    echo.
  ) else (
"%~dp0wget.exe" https://raw.githubusercontent.com/a-sync/7z-extra/master/7za.exe --no-check-certificate >nul
    )
)
"%~dp0wget.exe" https://github.com/paintdotnet/release/releases/download/v5.0.12/paint.net.5.0.12.install.x64.zip --no-check-certificate -O %TMP%\SoPI\paint.net.5.0.12.install.x64.zip
cls
echo Descomprimiendo...
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\paint.net.5.0.12.install.x64.zip" -o%tmp%\SoPI\
cls
echo Instalando
start /wait %TEMP%\SoPI\paint.net.5.0.12.install.x64.exe
echo Instalado
ping -n 3 localhost>nul
taskkill /f /im SetupFrontEnd.exe
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:lgts
cls
echo Descarga aprox. de [3 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Lightshot
"%~dp0wget.exe" https://app.prntscr.com/build/setup-lightshot.exe --no-check-certificate -O %TMP%\SoPI\lightshot.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\lightshot.exe /silent
ping -n 4 localhost>nul
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

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
echo [6] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto libreo
if "%hbz%"=="2" goto onlyo
if "%hbz%"=="3" goto freeo
if "%hbz%"=="4" goto sumatra
if "%hbz%"=="5" goto foxit
if "%hbz%"=="6" goto winOS
echo Opcion invalida
pause>nul
cls
goto ofimatica

:libreo
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [340 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando LibreOffice de 32 bits
"%~dp0wget.exe" https://download.documentfoundation.org/libreoffice/stable/7.6.4/win/x86/LibreOffice_7.6.4_Win_x86.msi -O %TMP%\SoPI\LibreOffice_7.6.4_Win_x86.msi
cls
echo Instalando espere...
start /wait %TMP%\SoPI\LibreOffice_7.6.4_Win_x86.msi /passive
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [360 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando LibreOffice de 64 bits
"%~dp0wget.exe" https://ftp.osuosl.org/pub/tdf/libreoffice/stable/7.6.4/win/x86_64/LibreOffice_7.6.4_Win_x86-64.msi -O %TMP%\SoPI\LibreOffice_7.6.4_Win_x86-64.msi
cls
echo Instalando espere...
start /wait %TMP%\SoPI\LibreOffice_7.6.4_Win_x86-64.msi /passive
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:onlyo
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [233 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando ONLYOFFICE de 32 bits
"%~dp0wget.exe" https://download.onlyoffice.com/install/desktop/editors/windows/distrib/onlyoffice/DesktopEditors_x86.exe --no-check-certificate -O %TMP%\SoPI\DesktopEditors_x86.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\DesktopEditors_x86.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [254 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando ONLYOFFICE de 64 bits
"%~dp0wget.exe" https://download.onlyoffice.com/install/desktop/editors/windows/distrib/onlyoffice/DesktopEditors_x64.exe --no-check-certificate -O %TMP%\SoPI\DesktopEditors_x64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\DesktopEditors_x64.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:freeo
cls
echo Descarga aprox. de [124 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando FreeOffice
"%~dp0wget.exe" https://www.freeoffice.com/download.php?filename=https://www.softmaker.net/down/freeoffice2021.msi --no-check-certificate -O %TMP%\SoPI\freeoffice2021.msi
cls
echo Instalando espere...
start /wait %TMP%\SoPI\freeoffice2021.msi /passive
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:sumatra
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [7 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando SumatraPDF de 32 bits
"%~dp0wget.exe" https://www.sumatrapdfreader.org/dl/rel/3.5.1/SumatraPDF-3.5.1-install.exe --no-check-certificate -O %TMP%\SoPI\SumatraPDF-3.5.1-install.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\SumatraPDF-3.5.1-install.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
goto winOS
:x64
echo Descarga aprox. de [8 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando SumatraPDF de 64 bits
"%~dp0wget.exe" https://www.sumatrapdfreader.org/dl/rel/3.5.1/SumatraPDF-3.5.1-64-install.exe --no-check-certificate -O %TMP%\SoPI\SumatraPDF-3.5.1-64-install.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\SumatraPDF-3.5.1-64-install.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
goto winOS

:foxit
cls
echo Descarga aprox. de [153 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Foxit Reader
"%~dp0wget.exe" https://cdn78.foxitsoftware.com/product/reader/desktop/win/2023.3.0/FoxitPDFReader20233_L10N_Setup_Prom.exe --no-check-certificate -O %TMP%\SoPI\FoxitPDFReader20233_L10N_Setup_Prom.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\FoxitPDFReader20233_L10N_Setup_Prom.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:runtimes
title %~n0 - Categoria: runtimes
mode con lines=20 cols=108
cls
echo.
echo [1] NetFramework 4.8
echo [2] VisualC++ AIO Recpack
echo [3] DirectX Redist Repack
echo [4] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto netf
if "%hbz%"=="2" goto visualc
if "%hbz%"=="3" goto directx
if "%hbz%"=="4" goto winOS
echo Opcion invalida
pause>nul
cls
goto runtimes

:netf
cls
echo Descarga aprox. de [121 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando NetFramework 4.8
"%~dp0wget.exe" https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe --no-check-certificate -O %TMP%\SoPI\ndp48-x86-x64-allos-enu.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\ndp48-x86-x64-allos-enu.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:visualc
cls
echo Descarga aprox. de [29 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando VisualC++ AIO Recpack
"%~dp0wget.exe" https://github.com/abbodi1406/vcredist/releases/download/v0.77.0/VisualCppRedist_AIO_x86_x64.exe --no-check-certificate -O %TMP%\SoPI\VCRedist_AIO_x86_x64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\VCRedist_AIO_x86_x64.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

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
echo Descarga aprox. de [14 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando DirectX Redist Repack de 32 bits
"%~dp0wget.exe" https://github.com/stdin82/htfx/releases/download/v0.0.2/DirectX_Redist_Repack_x86.zip -O %TMP%\SoPI\DirX_RRx_86.zip
cls
echo Descomprimiendo
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\DirX_RR_x86.zip" -o"%tmp%\SoPI\"
cls
ping -n 3 localhost>nul
echo Instalando espere...
start /wait %TMP%\SoPI\DirX_RRx_86.zip /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:x64
echo Descarga aprox. de [26 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Redist Repack de 64 bits
"%~dp0wget.exe" https://github.com/stdin82/htfx/releases/download/v0.0.2/DirectX_Redist_Repack_x86_x64.zip -O %TMP%\SoPI\DirX_RR_x64.zip
cls
echo Descomprimiendo...
@pushd "%~dp0"
@7za.exe x "%tmp%\SoPI\DirX_RR_x64.zip" -o"%tmp%\SoPI\"
cls
ping -n 3 localhost>nul
echo Instalando espere...
@start /wait %tmp%\SoPI\DirectX_Redist_Repack_x86_x64.exe
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:seguridad
title %~n0 - Categoria: Seguridad/Antivirus
mode con lines=20 cols=108
cls
echo.
echo [1] 360 Total Security
echo [2] Avast Free
echo [3] Microsoft Security Essentials (Windows 7)
echo [4] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto 360
if "%hbz%"=="2" goto avast
if "%hbz%"=="3" goto mse
if "%hbz%"=="4" goto winOS
echo Opcion invalida
pause>nul
cls
goto seguridad

:360
cls
echo Descarga aprox. de [101 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando 360 Total Security
"%~dp0wget.exe" https://free.360totalsecurity.com/totalsecurity/360TS_Setup.exe --no-check-certificate -O %TMP%\SoPI\360TS_Setup.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\360TS_Setup.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:avast
cls
echo Descarga aprox. de [648 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Avast Free
"%~dp0wget.exe" https://bits.avcdn.net/productfamily_ANTIVIRUS/insttype_FREE/platform_WIN/installertype_FULL/build_RELEASE/ -O %TMP%\SoPI\AvastOff.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\AvastOff.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:mse
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [12 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Microsoft Security Essentials de 32 bits
"%~dp0wget.exe" https://download.microsoft.com/download/2/A/C/2AC6E889-9EBB-4E06-A011-1AA9DAEDDB69/ESES/x86/MSEInstall.exe --no-check-certificate -O %TMP%\SoPI\MSEInstall.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\MSEInstall.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\MSEInstall.exe
cls
goto winOS
:x64
echo Descarga aprox. de [15 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Microsoft Security Essentials de 64 bits
"%~dp0wget.exe" https://download.microsoft.com/download/2/A/C/2AC6E889-9EBB-4E06-A011-1AA9DAEDDB69/ESES/amd64/MSEInstall.exe --no-check-certificate -O %TMP%\SoPI\MSEInstall.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\MSEInstall.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

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
echo [8] Regresar
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto 7zip
if "%hbz%"=="2" goto peazip
if "%hbz%"=="3" goto ccleaner
if "%hbz%"=="4" goto everything
if "%hbz%"=="5" goto wub
if "%hbz%"=="6" goto optimizer
if "%hbz%"=="7" goto geeku
if "%hbz%"=="8" goto winOS
echo Opcion invalida
pause>nul
cls
goto herramientas

:7zip
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [1 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando 7-Zip de 32 bits
echo.
"%~dp0wget.exe" https://www.7-zip.org/a/7z2301.exe --no-check-certificate -O %TMP%\SoPI\7z2301.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\7z2301.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [1.5 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando 7-Zip de 64 bits
echo.
"%~dp0wget.exe" https://www.7-zip.org/a/7z2301-x64.exe --no-check-certificate -O %TMP%\SoPI\7z2301-x64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\7z2301-x64.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:peazip
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [8 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando PeaZIP de 32 bits
"%~dp0wget.exe" https://github.com/peazip/PeaZip/releases/download/9.6.0/peazip-9.6.0.WINDOWS.exe --no-check-certificate -O %TMP%\SoPI\peazip-9.6.0.WINDOWS.exe 
cls
echo Instalando espere...
start /wait %TMP%\SoPI\peazip-9.6.0.WINDOWS.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [9 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando PeaZIP de 64 bits
"%~dp0wget.exe" https://github.com/peazip/PeaZip/releases/download/9.6.0/peazip-9.6.0.WIN64.exe --no-check-certificate -O %TMP%\SoPI\peazip-9.6.0.WIN64.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\peazip-9.6.0.WIN64.exe /silent
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:ccleaner
cls
echo Descarga aprox. de [72 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando CCleaner Free
"%~dp0wget.exe" https://bits.avcdn.net/productfamily_CCLEANER/insttype_SLIM/platform_WIN_PIR/installertype_ONLINE/build_RELEASE -O %TMP%\SoPI\ccsetup619.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\ccsetup619.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:everything
cls
if «%processor_architecture%» == «x86» (goto x86) else (goto x64)
:x86
echo Descarga aprox. de [1.5 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Everything de 32 bits
"%~dp0wget.exe" https://www.voidtools.com/Everything-1.4.1.1024.x86-Setup.exe --no-check-certificate -O %TMP%\SoPI\Everything-1.4.1.1024.x86-Setup.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\Everything-1.4.1.1024.x86-Setup.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS
:x64
echo Descarga aprox. de [1.8 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Everything de 64 bits
"%~dp0wget.exe" https://www.voidtools.com/Everything-1.4.1.1024.x64-Setup.exe --no-check-certificate -O %TMP%\SoPI\Everything-1.4.1.1024.x64-Setup.exe
cls
echo Instalando espere...
start /wait %TMP%\SoPI\Everything-1.4.1.1024.x64-Setup.exe /S
echo Instalado
ping -n 3 localhost>nul
del /f /q %TMP%\SoPI\*.*
cls
goto winOS

:wub
cls
echo Descarga aprox. de [1 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Windows Update Blocker
"%~dp0wget.exe" https://www.sordum.org/files/download/windows-update-blocker/Wub.zip -O %public%\Desktop\Wub.zip
cls
echo Windows Update Blocker se ha guardado en el Escritorio
echo.
pause
cls
goto winOS

:optimizer
cls
echo Descarga aprox. de [2.5 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando Optimizer
"%~dp0wget.exe" https://github.com/hellzerg/optimizer/releases/download/16.4/Optimizer-16.4.exe -O %public%\Desktop\Optimizer.exe
cls
echo Optimizer se ha guardado en el Escritorio
echo.
pause
cls
goto winOS

:geeku
cls
echo Descarga aprox. de [3 MB], presione cualquier tecla para confirmar
pause>nul
echo Descargando GeekUninstaller
"%~dp0wget.exe" https://geekuninstaller.com/geek.zip -O %public%\Desktop\geek.zip
cls
echo GeekUninstaller se ha guardado en el Escritorio
echo.
pause
cls
goto winOS

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

@echo off
:proyectos
title %~n0 - Proyectos
mode con lines=20 cols=108
cls
echo.
echo 1. SoPI: (Software Post Intall) Software esencial para Windows
echo 2. DcManyTools (Explorador de archivos con mas de 500 herramientas gratuitas)
echo 3. UnHIDER USBFile (Herramienta para desinfectar unidades extraibles)
echo 4. Sitio web de Hiber Hernandez (Tecnpologia, software y descargas)
echo 5. Regresar al menu
echo.
set /p hbz=Opcion: 
if "%hbz%"=="1" goto sopi
if "%hbz%"=="2" goto dcmt
if "%hbz%"=="3" goto uuf
if "%hbz%"=="4" goto hiberhdz
if "%hbz%"=="5" goto winOS
echo Opcion invalida
pause>nul
cls
goto :proyectos

:sopi
start https://hiberhernandez.com/sopi/
goto :proyectos

:dcmt
start https://hiberhernandez.com/dcmanytools/
goto :proyectos

:uuf
start https://hiberhernandez.com/unhiderusbfile/
goto :proyectos

:hiberhdz
start https://hiberhernandez.com/
goto :proyectos
@echo off
set upstreammajor=
set upstreamminor=
set trayversion=
set hputtyversion=

for /f "tokens=1,2 delims=p." %%i in ("%1") do set upstreammajor=%%i
for /f "tokens=2,3 delims=p.-" %%i in ("%1") do set upstreamminor=%%i
for /f "tokens=2,3 delims=-t" %%i in ("%1") do set trayversion=%%i
for /f "tokens=2 delims=h" %%i in ("%1") do set hputtyversion=%%i
if %hputtyversion%.==. echo Usage: %0 p0.61-t004-h001 & goto end

rem remove leading zeros, fixing octal confusion
set /a trayversion=10000%trayversion% %% 10000
set /a hputtyversion=10000%hputtyversion% %% 10000

echo #define TEXTVER "HPuTTY %1" > ../HPuTTY/version.h
echo #define SSHVER "HPuTTY-%1" >> ../HPuTTY/version.h
echo #define BINARY_VERSION %upstreammajor%,%upstreamminor%,%trayversion%,%hputtyversion% >> ../HPuTTY/version.h

msbuild ..\HPuTTY\windows\vs2012\putty.sln /p:Configuration=Release /t:Clean;Rebuild

rmdir tmp /s /q
mkdir tmp

copy NSIScript\HPuTTYDist.nsi tmp

echo !define VERSIONMAJOR "%upstreammajor%" > tmp/version.nsh
echo !define VERSIONMINOR "%upstreamminor%" >> tmp/version.nsh
echo !define VERSIONBUILD "%hputtyversion%" >> tmp/version.nsh

copy ..\HPuTTY\windows\putty.ico tmp
copy ..\HPuTTY\windows\vs2012\putty\Release\putty.exe tmp
copy ..\HPuTTY\windows\vs2012\psftp\Release\psftp.exe tmp
copy ..\HPuTTY\windows\vs2012\pscp\Release\pscp.exe tmp
copy ..\HPuTTY\windows\vs2012\plink\Release\plink.exe tmp

"c:\Program Files (x86)\NSIS\makensis.exe" tmp\HPuTTYDist.nsi

copy tmp\hputty-installer.exe hputty-%1-installer.exe
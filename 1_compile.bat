@echo off
echo.
echo ===========================================================================
echo Compiling
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\preprocess.php kosneo.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\..\macro11\macro11.exe -ysl 32 -yus -m ..\..\macro11\sysmac.sml -l _kosneo.lst _kosneo.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking
echo ===========================================================================
..\..\php5\php.exe -c ..\..\php5\ -f ..\scripts\lst2bin.php _kosneo.lst ./release/kosneo.sav sav
..\..\macro11\rt11dsk.exe d neon.dsk .\release\kosneo.sav >NUL
..\..\macro11\rt11dsk.exe a neon.dsk .\release\kosneo.sav >NUL

echo.
@echo off
setlocal EnableDelayedExpansion
:finddrive
FOR %%d in (G F E) DO (
	IF EXIST "%%d:"\* (
		IF NOT "%%d:"=="%~d0" (
			SET drive=%%d:
			goto copyfiles
		)
	)
)
echo No drive found.
goto end

:copyfiles

for /f "tokens=2" %%a in ('wmic volume get Label^, DriveLetter ^| find "%drive%"') do set label=%%a
echo Using drive %drive% (%label%)
FOR %%f IN (%*) DO (
	IF EXIST %%~ff% (
		echo Received file "%%~nxf"
		echo Copying to %drive%
		copy /y "%%~ff" "%drive%"
	)
)
:end
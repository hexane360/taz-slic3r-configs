@echo off
setlocal EnableDelayedExpansion

:finddrive
FOR %%d in (G F E) DO (
	IF EXIST "%%d:"\* (
		SET drive=%%d:
		echo Using drive %%d:
		goto copyfiles
	)
)
echo No drive found.
goto end

:copyfiles
FOR %%f IN (%*) DO (
	IF EXIST %%~ff% (
		echo Received file "%%~nxf"
		echo Copying to %drive%
		copy /y "%%~ff" "%drive%"
	)
)
:end

@echo off
for %%f in (%*) do (
	echo Received file "%%~ff"
	echo Running fan script through Slic3r perl
	"%~d0\gnmaker\Printrun\Slic3r\perl5.24.0.exe" -i.1 "%~dp0dual_to_single_fan.pl" "%%~ff" && (
		del "%%~ff.1"
	) || (
		echo Failed to run fan script, error %ERRORLEVEL%
		pause
	)
)

:finddrive
FOR %%d in (G F E) DO (
	IF EXIST "%%d:"\* (
		IF NOT "%%d:"=="%~d0" (
			SET drive=%%d:
			goto copyfiles
		)
	)
)
echo No external drive found.
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
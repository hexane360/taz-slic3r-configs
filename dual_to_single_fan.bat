@echo off
setlocal EnableDelayedExpansion
FOR %%f IN (%*) DO (
	IF EXIST "%%~ff" (
		echo Received file "%%~ff"
		echo Modifying M106. . .
		type "%%~ff" | call "%~dp0repl.bat" "^(M106 S(\d*).*)$" "$1\nM106 P1 S$2 ;single extruder fan" X M >"%%~ff.1" && (
			move /y "%%~ff.1" "%%~ff"
		) || (
			del "%%~ff.1"
			echo Failed to run M106 script
		)
		echo Modifying M107. . .
		type "%%~ff" | call "%~dp0repl.bat" "^(M107(\D.*)?)$" "$1\nM107 P1 ;single extruder fan" X M >"%%~ff.1" && (
			move /y "%%~ff.1" "%%~ff"
		) || (
			del "%%~ff.1"
			echo Failed to run M107 script
		)
	) ELSE (
		echo Unable to find file "%%~ff", skipping
	)
)
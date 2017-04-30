@echo off
setlocal EnableDelayedExpansion

FOR %%f IN (%*) DO (
	IF EXIST %%~ff% (
		echo Received file "%%~nxf"
		type "%%~ff" | call repl.bat "^(M106 S(\d*).*)$" "${1}\nM106 P1 S${2} ;single extruder fan" M X >"%%~ff.1"
		move /y "%%~ff.1" "%%~ff"
	)
)

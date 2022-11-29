@REM echo off

SET mypath=%~dp0

powershell -file "%mypath:~0,-1%\execute.ps1" "%*"
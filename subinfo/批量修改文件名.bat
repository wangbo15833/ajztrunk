@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "delims=" %%a in ('dir /b^|findstr "signrule"') do (
set name=%%a
set name=!name:signrule=subinfo!
ren "%%a" "!name!"
)
pause
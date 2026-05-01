@echo off
set "scriptPath=%~dp0switcher.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Unblock-File -Path '%scriptPath%'; & '%scriptPath%' '%1'}"
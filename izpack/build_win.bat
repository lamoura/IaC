@echo off
set JAVA_TOOL_OPTIONS="-Dfile.encoding=utf-8"

mkdir installer

call "C:\Program Files\IzPack\bin\compile.bat" myapp\main.xml -b myapp -o installer\myapp_setup.jar -k standard
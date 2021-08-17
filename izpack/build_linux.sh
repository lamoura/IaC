#!/usr/bin/env bash

export JAVA_TOOL_OPTIONS="-Dfile.encoding=utf-8"

mkdir installer

/opt/IzPack/bin/compile myapp/main.xml -b myapp -o installer/myapp_setup.jar -k standard


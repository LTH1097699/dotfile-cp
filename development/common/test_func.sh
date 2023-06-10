#!/bin/bash

. function_check.sh

var1=/home/lth/Downloads/dotfile-cp

if exist_dir $var1; then echo "true" ; fi



create_desktop()
{
    FILE_DESKTOP=intellij.desktop
    
    touch $FILE_DESKTOP

cat   <<EOF >$FILE_DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=Intellij
Icon=/opt/ideaIC/bin/idea.svg
Exec=/opt/ideaIC/bin/idea.sh
TryExec=/opt/ideaIC/bin/idea.sh
Categories=Development;IDE;
Terminal=false
#StartupWMClass=jetbrains-datagrip
EOF

}
create_desktop

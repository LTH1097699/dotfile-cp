#!bin/bash
. MessageEnum.sh
. function_check.sh

# variable
INTELLIJ_VERSION="ideaIC-2023.1.1.tar.gz"


# function

download_file()
{
    
    #wget doc: https://www.computerhope.com/unix/wget.htm or wget --help

    # -P to set specific location
    # -c (--continue) resume download when connection drop, and instead of starting from scratch, it continues from previouse one
    # -N (--timestamping) turn on timestamping,  not download if don't have any newer of file from remote

    FILE_PATH=$HOME/Downloads/$INTELLIJ_VERSION

    [[ ! exist_file $FILE_PATH ]] && {
        wget --no-hsts -cNP $HOME/Downloads https://download-cdn.jetbrains.com/idea/$INTELLIJ_VERSION
    } 
}

create_dir_intellij()
{
    INTELLIJ_DEST="/opt/ideaIC" # destination to extract the archive file
    [[ ! exist_dir $INTELLIJ_DEST ]] && {
        sudo mkdir -p $INTELLIJ_DEST
    }
}

extract_file()
{

    # -x to extract the archive file, -v print tar operation on the terminal
    # -f specifies the filename of the archive file
    # -z use gzip to decompress a file with .gz extension
    # -C set destination when decompress the archive file
    # want more understad about -z option read this article: https://unix.stackexchange.com/questions/722967/why-tar-command-uses-gzip-command-through-z-option

    cd $HOME/Downloads

    sudo tar -xvzf $INTELLIJ_VERSION --strip-components 1 -C  $INTELLIJ_DEST
    
    if [  $? -ne 0 ]; then
        echo " ====ERROR can not tar file======"&&exit;
    fi
    echo " ====INFO tar file successfully======";

    # -R ( --recursive) apply for all childs in root directory
    # -f ( --silent ) suppress the error messages, -v ( --verbose) print the operation
    
    sudo chown -Rfv $USER:users "$INTELLIJ_DEST";
    if [  $? -ne 0 ]; then
        echo " ====ERROR can not change own======"&&exit
    fi

    exec "$INTELLIJ_DEST/bin/idea.sh"

}

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

sudo cp -rf FILE_DESKTOP /usr/share/applications
}

main(){
    download_file
    create_dir_intellij
    extract_file
    create_desktop
}

main

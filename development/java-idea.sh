#!bin/bash

#wget doc: https://www.computerhope.com/unix/wget.htm or wget --help

#install intellij version 2023.1.1
INTELLIJ_VERSION="ideaIC-2023.1.1.tar.gz"

# -P to set specific location
# -c (--continue) resume download when connection dorp, and instead of starting from scratch, it continue from previouse one
# -N (--timestamping) turn on timestamping,  not download if don't have any newer of file from remote

if [ ! -f "$HOME/Downloads/$INTELLIJ_VERSION" ]; then
    echo " =====ERROR file ideaIC not exist=================="
    echo " =====INFO download file ideaIC =================="
    wget --no-hsts -cNP $HOME/Downloads https://download-cdn.jetbrains.com/idea/$INTELLIJ_VERSION
    if [  $? -ne 0 ]; then
        echo " ====ERROR can not download file ideaIC======"&&exit;
    fi
    echo " =====INFO download file ideaIC successfully =================="
fi


# -x to extract the archive file, -v print tar operation on the terminal
# -f specifies the filename of the archive file
# -z use gzip to decompress a file with .gz extension
# -C set destination when decompress the archive file
# want more understad about -z option read this article: https://unix.stackexchange.com/questions/722967/why-tar-command-uses-gzip-command-through-z-option

INTELLIJ_DEST="/opt/ideaIC" # destination to extract the archive file
if [ ! -d "$INTELLIJ_DEST" ]; then
    echo " =====ERROR directory ideaIC not exist=================="
    echo " =====INFO create directory ideaIC =================="
    sudo mkdir -p $INTELLIJ_DEST
    if [  $? -ne 0 ]; then
        echo " ====ERROR can not create directory ideaIC======"&&exit;
    fi
fi


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

 

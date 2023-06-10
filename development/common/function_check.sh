#!/bin/bash

# check specific file is exist by stdin var1
exist_dir(){
    
    [[ -d $1 ]] && { true; return; }

     false; return;
}

# check specific file is exist by stdin var1
exist_file(){

    [[ -f $1 ]] && { true; return; }

    false; return;
}

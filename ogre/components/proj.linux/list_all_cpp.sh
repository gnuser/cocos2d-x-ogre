﻿#!/bin/bash

append_str=' \'

list_alldir()
{
    for file in $1/*
    do
        if [ -f $file ]; then
            echo "					$file$append_str" | grep .cpp
        fi
        
        if [ -d $file ]; then
            list_alldir $file            
        fi
    done     
}

#if [ $# -gt 0 ]; then
#    list_alldir "$1"
#else
#    list_alldir "."
#fi

list_alldir "../RTShaderSystem/src" > allcpp.txt
#list_alldir "../../../../public" >> allcpp.txt
sed -i 's/\.cpp/\.o/g' allcpp.txt


#!/bin/bash

#Install guide
#https://www.geeksforgeeks.org/how-to-install-minecraft-on-linux/

deb-install() {
    sudo apt-get install openjdk-8-jdk
    wget https://launcher.mojang.com/download/Minecraft.deb #download launcher 
    sudo dpkg -i Minecraft.deb #install .deb file
    sudo apt -f install #resolve dependency issue
}

default-install() {
    wget https://launcher.mojang.com/download/Minecraft.tar.gz
    tar -xvf Minecraft.tar.gz
}


case "$(hostname)" in
    deb-install)
        deb-install
        ;;
    *) 
        default-install
        ;;
esac

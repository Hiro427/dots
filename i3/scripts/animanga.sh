#!/usr/bin/env bash

MANGA=$(rclone lsf --dirs-only "dropbox:/Manga" | wc -l)
ANIME=$(rclone lsf --dirs-only "dropbox:/Anime" | wc -l)
# LOCAL_ANIME=$(find ~/Downloads/Anime/ -maxdepth 1 -mindepth 1 -type d | wc -l)
# LOCAL_MANGA=$(find ~/Downloads/Manga/ -maxdepth 1 -mindepth 1 -type d | wc -l)
printf "󱜏 %s  %s\n" "$ANIME" "$MANGA" 

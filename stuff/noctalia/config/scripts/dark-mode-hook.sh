#!/usr/bin/env bash
is_dark="$1"

if [ "$is_dark" = "true" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi

#!/usr/bin/env bash

. "$SCRIPT_SRC"/browser_list.sh

detect_browser() {

  write_browser() {
    case "$1" in
    *firefox* | *firedragon | *librewolf*) ../change_browser.sh "blink" "$1" ;;
    *) printf "%s" "$1" >~/.bigwebapps/BROWSER ;;
    esac
  }

  mkdir -p ~/.bigwebapps
  for br in "${browser_bin_list[@]}"; do
    if which -a "$br" 2>/dev/null; then
      write_browser "$br"
      exit 0
    fi
  done
  
}

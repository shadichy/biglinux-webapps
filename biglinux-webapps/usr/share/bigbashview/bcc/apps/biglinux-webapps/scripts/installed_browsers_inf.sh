#!/usr/bin/env bash

. "$SCRIPT_SRC"/browser_list.sh

FLATPAK_BIN=/var/lib/flatpak/exports/bin
SNAPD_BIN=/var/lib/snapd/snap/bin

declare -A browser_trans browser_icons
declare -a available_browsers

resolve_name() {

  case "${1}" in
  com.brave.Browser) br_name='brave' ;;
  *.*)
    br_name=${1##*.}
    # shellcheck disable=SC2001
    br_name=$(sed 's/\([a-z]\)\([A-Z]\)/\1-\2/g' <<<"${br_name}")

    # remove verisoning
    br_name=${br_name%-community}
    ;;
  *)
    br_name=${1//-browser/}

    # remove branding
    br_name=${br_name#microsoft-}
    br_name=${br_name#google-}
    br_name=${br_name#flashpeak-}

    # remove verisoning
    br_name=${br_name%-stable}
    ;;
  esac

  printf "%s" "$br_name"
}

get_title() {
  printf "%s %s" "${browser_trans["${1##*/}"]}" "$(
    if [[ "$1" = "${FLATPAK_BIN}"* ]]; then
      printf "(FLATPAK)"
    elif [[ "$1" = "${SNAPD_BIN}"* ]]; then
      printf "(SNAP)"
    fi
  )"
}

set_br() {
  available_browsers+=("${2:+$2/}$1")

  # Adding translations
  case "$1" in
  bbv-client)
    name=$"WEBVIEW"
    icon="$1"
    ;;
  electron*)
    name=$"ELECTRON"" ${1#electron}"
    icon="electron"
    ;;
  *)
    name=$(resolve_name "$1")
    icon="${name,,}" # to lowercase
    name=${name^^}   # to uppercase
    ;;
  esac
  browser_trans["$1"]=$"${name/-/ }"
  browser_icons["$1"]=$icon

}

shopt -s nocasematch

for browser in "${browser_bin_list[@]}"; do

  # Listing available
  shopt -s lastpipe
  which -a "$browser" 2>/dev/null |
    grep -Ev "/usr/local/|${FLATPAK_BIN}|${SNAPD_BIN}" |
    while read -r br; do readlink -f "$(dirname "$br")"; done |
    uniq |
    while read -r dir; do set_br "$browser" "${dir#/usr/bin}"; done
  shopt -u lastpipe

  # some systems PATH does not include FLATPAK and SNAP executable paths
  [ -x "${FLATPAK_BIN}/$browser" ] && set_br "$browser" "$FLATPAK_BIN"
  [ -x "${SNAPD_BIN}/$browser" ] && set_br "$browser" "$SNAPD_BIN"

done

export browser_trans browser_icons available_browsers FLATPAK_BIN SNAPD_BIN
export -f get_title

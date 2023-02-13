#!/usr/bin/env bash

declare -a browser_bin_list=(
    "brave"
    "brave-nightly"
    "brave-browser-nightly"
    "com.brave.Browser"
    "firefox"
    "org.mozilla.firefox"
    "firefoxpwa"
    "librewolf"
    "io.gitlab.librewolf-community"
    "firedragon"
    "vivaldi-stable"
    "vivaldi-snapshot"
    "chromium"
    "org.chromium.Chromium"
    "com.github.Eloston.UngoogledChromium"
    "google-chrome-stable"
    "google-chrome-beta"
    "google-chrome-unstable"
    "com.google.Chrome"
    "com.google.ChromeDev"
    "microsoft-edge-beta"
    "microsoft-edge-dev"
    "microsoft-edge-stable"
    "com.microsoft.Edge"
    "iron"
    "yandex-browser-stable"
    "yandex-browser-beta"
    "naver-whale-stable"
    "iridium"
    "decentr-browser-stable"
    "thorium-browser"
    "flashpeak-slimjet"
    "epiphany"
    "org.gnome.Epiphany"
    "electron"
)

for i in {24..5}; do
    browser_bin_list+=("electron$i")
done
# waiting for opera devs to add support for webapps

browser_bin_list+=("bbv-client")

export browser_bin_list

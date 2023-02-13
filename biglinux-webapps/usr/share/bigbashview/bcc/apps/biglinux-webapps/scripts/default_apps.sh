#!/usr/bin/env bash

case "$1" in
# this needs to be sorted by popularity, but i'm too lazy :)
*"cleverpdf") : "cleverpdf.com" ;;
*"netflix") : "netflix.com" ;;
*"youtube-music") : "music.youtube.com" ;;
*"youtube") : "youtube.com" ;;
*"twitch") : "twitch.tv" ;;
*"facebook") : "facebook.com" ;;
*"twitter") : "twitter.com" ;;
*"instagram") : "instagram.com" ;;
*"reddit") : "reddit.com" ;;
*"pinterest") : "pinterest.com" ;;
*"linkedin") : "linkedin.com" ;;
*"messenger") : "messenger.com" ;;
*"whatsapp") : "web.whatsapp.com" ;;
*"odysee") : "odysee.com" ;;
*"spotify") : "spotify.com" ;;
*"msoffice") : "office.com" ;;
*"outlook") : "outlook.com" ;;
*"onedrive") : "onedrive.com" ;;
*"discord") : "discord.com/app" ;;
*"msteams") : "teams.microsoft.com" ;;
*"skype") : "web.skype.com" ;;
*"telegram") : "web.telegram.com" ;;
*"slack") : "slack.com" ;;
*"deezer") : "deezer.com" ;;
*"gmail") : "mail.google.com" ;;
*"gclassroom") : "classroom.google.com" ;;
*"gsheets") : "docs.google.com/spreadsheets" ;;
*"gdocs") : "docs.google.com" ;;
*"gdrive") : "drive.google.com" ;;
*"gcalendar") : "calendar.google.com" ;;
*"gcontacts") : "contacts.google.com" ;;
*"gphotos") : "photos.google.com" ;;
*"hangouts") : "hangouts.google.com" ;;
*"gkeep") : "keep.google.com" ;;
*"gmaps") : "maps.google.com" ;;
*"gmeet") : "meet.google.com" ;;
*"gslides") : "docs.google.com/presentation" ;;
*"gtrans") : "translate.google.com" ;;
*"gdraw") : "drawings.google.com" ;;
*"ymail") : "mail.yahoo.com" ;;
*) : "$1" ;;
esac
url=$_
printf "%s" "$url"

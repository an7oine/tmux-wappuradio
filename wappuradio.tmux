#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  # Kytketään liitännäinen päälle: tilarivi.
  status_right=$(tmux show-option -gqv "status-right")
  tmux set-option -g status-right \
    "#(\"${BASH_SOURCE[0]}\" esittaja_ja_kappale)$status_right"

elif [ $1 == esittaja_ja_kappale ]; then
  curl -s 'https://wappuradio.fi/api/nowplaying' | jq -r '"♫ " + .song'
fi

#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  # Kytketään liitännäinen päälle: tilarivi.
  status_right=$(tmux show-option -gqv "status-right")
  tama="#($( readlink -f ${BASH_SOURCE[0]} ) esittaja_ja_kappale)"
  if ! [[ "$status_right" == *"$tama"* ]]; then
    tmux set-option -g status-right "$tama$status_right"
  fi

elif [ $1 == esittaja_ja_kappale ]; then
  pvm=$( date +%m-%d )
  if [[ 04-12 < $pvm && $pvm < 05-01 ]]; then
    curl -s 'https://wappuradio.fi/api/nowplaying' | jq -r '"♫ " + .song'
  fi
fi

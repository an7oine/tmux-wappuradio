#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  # Kytketään liitännäinen päälle: tilarivi.
  status_right=$(tmux show-option -gqv "status-right")
  tama="#($( readlink -f ${BASH_SOURCE[0]} ) esittaja_ja_kappale)"
  if ! [[ "$status_right" == *"$tama"* ]]; then
    tmux set-option -g status-right "$tama$status_right"
  fi

  # Toistonäppäin.
  toistonappain=$(tmux show-option -gqv "@wappuradio-toistonappain")
  [ -n "$toistonappain" ] && tmux bind-key $toistonappain \
    "run-shell '\"${BASH_SOURCE[0]}\" toista_tai_pysayta'"

  exit 0
fi


esittaja_ja_kappale() {
  pvm=$( date +%m-%d )
  if [[ 04-12 < $pvm && $pvm < 05-01 ]]; then
    curl -s 'https://wappuradio.fi/api/nowplaying' | jq -r '"♫ " + .song'
  fi
}

toista_tai_pysayta() {
  PID=/tmp/wappuradio.pid
  if [ -s "$PID" ]; then
    kill "$( cat "$PID" )"
    rm -f "$PID"
  else
    ffplay "https://stream1.wappuradio.fi/wappuradio.opus"  -autoexit -nodisp &>/dev/null &
    echo $! >"$PID"
  fi
}


# Suoritetaan annettu toiminto.
eval "${@}"

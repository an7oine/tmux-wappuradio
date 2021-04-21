# Rakkauden Wappuradiossa soiva kipale Tmuxin tilarivillä

## Järjestelmävaatimukset
* tmux >= 3.0
* Curl
* Jq

## Asennus
Lisätään liitännäinen Tmuxin asetuksiin:
```
# .tmux.conf
set -g @plugin 'an7oine/tmux-wappuradio'
```
Alustetaan Tmuxin asetukset uudelleen ja näppäillään `<prefix> + I` liitännäisen asentamiseksi.

## Käyttö
Esittäjän ja kappaleen nimi näkyy tilatietopalkissa.

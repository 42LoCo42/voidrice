#!/usr/bin/env bash
# Profile file. Runs on login.
# shellcheck disable=SC2155 disable=SC1090

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

export DISPLAY=":1"
export TERM="st-256color"
export WINEUSERNAME="$USER"

# Make xz parallel
export XZ_DEFAULTS="-T 0"

pgrep mpd >/dev/null || (mpd >/dev/null 2>&1 &)
pgrep pulseaudio >/dev/null || (pulseaudio --start --log-target=file:/tmp/pulse.log >/dev/null 2>&1 &)

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

firefox-sync larbs.default &

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && {
	if grep -Fq "Artix" "/etc/os-release"; then
		dbus-launch --exit-with-session sx
	else
		sx
	fi
	firefox-sync larbs.default
	exit
}

#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE="" HISTFILESIZE="" # Infinite history.

   ANSI_RED="\[[38;5;1m\]"
 ANSI_GREEN="\[[38;5;2m\]"
ANSI_YELLOW="\[[38;5;3m\]"
  ANSI_BLUE="\[[38;5;4m\]"
ANSI_PURPLE="\[[38;5;5m\]"
  ANSI_CYAN="\[[38;5;6m\]"
 ANSI_WHITE="\[[38;5;7m\]"
  ANSI_BOLD="\[[1m\]"
 ANSI_RESET="\[[m\]"

iface() {
	route -n | grep -m1 ^0.0.0.0 | awk '{print $8}'
}

local_ip() {
	local data
	data="$(ip addr show "$(iface)" 2>/dev/null | grep "inet")"
	[ -z "$data" ] && data="a offline"
	echo "$data" | awk '{print $2}' \
	| sed 's|/.*||g' | sed 1q | sed -E 's|(.)$|\1 |g'
}

git_repo() {
	git rev-parse --show-toplevel 2>/dev/null \
	| sed 's|.*/||g' | sed -E 's|^(.)| \1|g'
}

git_branch() {
	git branch 2>/dev/null | grep -E "^\*" | sed -E 's|^\* |:|g'
}

export PS1="\
${ANSI_BOLD}\
${ANSI_RED}[\$? ${ANSI_YELLOW}\u${ANSI_GREEN}@${ANSI_BLUE}\h \
${ANSI_GREEN}\$(local_ip)\
${ANSI_PURPLE}\w\
${ANSI_CYAN}\$(git_repo)\
\$(git_branch)\
${ANSI_RED}]\n${ANSI_WHITE}λ \
${ANSI_RESET}\
"

export PATH="$PATH:$HOME/.stack/programs/x86_64-linux/ghc-tinfo6-8.10.2/bin"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "/usr/share/bash-complete-alias/complete_alias" ] && source "/usr/share/bash-complete-alias/complete_alias"

# Safe copypaste
bind 'set enable-bracketed-paste on'
# Case insensitive tab completion
bind 'set completion-ignore-case on'

# Connect to ssh-agent
if [ -f "/tmp/ssh-agent-$USER" ]; then
	. "/tmp/ssh-agent-$USER"
else
	ssh-agent | grep -v "echo" > "/tmp/ssh-agent-$USER"
fi


#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

   ANSI_RED="\[[38;5;1m\]"
 ANSI_GREEN="\[[38;5;2m\]"
ANSI_YELLOW="\[[38;5;3m\]"
  ANSI_BLUE="\[[38;5;4m\]"
ANSI_PURPLE="\[[38;5;5m\]"
  ANSI_CYAN="\[[38;5;6m\]"
 ANSI_WHITE="\[[38;5;7m\]"
 ANSI_BOLD="\[[1m\]"
ANSI_RESET="\[[m\]"

export PS1="\
${ANSI_BOLD}\
${ANSI_RED}[\$? ${ANSI_YELLOW}\u${ANSI_GREEN}@${ANSI_BLUE}\h \
${ANSI_GREEN}\$(ip addr show \"\$(route -n | grep -m1 ^0.0.0.0 | awk '{print \$8}')\" | grep \"inet \" | awk '{print \$2}' | sed 's/\\/[0-9]*//g') \
${ANSI_PURPLE}\w\
${ANSI_CYAN}\$(git branch 2>/dev/null | sed -n -e 's/^\\* \\(.*\\)/ \\1/p')\
${ANSI_RED}]\n${ANSI_WHITE}λ \
${ANSI_RESET}\
"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

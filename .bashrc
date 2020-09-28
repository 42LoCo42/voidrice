#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[[38;5;1m\]\[[1m\][\$? \[[38;5;3m\]\u\[[38;5;2m\]@\[[38;5;4m\]\h \[[38;5;2m\]\$(ip addr show \"\$(route -n | grep ^0.0.0.0 | awk '{print \$8}')\" | grep \"inet \" | awk '{print \$2}' | sed 's/\\/[0-9]*//g') \[[38;5;5m\]\w\[[38;5;6m\]\$(git branch 2>/dev/null | sed -n -e 's/^\\* \\(.*\\)/ \\1/p')\[[38;5;1m\]]\n\[[38;5;7m\]λ \[[m\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

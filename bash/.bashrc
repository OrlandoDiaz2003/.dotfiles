# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

#historial
export HISTSIZE=1000000
export HISTFILESIZE=2000000
export HISTTIMEFORMAT='%Y-%m-%dT%H:%M:%S '

shopt -s histappend

#git completion
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='[\h@\u \w $(parse_git_branch)]$ '

export PATH
export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/opt/node/bin:$PATH
export MANPAGER="nvim +Man!"

#alias
alias vsc="code ."
alias open="nautilus ."
alias neofetch="fastfetch --config neofetch"
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

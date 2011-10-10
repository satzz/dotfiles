# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#http://d.hatena.ne.jp/suusuke/20080927/1222478262
function share_history {
	history -a
	history -c
	history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

export PATH=/usr/local/sbin/:/usr/sbin/:$PATH

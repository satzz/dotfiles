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

alias r=rails
rvm use 1.8.7@rails3.0
R3PATH=/usr/local/rvm/gems/ruby-1.8.7-p352@rails3.0/
export RUBYLIB=$R3PATH/gems/:$RUBYLIB
export RUBYLIB=$R3PATH/bin/:$RUBYLIB
export RUBYLIB=$R3PATH:$RUBYLIB
export RUBYLIB=/usr/local/rvm/wrappers/ruby-1.8.7-p352@rails3.0:$RUBYLIB
export RUBYLIB=/usr/local/rvm/gems/ruby-1.8.7-p352/gems/rubygems-update-1.3.7/bin/:$RUBYLIB


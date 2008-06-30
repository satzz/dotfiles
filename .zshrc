#read settings of fink
source /sw/bin/init.sh

export PATH=$HOME/bin:/opt/local/bin:$PATH:/usr/local/lib/gcc-lib:/usr/local/bin:/usr/local/mysql/bin
export HOSTNAME=hatena-nokonpyuta
#»þ´ÖÆâ¤Ë²¿ÅÙKeychain¤ò¼Â¹Ô¤·¤¿¤«¤Ë´Ø·¸¤Ê¤¯¡¤30Ê¬¤Çssh-agent¤¬½ªÎ»¤¹¤ë¤è¤¦¤Ë¤Ê¤ë
keychain --timeout 1 ~/.ssh/id_dsa  # ÈëÌ©¸°
source ~/.keychain/$HOSTNAME-sh
# based by http://devel.aquahill.net/zsh/zshoptions

# Ê£¿ô¤Î zsh ¤òÆ±»þ¤Ë»È¤¦»þ¤Ê¤É history ¥Õ¥¡¥¤¥ë¤Ë¾å½ñ¤­¤»¤ºÄÉ²Ã¤¹¤ë
setopt append_history

# »ØÄê¤·¤¿¥³¥Þ¥ó¥ÉÌ¾¤¬¤Ê¤¯¡¢¥Ç¥£¥ì¥¯¥È¥êÌ¾¤È°ìÃ×¤·¤¿¾ì¹ç cd ¤¹¤ë
setopt auto_cd

# Êä´°¸õÊä¤¬Ê£¿ô¤¢¤ë»þ¤Ë¡¢°ìÍ÷É½¼¨¤¹¤ë
setopt auto_list

# Êä´°¥­¡¼¡ÊTab, Ctrl+I) ¤òÏ¢ÂÇ¤¹¤ë¤À¤±¤Ç½ç¤ËÊä´°¸õÊä¤ò¼«Æ°¤ÇÊä´°¤¹¤ë
setopt auto_menu

# ¥«¥Ã¥³¤ÎÂÐ±þ¤Ê¤É¤ò¼«Æ°Åª¤ËÊä´°¤¹¤ë
setopt auto_param_keys

# ¥Ç¥£¥ì¥¯¥È¥êÌ¾¤ÎÊä´°¤ÇËöÈø¤Î / ¤ò¼«Æ°Åª¤ËÉÕ²Ã¤·¡¢¼¡¤ÎÊä´°¤ËÈ÷¤¨¤ë
setopt auto_param_slash

# ºÇ¸å¤¬¥Ç¥£¥ì¥¯¥È¥êÌ¾¤Ç½ª¤ï¤Ã¤Æ¤¤¤ë¾ì¹çËöÈø¤Î / ¤ò¼«Æ°Åª¤Ë¼è¤ê½ü¤¯
#setopt auto_remove_slash

# ¥µ¥¹¥Ú¥ó¥ÉÃæ¤Î¥×¥í¥»¥¹¤ÈÆ±¤¸¥³¥Þ¥ó¥ÉÌ¾¤ò¼Â¹Ô¤·¤¿¾ì¹ç¤Ï¥ê¥¸¥å¡¼¥à¤¹¤ë
setopt auto_resume

# ¥Ó¡¼¥×²»¤òÌÄ¤é¤µ¤Ê¤¤¤è¤¦¤Ë¤¹¤ë
setopt NO_beep

# {a-c} ¤ò a b c ¤ËÅ¸³«¤¹¤ëµ¡Ç½¤ò»È¤¨¤ë¤è¤¦¤Ë¤¹¤ë
setopt brace_ccl

# ÆâÉô¥³¥Þ¥ó¥É¤Î echo ¤ò BSD ¸ß´¹¤Ë¤¹¤ë
#setopt bsd_echo

# ¥·¥ó¥Ü¥ê¥Ã¥¯¥ê¥ó¥¯¤Ï¼ÂÂÎ¤òÄÉ¤¦¤è¤¦¤Ë¤Ê¤ë
#setopt chase_links

# ´ûÂ¸¤Î¥Õ¥¡¥¤¥ë¤ò¾å½ñ¤­¤·¤Ê¤¤¤è¤¦¤Ë¤¹¤ë
#setopt clobber

# ¥³¥Þ¥ó¥É¤Î¥¹¥Ú¥ë¥Á¥§¥Ã¥¯¤ò¤¹¤ë
setopt correct

# ¥³¥Þ¥ó¥É¥é¥¤¥óÁ´¤Æ¤Î¥¹¥Ú¥ë¥Á¥§¥Ã¥¯¤ò¤¹¤ë
#setopt correct_all

# =command ¤ò command ¤Î¥Ñ¥¹Ì¾¤ËÅ¸³«¤¹¤ë
setopt equals

# ¥Õ¥¡¥¤¥ëÌ¾¤Ç #, ~, ^ ¤Î 3 Ê¸»ú¤òÀµµ¬É½¸½¤È¤·¤Æ°·¤¦
setopt extended_glob

# zsh ¤Î³«»Ï¡¦½ªÎ»»þ¹ï¤ò¥Ò¥¹¥È¥ê¥Õ¥¡¥¤¥ë¤Ë½ñ¤­¹þ¤à
#setopt extended_history

# Ctrl+S/Ctrl+Q ¤Ë¤è¤ë¥Õ¥í¡¼À©¸æ¤ò»È¤ï¤Ê¤¤¤è¤¦¤Ë¤¹¤ë
setopt NO_flow_control

# ³Æ¥³¥Þ¥ó¥É¤¬¼Â¹Ô¤µ¤ì¤ë¤È¤­¤Ë¥Ñ¥¹¤ò¥Ï¥Ã¥·¥å¤ËÆþ¤ì¤ë
#setopt hash_cmds

# Ä¾Á°¤ÈÆ±¤¸¥³¥Þ¥ó¥É¥é¥¤¥ó¤Ï¥Ò¥¹¥È¥ê¤ËÄÉ²Ã¤·¤Ê¤¤
setopt hist_ignore_dups

# ¥³¥Þ¥ó¥É¥é¥¤¥ó¤ÎÀèÆ¬¤¬¥¹¥Ú¡¼¥¹¤Ç»Ï¤Þ¤ë¾ì¹ç¥Ò¥¹¥È¥ê¤ËÄÉ²Ã¤·¤Ê¤¤
setopt hist_ignore_space

# ¥Ò¥¹¥È¥ê¤ò¸Æ¤Ó½Ð¤·¤Æ¤«¤é¼Â¹Ô¤¹¤ë´Ö¤Ë°ìÃ¶ÊÔ½¸¤Ç¤­¤ë¾õÂÖ¤Ë¤Ê¤ë
setopt hist_verify

# ¥·¥§¥ë¤¬½ªÎ»¤·¤Æ¤âÎ¢¥¸¥ç¥Ö¤Ë HUP ¥·¥°¥Ê¥ë¤òÁ÷¤é¤Ê¤¤¤è¤¦¤Ë¤¹¤ë
setopt NO_hup

# Ctrl+D ¤Ç¤Ï½ªÎ»¤·¤Ê¤¤¤è¤¦¤Ë¤Ê¤ë¡Êexit, logout ¤Ê¤É¤ò»È¤¦¡Ë
setopt ignore_eof

# ¥³¥Þ¥ó¥É¥é¥¤¥ó¤Ç¤â # °Ê¹ß¤ò¥³¥á¥ó¥È¤È¸«¤Ê¤¹
setopt interactive_comments

# auto_list ¤ÎÊä´°¸õÊä°ìÍ÷¤Ç¡¢ls -F ¤Î¤è¤¦¤Ë¥Õ¥¡¥¤¥ë¤Î¼ïÊÌ¤ò¥Þ¡¼¥¯É½¼¨
setopt list_types

# ÆâÉô¥³¥Þ¥ó¥É jobs ¤Î½ÐÎÏ¤ò¥Ç¥Õ¥©¥ë¥È¤Ç jobs -l ¤Ë¤¹¤ë
setopt long_list_jobs

# ¥³¥Þ¥ó¥É¥é¥¤¥ó¤Î°ú¿ô¤Ç --prefix=/usr ¤Ê¤É¤Î = °Ê¹ß¤Ç¤âÊä´°¤Ç¤­¤ë
setopt magic_equal_subst

# ¥á¡¼¥ë¥¹¥×¡¼¥ë $MAIL ¤¬ÆÉ¤Þ¤ì¤Æ¤¤¤¿¤é¥ï¡¼¥Ë¥ó¥°¤òÉ½¼¨¤¹¤ë
#setopt mail_warning

# ¥Õ¥¡¥¤¥ëÌ¾¤ÎÅ¸³«¤Ç¥Ç¥£¥ì¥¯¥È¥ê¤Ë¥Þ¥Ã¥Á¤·¤¿¾ì¹çËöÈø¤Ë / ¤òÉÕ²Ã¤¹¤ë
setopt mark_dirs

# Êä´°¸õÊä¤¬Ê£¿ô¤¢¤ë»þ¡¢°ìÍ÷É½¼¨ (auto_list) ¤»¤º¡¢¤¹¤°¤ËºÇ½é¤Î¸õÊä¤òÊä´°¤¹¤ë
#setopt menu_complete

# Ê£¿ô¤Î¥ê¥À¥¤¥ì¥¯¥È¤ä¥Ñ¥¤¥×¤Ê¤É¡¢É¬Í×¤Ë±þ¤¸¤Æ tee ¤ä cat ¤Îµ¡Ç½¤¬»È¤ï¤ì¤ë
setopt multios

# ¥Õ¥¡¥¤¥ëÌ¾¤ÎÅ¸³«¤Ç¡¢¼­½ñ½ç¤Ç¤Ï¤Ê¤¯¿ôÃÍÅª¤Ë¥½¡¼¥È¤µ¤ì¤ë¤è¤¦¤Ë¤Ê¤ë
setopt numeric_glob_sort

# ¥³¥Þ¥ó¥ÉÌ¾¤Ë / ¤¬´Þ¤Þ¤ì¤Æ¤¤¤ë¤È¤­ PATH Ãæ¤Î¥µ¥Ö¥Ç¥£¥ì¥¯¥È¥ê¤òÃµ¤¹
#setopt path_dirs

# 8 ¥Ó¥Ã¥ÈÌÜ¤òÄÌ¤¹¤è¤¦¤Ë¤Ê¤ê¡¢ÆüËÜ¸ì¤Î¥Õ¥¡¥¤¥ëÌ¾¤Ê¤É¤ò¸«¤ì¤ë¤è¤¦¤Ë¤Ê¤ë
setopt print_eightbit

# Ìá¤êÃÍ¤¬ 0 °Ê³°¤Î¾ì¹ç½ªÎ»¥³¡¼¥É¤òÉ½¼¨¤¹¤ë
#setopt print_exit_value

# ¥Ç¥£¥ì¥¯¥È¥ê¥¹¥¿¥Ã¥¯¤ËÆ±¤¸¥Ç¥£¥ì¥¯¥È¥ê¤òÄÉ²Ã¤·¤Ê¤¤¤è¤¦¤Ë¤Ê¤ë
#setopt pushd_ignore_dups

# pushd ¤ò°ú¿ô¤Ê¤·¤Ç¼Â¹Ô¤·¤¿¾ì¹ç pushd $HOME ¤È¸«¤Ê¤µ¤ì¤ë
#setopt pushd_to_home

# rm * ¤Ê¤É¤ÎºÝ¡¢ËÜÅö¤ËÁ´¤Æ¤Î¥Õ¥¡¥¤¥ë¤ò¾Ã¤·¤ÆÎÉ¤¤¤«¤Î³ÎÇ§¤·¤Ê¤¤¤è¤¦¤Ë¤Ê¤ë
#setopt rm_star_silent

# rm_star_silent ¤ÎµÕ¤Ç¡¢10 ÉÃ´ÖÈ¿±þ¤·¤Ê¤¯¤Ê¤ê¡¢Æ¬¤òÎä¤Þ¤¹»þ´Ö¤¬Í¿¤¨¤é¤ì¤ë
#setopt rm_star_wait

# for, repeat, select, if, function ¤Ê¤É¤Ç´ÊÎ¬Ê¸Ë¡¤¬»È¤¨¤ë¤è¤¦¤Ë¤Ê¤ë
setopt short_loops

# ¥Ç¥Õ¥©¥ë¥È¤ÎÊ£¿ô¹Ô¥³¥Þ¥ó¥É¥é¥¤¥óÊÔ½¸¤Ç¤Ï¤Ê¤¯¡¢£±¹ÔÊÔ½¸¥â¡¼¥É¤Ë¤Ê¤ë
#setopt single_line_zle

# ¥³¥Þ¥ó¥É¥é¥¤¥ó¤¬¤É¤Î¤è¤¦¤ËÅ¸³«¤µ¤ì¼Â¹Ô¤µ¤ì¤¿¤«¤òÉ½¼¨¤¹¤ë¤è¤¦¤Ë¤Ê¤ë
#setopt xtrace

# ¿§¤ò»È¤¦
setopt prompt_subst

# ¥·¥§¥ë¤Î¥×¥í¥»¥¹¤´¤È¤ËÍúÎò¤ò¶¦Í­
setopt share_history

# history (fc -l) ¥³¥Þ¥ó¥É¤ò¥Ò¥¹¥È¥ê¥ê¥¹¥È¤«¤é¼è¤ê½ü¤¯¡£
setopt hist_no_store

# Ê¸»úÎóËöÈø¤Ë²þ¹Ô¥³¡¼¥É¤¬Ìµ¤¤¾ì¹ç¤Ç¤âÉ½¼¨¤¹¤ë
unsetopt promptcr

#¥³¥Ô¥Ú¤Î»þrprompt¤òÈóÉ½¼¨¤¹¤ë
setopt transient_rprompt

# cd -[tab] ¤Çpushd
setopt autopushd

autoload -U compinit
compinit
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: " 
#ÂçÊ¸»ú¾®Ê¸»úÌµ»ë¤·¤ÆÊä´°
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -e

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


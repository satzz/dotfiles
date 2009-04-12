source ~/.device.sh
[ -e "${HOME}/.ssh/agent-env" ] && . "${HOME}/.ssh/agent-env"
# Git branch on RPROMPT
# refs: http://www.jukie.net/~bart/blog/zsh-git-branch2
# refs: http://d.hatena.ne.jp/cooldaemon/20080516/1210909583
function git_branch() {
local branch

if test -z $(git rev-parse --git-dir 2> /dev/null); then
branch='---'
else
branch="${$(git symbolic-ref HEAD 2> /dev/null)#refs/heads/}"
fi

echo -n "($branch)"
}
RPROMPT='$(git_branch)'


export PATH=$HOME/.gem/ruby/1.8/bin:$HOME/bin:/opt/local/bin:$PATH:/usr/local/lib/gcc-lib:/usr/local/bin:/usr/local/mysql/bin
#’»þ’´Ö’Æâ’¤Ë’²¿’ÅÙKeychain’¤ò’¼Â’¹Ô’¤·’¤¿’¤«’¤Ë’´Ø’·¸’¤Ê’¤¯’¡¤30’Ê¬’¤Çssh-agent’¤¬’½ª’Î»’¤¹’¤ë’¤è’¤¦’¤Ë’¤Ê’¤ë
# keychain --timeout 1 ~/.ssh/id_dsa  # ’Èë’Ì©’¸°
# source ~/.keychain/$HOSTNAME-sh
# based by http://devel.aquahill.net/zsh/zshoptions

export EDITOR="vi"

# http://d.hatena.ne.jp/amt/20070423/MyPerlLikeMatch
my_perl_like_match() { # perl ’É÷’Àµ’µ¬’É½’¸½’¥Þ’¥Ã’¥Á
    if [ $# -ne 2 ] 		# ’°ú’¿ô’¤Î’¿ô’¤ò’¥Á’¥§’¥Ã’¥¯
	then echo "Usage:: \t% $0 'RegExp' value\t# RegExp need quotation."
	    echo "Example:: \t% $0 '/^FOO$/i' foo"
    fi
    local pattern=$1
    local value=$2

    if echo $value | perl -nle "exit(1) unless ${pattern}" &> /dev/null 
	then return 0 
    else return 1
    fi
}

# call API in outputz.com by zsh
# http://cucumber.g.hatena.ne.jp/tomisima/20081203/1228235994
preexec() {
    local command=${1}
    if [ $command ]; then
        if my_perl_like_match '/^ls/', $command; then
		    uri=http://ls.localhost/
        elif my_perl_like_match '/^vi/', $command; then
		    uri=http://vi.localhost/
        elif my_perl_like_match '/^echo/', $command; then
		    uri=http://echo.localhost/
        elif my_perl_like_match '/^top/', $command; then
		    uri=http://top.localhost/
        elif my_perl_like_match '/^ps/', $command; then
		    uri=http://ps.localhost/
        elif my_perl_like_match '/^(ptex|platex|dvi2ps|xdvi)/', $command; then
		    uri=http://tex.localhost/
        elif my_perl_like_match '/^ping/', $command; then
		    uri=http://ping.localhost/
        elif my_perl_like_match '/^ssh/', $command; then
		    uri=http://ssh.localhost/
        elif my_perl_like_match '/^sh/', $command; then
		    uri=http://sh.localhost/
        elif my_perl_like_match '/^bash/', $command; then
		    uri=http://bash.localhost/
        elif my_perl_like_match '/^cat/', $command; then
		    uri=http://cat.localhost/
        elif my_perl_like_match '/^less/', $command; then
		    uri=http://less.localhost/
        elif my_perl_like_match '/^head/', $command; then
		    uri=http://head.localhost/
        elif my_perl_like_match '/^tail/', $command; then
		    uri=http://tail.localhost/
        elif my_perl_like_match '/^more/', $command; then
		    uri=http://more.localhost/
        elif my_perl_like_match '/^source/', $command; then
		    uri=http://source.localhost/
        elif my_perl_like_match '/^(perl|cpan|prove)/', $command; then
		    uri=http://perl.localhost/
        elif my_perl_like_match '/^python/', $command; then
		    uri=http://python.localhost/
        elif my_perl_like_match '/^sed/', $command; then
		    uri=http://sed.localhost/
        elif my_perl_like_match '/^awk/', $command; then
		    uri=http://awk.localhost/
        elif my_perl_like_match '/^(gcc|gdb)/', $command; then
		    uri=http://c.localhost/
        elif my_perl_like_match '/^(ruby|rails|gem|rake)/', $command; then
		    uri=http://ruby.localhost/
        elif my_perl_like_match '/^gnuplot/', $command; then
		    uri=http://gnuplot.localhost/
        elif my_perl_like_match '/^wget/', $command; then
		    uri=http://wget.localhost/
        elif my_perl_like_match '/^touch/', $command; then
		    uri=http://touch.localhost/
        elif my_perl_like_match '/^mkdir/', $command; then
		    uri=http://mkdir.localhost/
        elif my_perl_like_match '/^rmdir/', $command; then
		    uri=http://rmdir.localhost/
        elif my_perl_like_match '/^rm/', $command; then
		    uri=http://rm.localhost/
        elif my_perl_like_match '/^mv/', $command; then
		    uri=http:/mv.localhost/
        elif my_perl_like_match '/^cp/', $command; then
		    uri=http:/cp.localhost/
        elif my_perl_like_match '/^cd/', $command; then
		    uri=http://cd.localhost/
        elif my_perl_like_match '/^sudo/', $command; then
		    uri=http://sudo.localhost/
        elif my_perl_like_match '/^which/', $command; then
		    uri=http://which.localhost/
        elif my_perl_like_match '/^where/', $command; then
		    uri=http://where.localhost/
        elif my_perl_like_match '/^kill/', $command; then
		    uri=http://kill.localhost/
        elif my_perl_like_match '/^mysql/', $command; then
		    uri=http://mysql.localhost/
        elif my_perl_like_match '/^git/', $command; then
		    uri=http://git.localhost/
        elif my_perl_like_match '/^tig/', $command; then
		    uri=http://tig.localhost/
        elif my_perl_like_match '/^termtter/', $command; then
		    uri=http://termtter.localhost/
        else
		    uri=http://zsh.localhost/
        fi

        key=`ruby -rubygems -e 'require "pit";print Pit.get("outputz.com")["key"]'`
        curl -s http://outputz.com/api/post -F key=${key} -F uri=${uri} -F size=${#1} >/dev/null
    fi
}



# ’Ê£’¿ô’¤Î zsh ’¤ò’Æ±’»þ’¤Ë’»È’¤¦’»þ’¤Ê’¤É history ’¥Õ’¥¡’¥¤’¥ë’¤Ë’¾å’½ñ’¤­’¤»’¤º’ÄÉ’²Ã’¤¹’¤ë
setopt append_history

# ’»Ø’Äê’¤·’¤¿’¥³’¥Þ’¥ó’¥É’Ì¾’¤¬’¤Ê’¤¯’¡¢’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’Ì¾’¤È’°ì’Ã×’¤·’¤¿’¾ì’¹ç cd ’¤¹’¤ë
setopt auto_cd

# ’Êä’´°’¸õ’Êä’¤¬’Ê£’¿ô’¤¢’¤ë’»þ’¤Ë’¡¢’°ì’Í÷’É½’¼¨’¤¹’¤ë
setopt auto_list

# ’Êä’´°’¥­’¡¼’¡ÊTab, Ctrl+I) ’¤ò’Ï¢’ÂÇ’¤¹’¤ë’¤À’¤±’¤Ç’½ç’¤Ë’Êä’´°’¸õ’Êä’¤ò’¼«’Æ°’¤Ç’Êä’´°’¤¹’¤ë
setopt auto_menu

# ’¥«’¥Ã’¥³’¤Î’ÂÐ’±þ’¤Ê’¤É’¤ò’¼«’Æ°’Åª’¤Ë’Êä’´°’¤¹’¤ë
setopt auto_param_keys

# ’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’Ì¾’¤Î’Êä’´°’¤Ç’Ëö’Èø’¤Î / ’¤ò’¼«’Æ°’Åª’¤Ë’ÉÕ’²Ã’¤·’¡¢’¼¡’¤Î’Êä’´°’¤Ë’È÷’¤¨’¤ë
setopt auto_param_slash

# ’ºÇ’¸å’¤¬’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’Ì¾’¤Ç’½ª’¤ï’¤Ã’¤Æ’¤¤’¤ë’¾ì’¹ç’Ëö’Èø’¤Î / ’¤ò’¼«’Æ°’Åª’¤Ë’¼è’¤ê’½ü’¤¯
#setopt auto_remove_slash

# ’¥µ’¥¹’¥Ú’¥ó’¥É’Ãæ’¤Î’¥×’¥í’¥»’¥¹’¤È’Æ±’¤¸’¥³’¥Þ’¥ó’¥É’Ì¾’¤ò’¼Â’¹Ô’¤·’¤¿’¾ì’¹ç’¤Ï’¥ê’¥¸’¥å’¡¼’¥à’¤¹’¤ë
setopt auto_resume

# ’¥Ó’¡¼’¥×’²»’¤ò’ÌÄ’¤é’¤µ’¤Ê’¤¤’¤è’¤¦’¤Ë’¤¹’¤ë
setopt NO_beep

# {a-c} ’¤ò a b c ’¤Ë’Å¸’³«’¤¹’¤ë’µ¡’Ç½’¤ò’»È’¤¨’¤ë’¤è’¤¦’¤Ë’¤¹’¤ë
setopt brace_ccl

# ’Æâ’Éô’¥³’¥Þ’¥ó’¥É’¤Î echo ’¤ò BSD ’¸ß’´¹’¤Ë’¤¹’¤ë
#setopt bsd_echo

# ’¥·’¥ó’¥Ü’¥ê’¥Ã’¥¯’¥ê’¥ó’¥¯’¤Ï’¼Â’ÂÎ’¤ò’ÄÉ’¤¦’¤è’¤¦’¤Ë’¤Ê’¤ë
#setopt chase_links

# ’´û’Â¸’¤Î’¥Õ’¥¡’¥¤’¥ë’¤ò’¾å’½ñ’¤­’¤·’¤Ê’¤¤’¤è’¤¦’¤Ë’¤¹’¤ë
#setopt clobber

# ’¥³’¥Þ’¥ó’¥É’¤Î’¥¹’¥Ú’¥ë’¥Á’¥§’¥Ã’¥¯’¤ò’¤¹’¤ë
setopt correct

# ’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’Á´’¤Æ’¤Î’¥¹’¥Ú’¥ë’¥Á’¥§’¥Ã’¥¯’¤ò’¤¹’¤ë
#setopt correct_all

# =command ’¤ò command ’¤Î’¥Ñ’¥¹’Ì¾’¤Ë’Å¸’³«’¤¹’¤ë
setopt equals

# ’¥Õ’¥¡’¥¤’¥ë’Ì¾’¤Ç #, ~, ^ ’¤Î 3 ’Ê¸’»ú’¤ò’Àµ’µ¬’É½’¸½’¤È’¤·’¤Æ’°·’¤¦
setopt extended_glob

# zsh ’¤Î’³«’»Ï’¡¦’½ª’Î»’»þ’¹ï’¤ò’¥Ò’¥¹’¥È’¥ê’¥Õ’¥¡’¥¤’¥ë’¤Ë’½ñ’¤­’¹þ’¤à
#setopt extended_history

# Ctrl+S/Ctrl+Q ’¤Ë’¤è’¤ë’¥Õ’¥í’¡¼’À©’¸æ’¤ò’»È’¤ï’¤Ê’¤¤’¤è’¤¦’¤Ë’¤¹’¤ë
setopt NO_flow_control

# ’³Æ’¥³’¥Þ’¥ó’¥É’¤¬’¼Â’¹Ô’¤µ’¤ì’¤ë’¤È’¤­’¤Ë’¥Ñ’¥¹’¤ò’¥Ï’¥Ã’¥·’¥å’¤Ë’Æþ’¤ì’¤ë
#setopt hash_cmds

# ’Ä¾’Á°’¤È’Æ±’¤¸’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’¤Ï’¥Ò’¥¹’¥È’¥ê’¤Ë’ÄÉ’²Ã’¤·’¤Ê’¤¤
setopt hist_ignore_dups

# ’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’¤Î’Àè’Æ¬’¤¬’¥¹’¥Ú’¡¼’¥¹’¤Ç’»Ï’¤Þ’¤ë’¾ì’¹ç’¥Ò’¥¹’¥È’¥ê’¤Ë’ÄÉ’²Ã’¤·’¤Ê’¤¤
setopt hist_ignore_space

# ’¥Ò’¥¹’¥È’¥ê’¤ò’¸Æ’¤Ó’½Ð’¤·’¤Æ’¤«’¤é’¼Â’¹Ô’¤¹’¤ë’´Ö’¤Ë’°ì’Ã¶’ÊÔ’½¸’¤Ç’¤­’¤ë’¾õ’ÂÖ’¤Ë’¤Ê’¤ë
setopt hist_verify

# ’¥·’¥§’¥ë’¤¬’½ª’Î»’¤·’¤Æ’¤â’Î¢’¥¸’¥ç’¥Ö’¤Ë HUP ’¥·’¥°’¥Ê’¥ë’¤ò’Á÷’¤é’¤Ê’¤¤’¤è’¤¦’¤Ë’¤¹’¤ë
setopt NO_hup

# Ctrl+D ’¤Ç’¤Ï’½ª’Î»’¤·’¤Ê’¤¤’¤è’¤¦’¤Ë’¤Ê’¤ë’¡Êexit, logout ’¤Ê’¤É’¤ò’»È’¤¦’¡Ë
setopt ignore_eof

# ’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’¤Ç’¤â # ’°Ê’¹ß’¤ò’¥³’¥á’¥ó’¥È’¤È’¸«’¤Ê’¤¹
setopt interactive_comments

# auto_list ’¤Î’Êä’´°’¸õ’Êä’°ì’Í÷’¤Ç’¡¢ls -F ’¤Î’¤è’¤¦’¤Ë’¥Õ’¥¡’¥¤’¥ë’¤Î’¼ï’ÊÌ’¤ò’¥Þ’¡¼’¥¯’É½’¼¨
setopt list_types

# ’Æâ’Éô’¥³’¥Þ’¥ó’¥É jobs ’¤Î’½Ð’ÎÏ’¤ò’¥Ç’¥Õ’¥©’¥ë’¥È’¤Ç jobs -l ’¤Ë’¤¹’¤ë
setopt long_list_jobs

# ’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’¤Î’°ú’¿ô’¤Ç --prefix=/usr ’¤Ê’¤É’¤Î = ’°Ê’¹ß’¤Ç’¤â’Êä’´°’¤Ç’¤­’¤ë
setopt magic_equal_subst

# ’¥á’¡¼’¥ë’¥¹’¥×’¡¼’¥ë $MAIL ’¤¬’ÆÉ’¤Þ’¤ì’¤Æ’¤¤’¤¿’¤é’¥ï’¡¼’¥Ë’¥ó’¥°’¤ò’É½’¼¨’¤¹’¤ë
#setopt mail_warning

# ’¥Õ’¥¡’¥¤’¥ë’Ì¾’¤Î’Å¸’³«’¤Ç’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’¤Ë’¥Þ’¥Ã’¥Á’¤·’¤¿’¾ì’¹ç’Ëö’Èø’¤Ë / ’¤ò’ÉÕ’²Ã’¤¹’¤ë
setopt mark_dirs

# ’Êä’´°’¸õ’Êä’¤¬’Ê£’¿ô’¤¢’¤ë’»þ’¡¢’°ì’Í÷’É½’¼¨ (auto_list) ’¤»’¤º’¡¢’¤¹’¤°’¤Ë’ºÇ’½é’¤Î’¸õ’Êä’¤ò’Êä’´°’¤¹’¤ë
#setopt menu_complete

# ’Ê£’¿ô’¤Î’¥ê’¥À’¥¤’¥ì’¥¯’¥È’¤ä’¥Ñ’¥¤’¥×’¤Ê’¤É’¡¢’É¬’Í×’¤Ë’±þ’¤¸’¤Æ tee ’¤ä cat ’¤Î’µ¡’Ç½’¤¬’»È’¤ï’¤ì’¤ë
setopt multios

# ’¥Õ’¥¡’¥¤’¥ë’Ì¾’¤Î’Å¸’³«’¤Ç’¡¢’¼­’½ñ’½ç’¤Ç’¤Ï’¤Ê’¤¯’¿ô’ÃÍ’Åª’¤Ë’¥½’¡¼’¥È’¤µ’¤ì’¤ë’¤è’¤¦’¤Ë’¤Ê’¤ë
setopt numeric_glob_sort

# ’¥³’¥Þ’¥ó’¥É’Ì¾’¤Ë / ’¤¬’´Þ’¤Þ’¤ì’¤Æ’¤¤’¤ë’¤È’¤­ PATH ’Ãæ’¤Î’¥µ’¥Ö’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’¤ò’Ãµ’¤¹
#setopt path_dirs

# 8 ’¥Ó’¥Ã’¥È’ÌÜ’¤ò’ÄÌ’¤¹’¤è’¤¦’¤Ë’¤Ê’¤ê’¡¢’Æü’ËÜ’¸ì’¤Î’¥Õ’¥¡’¥¤’¥ë’Ì¾’¤Ê’¤É’¤ò’¸«’¤ì’¤ë’¤è’¤¦’¤Ë’¤Ê’¤ë
setopt print_eightbit

# ’Ìá’¤ê’ÃÍ’¤¬ 0 ’°Ê’³°’¤Î’¾ì’¹ç’½ª’Î»’¥³’¡¼’¥É’¤ò’É½’¼¨’¤¹’¤ë
#setopt print_exit_value

# ’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’¥¹’¥¿’¥Ã’¥¯’¤Ë’Æ±’¤¸’¥Ç’¥£’¥ì’¥¯’¥È’¥ê’¤ò’ÄÉ’²Ã’¤·’¤Ê’¤¤’¤è’¤¦’¤Ë’¤Ê’¤ë
#setopt pushd_ignore_dups

# pushd ’¤ò’°ú’¿ô’¤Ê’¤·’¤Ç’¼Â’¹Ô’¤·’¤¿’¾ì’¹ç pushd $HOME ’¤È’¸«’¤Ê’¤µ’¤ì’¤ë
#setopt pushd_to_home

# rm * ’¤Ê’¤É’¤Î’ºÝ’¡¢’ËÜ’Åö’¤Ë’Á´’¤Æ’¤Î’¥Õ’¥¡’¥¤’¥ë’¤ò’¾Ã’¤·’¤Æ’ÎÉ’¤¤’¤«’¤Î’³Î’Ç§’¤·’¤Ê’¤¤’¤è’¤¦’¤Ë’¤Ê’¤ë
#setopt rm_star_silent

# rm_star_silent ’¤Î’µÕ’¤Ç’¡¢10 ’ÉÃ’´Ö’È¿’±þ’¤·’¤Ê’¤¯’¤Ê’¤ê’¡¢’Æ¬’¤ò’Îä’¤Þ’¤¹’»þ’´Ö’¤¬’Í¿’¤¨’¤é’¤ì’¤ë
#setopt rm_star_wait

# for, repeat, select, if, function ’¤Ê’¤É’¤Ç’´Ê’Î¬’Ê¸’Ë¡’¤¬’»È’¤¨’¤ë’¤è’¤¦’¤Ë’¤Ê’¤ë
setopt short_loops

# ’¥Ç’¥Õ’¥©’¥ë’¥È’¤Î’Ê£’¿ô’¹Ô’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’ÊÔ’½¸’¤Ç’¤Ï’¤Ê’¤¯’¡¢’£±’¹Ô’ÊÔ’½¸’¥â’¡¼’¥É’¤Ë’¤Ê’¤ë
#setopt single_line_zle

# ’¥³’¥Þ’¥ó’¥É’¥é’¥¤’¥ó’¤¬’¤É’¤Î’¤è’¤¦’¤Ë’Å¸’³«’¤µ’¤ì’¼Â’¹Ô’¤µ’¤ì’¤¿’¤«’¤ò’É½’¼¨’¤¹’¤ë’¤è’¤¦’¤Ë’¤Ê’¤ë
#setopt xtrace

# ’¿§’¤ò’»È’¤¦
setopt prompt_subst

# ’¥·’¥§’¥ë’¤Î’¥×’¥í’¥»’¥¹’¤´’¤È’¤Ë’Íú’Îò’¤ò’¶¦’Í­
setopt share_history

# history (fc -l) ’¥³’¥Þ’¥ó’¥É’¤ò’¥Ò’¥¹’¥È’¥ê’¥ê’¥¹’¥È’¤«’¤é’¼è’¤ê’½ü’¤¯’¡£
setopt hist_no_store

# ’Ê¸’»ú’Îó’Ëö’Èø’¤Ë’²þ’¹Ô’¥³’¡¼’¥É’¤¬’Ìµ’¤¤’¾ì’¹ç’¤Ç’¤â’É½’¼¨’¤¹’¤ë
unsetopt promptcr

#’¥³’¥Ô’¥Ú’¤Î’»þrprompt’¤ò’Èó’É½’¼¨’¤¹’¤ë
setopt transient_rprompt

# cd -[tab] ’¤Çpushd
setopt autopushd

autoload -U compinit
compinit
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: " 
#’Âç’Ê¸’»ú’¾®’Ê¸’»ú’Ìµ’»ë’¤·’¤Æ’Êä’´°
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


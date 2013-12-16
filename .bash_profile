function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\[\033[33m\]\u:\[\033[36m\]\w\[\033[32m\]$(parse_git_branch)\[\033[35m\]\$ '

export PATH=/usr/local/bin:~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/apache-ant-1.8.0/bin:/etc/apache2:/Users/jaredmoran/node_modules/less/bin:/Applications/Postgres.app/Contents/MacOS/bin:~/utils/android-sdk-macosx/platform-tools/:$PATH
export APACHE_HOME=/etc/apache2
export MANPATH=/usr/local/man

alias startnginx='sudo /usr/local/nginx/sbin/nginx'

alias mysqlstart='sudo /usr/local/mysql/bin/mysqld_safe &' 
alias mysqlstop='/usr/local/mysql/bin/mysqladmin -u root -p shutdown'

alias ssh-interface=~/bin/ssh-interface.sh

alias mysqldump-interface=~/bin/mysqldump-interface.sh

alias sync-assets=~/bin/sync-assets.sh

alias android-debug='adb forward tcp:9222 localabstract:chrome_devtools_remote'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -r /sw/bin/init.sh && . /sw/bin/init.sh

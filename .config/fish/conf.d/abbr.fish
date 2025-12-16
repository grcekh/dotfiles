set -q MY_ABBRS_INITIALIZED; and return

#
# Commands
#

abbr -a -- c clear
abbr -a -- h history
abbr -a -- nv nvim
abbr -a -- pn pnpm

abbr -a -- l 'ls -A'
abbr -a -- la 'ls -lAUF'
abbr -a -- ll 'ls -lGFh'

#
# Navigation
#

abbr -a -- - 'cd -'
abbr -a -- dev 'cd ~/Developer'
abbr -a -- dot 'cd ~/dotfiles'
abbr -a -- pkm 'cd ~/pkm'

abbr -a dotdot --regex '^\.\.+$' --function multicd

#
# Git
#

# https://github.com/lewisacidic/fish-git-abbr
abbr g 'git'
abbr gi 'git init'
abbr gcf 'git config --list'
abbr gcount 'git shortlog -sn'

# ga: git add
abbr ga 'git add'
abbr gaa 'git add --all'

# gc: git commit
abbr gca 'git commit -a -v'
abbr gcm 'git commit -m'

# gb: git branch
abbr gb 'git branch'

# gbl: git blame
abbr gbl 'git blame -b -w'

# gco: git checkout
abbr gco 'git checkout'
abbr gcob 'git checkout -b'
abbr gcom 'git checkout (git_main_branch)'

# gl: git log
abbr gl 'git log'
abbr gls 'git log --stat'
abbr glsp 'git log --stat -p'
abbr glg 'git log --graph'
abbr glgda 'git log --graph --decorate --all'
abbr glgm 'git log --graph --max-count=10'
abbr glo 'git log --oneline --decorate'
abbr glog 'git log --oneline --decorate --graph'
abbr gloga 'git log --oneline --decorate --graph --all'

# gd: git diff
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr gdcw 'git diff --cached --word-diff'
abbr gdcs 'git diff --staged'

# gf: git fetch
abbr gf 'git fetch'
abbr gfa 'git fetch --all --prune'
abbr gfo 'git fetch origin'

# grm: git rm
abbr grm 'git rm'
abbr grmc 'git rm --cached'

# gp: git push
abbr gp 'git push'
abbr gpsu 'git push --set-upstream origin (git_current_branch)'

# gpl: git pull
abbr gpl 'git pull'
abbr gplo 'git pull origin'
abbr gplom 'git pull origin (git_main_branch)'
abbr gplu 'git pull upstream'
abbr gplum 'git pull upstream (git_main_branch)'

# grst: git restore
abbr grst 'git restore'
abbr grsts 'git restore --source'
abbr grstst 'git restore --staged'

# gs: git status
abbr gs 'git status'
abbr gss 'git status -s'

# gst: git stash
abbr gst 'git stash'
abbr gsta 'git stash apply'
abbr gstc 'git stash clear'
abbr gstd 'git stash drop'
abbr gstl 'git stash list'
abbr gstp 'git stash pop'
abbr gstshow 'git stash show --text'
abbr gstall 'git stash --all'
abbr gsts 'git stash save'

# gwch: git whatchanged
abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

set -g MY_ABBRS_INITIALIZED true

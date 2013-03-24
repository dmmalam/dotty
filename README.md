# Dotty #

## What ##
A set of sane, fast and heavily documented dotfiles & settings for OSX (Mountain Lion) and Ubuntu (Debian).

## Why ##
Have consistent, up-to-date sane settings for each dev machine. Many cool tricks collected overs years of hacking.

## Features ##
### Sane RC files for ###
* ack
* ctags
* editrc
* inputrc
* tmux
* htop
* top (Linux only)

### ZSHRC ###
* Starts in about 0.05s (try `bench`)
* History substring search
* Syntax highlighting
* Put your personal customizations in $ZSH/zcustom.zsh.
* compile zcompdump if completion has changed
* print a funny message via cowsay in color!
* consistent use of xoria256 (or similar) color scheme

#### Exports ####
* DOTTY = dir where dotty is cloned
* DOTTY_VAR = dir where log/swap files should be stored, defaults to $DOTTY/var
* ZSH = dir where zsh scripts are, defaults to $DOTTY/zsh
* PATH is setup using path_helper on OSX. You need to edit `/etc/paths` so that `/usr/local/bin` is first. Otherwise, ~/.bin:/usr/local/bin:/usr/local/sbin is pre-appended to the existing PATH
~/.bin is installed by default and can includes custom binaries.
* LC_CTYPE=$LANG, this avoids certain compilation failures.
* EDITOR = `vim`, change if needed.
* PAGER is set to `most` if installed, otherwise `less`.
* LS COLORS for BSD or GNU
* For speed, only $ZSH/completions & $ZSH/functions are added to fpath. Symlink any needed completions from $ZSH/vendor/zsh-completions into $ZSH/completions, or add any custom functions to $ZSH/functions.

#### Functions ####
* `extract`: Extract any archive, aliased to x
* `spectrum_ls`: print terminals colour reference
* FG,BG,FX are variables to easily reference colours
* zmv is auto-loaded (http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-zmv)

#### Keybindings ####
* Use included Terminal.app settings, or make sure terminals sends correct codes.
* Use emacs keybinding, because in terminal you are mostly entering, not editing.
* ^[ to copy previous word
* Home (^[[1~), End (^[[4~), Backspace (^?), Shift-Tab (^[[Z), Alt+Left (^[f) /Right (^[b]), PageUp (^[[5~) / PageDown (^[[6~) do sane things.

#### Aliass ####
Try to use mnemonics, avoid common typos, and set common options.

* c = cat
* m = pager
* e = editor
* h = run-help
* cls = clear, also ^L
* history = fc -l 1
* _ = sudo
* p = pwd
* ... expands to ../.., repeatedly
* pu = pushd
* po = popd
* get = curl --continue-at - --location --progress-bar --remote-name --remote-time
* vless = vim in pager mode, good for code
* g = git
* chat = weechat-curses

Correct typos
* cd/ = cd /
* sl =ls

Use nocorrect on
* cp
* mv
* touch
* man
* mkdir
* curl
* git

ZSHs Global aliass eg, `cat file H`
* H = | head
* EH = |& head (pipe stderr into head)
* M = | PAGER
* EM = |& PAGER
* G = | grep
* T = | tail
* ET = |& tail
* TEE = | tee
* F = | fmt -
* W = | wc -l
* S = | sort
* X = | xargs
* NUL = > /dev/null 2>&1

* ls = has color and classify type options
* l = ls
* la = also show all but . or ..
* ll = also long format, show extented attrs, human reasable sizes, show acls
* ll! = reverse alphabetical sort
* llr = recurse sub dirs
* llsize = as ll but sort by size descending
* llsize! = as ll but sort by size ascending
* lltime = as ll but sort by time newest first
* lltime! = as ll but sort by time oldest first
* llaccess = as ll but sort by last access newest first
* llaccess! = as ll but sort by last oldest first
* llcreation = as ll but sort by creation newest first
* llcreation! = as ll sort by creation oldest first
* d = dirs -v
* 1..9 = cd num in stack
* remove = rm -vrf
* md = mkdir = mkdir -vp
* mcd = mkdir and cd into it
* cp = cp -vai, verbose, preserve attributes, recurse, prompt on overwrite 
* cpr = rsync based robust copy
* mv= mv -vi, verbose, prompt on overwrite
* chmod = chmod -v, verbose
* chown = chown -v,  verbose
* chownr = chown -vr, verbose, recurse
* df = df -ahi,  all, human readable sizes, inode stats
* du= du -h, human readable sizes
* ln= ln -iv,  verbose, prompt on overwrite
* lns= ln -ivs, verbose, prompt on overwrite, symbolic
* wh = which = nocorrect which -a'    # all

suffix, eg `file.tex` -> `vim file.tex`
* tex = vim

hashes, eg `cd ~dir` ->`cd /path/to/dir` 
* dotty = $DOTTY

#### Theme ####
* Collapse working dir like fish, to save space
* Version control status via ZSH builtin `vcs_info`, notifications for dirty, (un)staged, git/hg/bzr/svn.
* Notification for background jobs
* Notification for command that return non zero (ie error) codes
* Time in secs on right, so can scroll history and see approx length 
* ZSH history substring match
* ZSH syntax highlighting
* Left prompt = <collapsed dir> < ❯ or ♛) (root) > <vc status>
* Right prompt = <num jobs> < return status if not 0> <HH:MM:SS>

### VIMRC ###
* Vundle with a set of plugins
* Proxy icon

### Git ###
Add user info with
`git config --global user.name <name>
 git config --global user.email <email>`

Add github user with
`  git config --global github.user <username>
   git config --global github.password <password>`

* Typical global git ignores
* VIM as diff/merge tool

Mnemonic git alias
* h = help
* p = pull
* a = add -vu
* m = merge
* ca = commit -a
* cam = commit -am
* cm = commit -m
* co = checkout
* nb = checkout -b
* b = branch
* bd = branch -d
* bD = branch -D
* br = branch --remote
* bm = branch -m
* st = status
* s = status -sb
* l = log --oneline --decorate --graph
* tip = log -n 1
* last = log -n 10 --oneline
* d = diff master
* d2 = diff HEAD@{1} HEAD@{0}
* dt = difftool
* mt = mergetool
* r =rebase
* ra = rebase --abort
* rc = rebase --continue
* rs = rebase --skip
* cp = cherry-pick -x
* t = tag -n1 -l
* rwt = reset --hard HEAD # revert working tree
* unci = reset --hard HEAD^ # uncommit
* sup = submodule foreach --recursive git pull origin master
* sadd = submodule add
* forget = rm --cached
* l50, l80, lg50, lg80 = pretty logs

### SSH ###
* Added to gitignore to accidentally commit keys
* You should have a private/public keypair WITY a passphrase
** `ssh-keygen -t rsa -C "your_email@youremail.com"``
* Remember to add SSH key to OSX keychain
** `ssh-add -K`
### Grep ###
* Export GREP_OPTIONS for colour

### grc ###
aliases set for 
* colorify = grc -es --colour=auto
* configure
* diff
* wdiff
* make
* gcc
* g++
* as
* ld
* netstat
* ping
* last
* traceroute
* rsync (grc file included)
* cowsay (grc file included)

### Sublime Text ###
* nocorrect alias to subl
* subl with no params opens current dir
* set of packages

### htop ###
* alias to t
* alias tcpu = sort by CPU
* alias tmem = sort by Mem
* alias ttime = sore by CPU time

### Java ###
* Sets JAVA\_HOME to /usr/libexec/java_home, so can set your default java version via the system 'Java Preferences'. 

Recommend install Oracle Java 7 (or OpenJDK) and move to top.

### Ruby ###
* RC files for
** irb
** gem
* Unrolled rbenv config, avoiding an eval, and a removes expensive `rbenv rehash`
* gem is a function that post appends `rbenv rehash`, so the expensive hashing rbenv only runs when needed, and not every login.

### Node ###
* RC files for
** jitsu
** npm
** npmignore

* Completions for 
** jake
** cake
** npm (unrolled so faster to load)
** npm bin (/usr/local/share/npm/bin) is pre-appened to path

### Python ###
* /usr/local/share/python is pre-appened to path
* PYTHONPATH is adjusted correctly
* PYTHONSTARTUP=$DOTTY/pythonstartup
* pipu is aliased to `pip install --upgrade pip distribute`

### R ###
* disable zsh builtin r command
* RProfile to save history

### Go ###
* GOPATH set

### MacOSX ###
* rmtrash: if installed, aliased to `del`. This uses the system trash for all deleted files. By default it is verbose, and removes directory trees.
* ps = ps avf # all processes with controlling term, stats
* psa =ps -Avf # all, stats
* o = open, or open . if no params
* ql = quicklook
* rm-osx = remove .DS_STORE and __MACOSX_ files recursively
* pman = open man page in preview
* Set proxy title for terminal.app, even via tmux/screenw
* vol = get/set volume
* If GNU coreutils are installed, then GNU versions of ls aliases  above are also created with the g prefix, eg `glltime!`

* HomeBrew
** export HOMEBREW_VERBOSE = 1
** export HOMEBREW_CC = clang
** aliased to b
** bi = brew info
** big = brew info --github 
** bs = brew search
** bu = brew update && brew upgrade && brew cleanup --force -s
** brews = brew list
** ~prefix is hashed to brew --prefix
** Command not found script, display message if a command is not found, but a brew exists.

#### Debian (Ubuntu) ####
* rm = rm -vd, verbose, recurse, prompt for silly
* ps = ps avf, all process with term, virtual mem, ascii art forest
* psa = ps -A vf, all, virtual mem, ascii art forest
* free = free -tm, totals, in MBs
* ag = apt-get -y, assume yes
* at = aptitude -y, assume yes
* agu= apt-get update && apt-get upgrade
* source command not found for apt-get

## Install ##
### 1. Requires script (require.sh) ###
`make requires`
Installs needed dependencies for Mac via homebrew or Ubuntu via apt, Installs newer versions of some built-ins for OSX. I would recommend customizing this file before running.

### 2. Mouse ###
For mouse support (for switching panes and windows) for Terminal.app (iTerm has mouse support)
* Install http://www.culater.net/software/SIMBL/SIMBL.php
* Then install https://bitheap.org/mouseterm/

### 3. Clone ###
* Fork repo.
* Clone repo to to your machine
`git clone git://github.com/dmmalam/dotty.git`
* Update submodules to get zsh vendor files
`make init`

* Edit $zsh/zshrc line 6 to where dotty is cloned
  eg `export DOTTY="$HOME/code/dotty"`

* Add any customizations to $ZSH/zcustom.zsh

* Symlink into $ZSH/completions anything you need from
$ZSH/vendor/zsh-completions.
`cd zsh/completions
ln -s ../vendor/zsh-completions/XXX .`

* zsh/functions holds autoloaded shell functions. Add any custom functions here.

* Run install
This works by symlinking each file into ~/
It will try to copy existing files to x.org.
`make install`

## TODO ##
### ZSH ###
* zcompile main file?
* weird auto complete for `~code<tab>`
* ubuntu terminal title
* ubuntu JAVA_HOME()?
* should we edit /etc/paths??
*
  # TODO: Should this be in ~launchd.conf
  # Set environment variables for launchd processes.
  # if [[ "$OSTYPE" == darwin* ]]; then
  #   for env_var in PATH MANPATH; do
  #     launchctl setenv "$env_var" "${(P)env_var}"
  #   done
  # fi

### MOST ###
* proxy icon
* Scrolling via mouse

### LESS ###
* icon
* colours

## Thanks ##
Large parts are unashamedly copied from

* [prezto](https://github.com/sorin-ionescu/prezto)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Steve Losh](https://github.com/sjl/dotfiles)
* [Mathias Byens](https://github.com/mathiasbynens/dotfiles/)
* [spf13](https://github.com/spf13/spf13-vim)
* [Milo Mouse](https://github.com/milomouse/dotfiles/)

## License ##
MIT

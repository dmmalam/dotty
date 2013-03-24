#!/bin/sh
# © 2013 D MALAM
# Dotty Install required programs

if [ $(uname) == Darwin ]; then
    # Install hombrew.
    if [ ! -x `"which" brew` ]; then
        ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    fi

    # Refresh & update core.
    brew update
    brew upgrade

    # Install base packages.
    brew install git --with-blk-sha1
    brew install aspell --with-lang=en
    brew install weechat --aspell --perl --python
    brew install ack            \
                 bash           \
                 coreutils      \
                 cowsay         \
                 curl           \
                 ctags          \
                 findutils      \
                 fortune        \
                 gawk           \
                 grc            \
                 htop-osx       \
                 mercuial       \
                 most           \
                 nmap           \
                 reattach-to-user-namespace \
                 remameutils    \
                 rename         \
                 rmtrash        \
                 tig            \
                 tmux           \
                 tree           \
                 watch          \
                 zsh

    # Install wget with IRI support.
    brew install wget --enable-iri

    # Install more recent versions of some OS X tools.
    brew tap homebrew/dupes
    brew install homebrew/dupes/grep
    brew install homebrew/dupes/diffutils
    brew install homebrew/dupes/file
    brew install homebrew/dupes/less
    brew install homebrew/dupes/lsof
    brew install homebrew/dupes/nano
    brew install homebrew/dupes/perl --use-threads
    brew install homebrew/dupes/rsync
    brew install homebrew/dupes/tcpdump
    brew install homebrew/dupes/tidy

    # Install extras
    brew install aircrack-ng
                 avidemux       \
                 contacts       \
                 despotify      \
                 dcraw          \
                 ec2-ami-tools  \
                 ec2-api-tools  \
                 emacs          \
                 exiftool       \
                 ffmpeg         \
                 ghostscript    \
                 gibo           \
                 gist           \
                 git-extras     \
                 graphicsmagick \
                 hub            \
                 imagesnap      \
                 iftop          \
                 libidn         \
                 macvim         \
                 mercurial      \
                 midnight-commander
                 mmv            \
                 multitail      \
                 ncrack         \
                 netcat         \
                 pstree         \
                 ranger         \
                 rlwrap         \
                 siege          \
                 tcptraceroute  \
                 the_silver_searcher \
                 transmission   \
                 ufraw          \
                 wdiff

    # Install ruby via rbenv / ruby-build
    brew install rbenv ruby-build
    rbenv install 1.9.3-p194
    rbenv global 1.9.3-p194
    rbenv rehash
    ## Update rubygems
    gem update --system
    gem update
    gem install ap              \
                CoffeTags       \
                crack           \
                ghi             \
                heroku          \
                hirb            \
                interactive_editor \
                lunchy          \
                net-http-spy    \
                rails           \
                vmail           \
                wirble


    # Install python 2.7 with dtrace
    brew install python --with-dtrace --framework
    /usr/local/share/python/pip install --upgrade distribute
    /usr/local/share/python/pip install --upgrade pip

    # Install node
    brew install node
    npm install -g coffee-script    \
                   csslint          \
                   coffeelint       \
                   jake             \
                   jitsu            \
                   jshint           \
                   jsonlint         \
                   police           \
                   repl.history     \
                   typescript       \
                   ultra-repl

    # Install R
    brew install gfortran r
    sudo ln -s "/usr/local/Cellar/r/2.15.3/R.framework" /Library/Frameworks

    # Install Go
    # brew install go
    # mkdir /usr/local/share/go

    # Install DBs
    brew install redis
    brew install mysql
    brew install postgres --enable-dtrace

    # Cleanup
    brew linkapps
    brew cleanup

# FIXME: Actually test for debian like distros
elif [ $(lsb_release -is) == Ubuntu ]; then
    sudo apt-get update
    sudo apt-get install -y ack         \
                            curl        \
                            git         \
                            grc         \
                            mercuial    \
                            links       \
                            most        \
                            nmap        \
                            tig         \
                            tmux        \
                            tree        \
                            weechat     \
                            wget        \
                            zsh
    # Install extras
    sudo apt-get install -y ghostscript

fi

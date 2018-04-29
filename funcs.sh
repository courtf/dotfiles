#!/usr/bin/env bash

curltime () {
    curl -o /dev/null -D - -w 'appconn: %{time_appconnect}\nconnect: %{time_connect}\ndnslook: %{time_namelookup}\npretran: %{time_pretransfer}\nredirec: %{time_redirect}\nstarttr: %{time_starttransfer}\n  TOTAL: %{time_total}\n' $1
}

b642hex () {
    echo $1 | base64 --decode | xxd -c 256 -p
}

xfcpy () {
    cat $1 | xclip -selection clipboard
}

xfpst () {
    xclip -selection clipboard -o > $1
}

# a function for setting up Go, pass a git tagname to specify Go's version
install_go() {
    deftag='go1.10.1'

    gotag="$1"
    if [ -z "$gotag" ]; then
        gotag="$deftag"
    fi

    mkdir ~/go
    # go1.4 is required to compile the compilers/assemblers/linkers for >=go1.5
    mkdir ~/go1.9temp

    tarfile="go1.9.darwin-amd64.tar.gz"
    curl https://dl.google.com/go/"$tarfile" > "$tarfile" &&
    tar -C ~/go1.9temp -xzf "$tarfile" &&
    rm -rf ~/go1.9 &&
    mv ~/go1.9temp/go ~/go1.9 && rm -rf ~/go1.9temp && rm "$tarfile"

    export GOROOT_BOOTSTRAP=$HOME/go1.9

    # clone Go repo
    git clone https://go.googlesource.com/go ~/go &&
    # checkout latest release
    cd ~/go && git checkout "$gotag" &&
    # install
    cd ~/go/src && ./all.bash 
    # gopath dir
    mkdir ~/gocode
}

install_android() {
    defurl='https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip'
    zipfile='android_studio.zip'

    asurl="$1"
    if [ -z "$asurl" ]; then
        asurl="$defurl"
    fi

    curl "$asurl" > "$zipfile" &&
    unzip "$zipfile" -d ~
}

# a function for compiling & installing YouCompleteMe
install_ycm() {
    cd ~/.vim/bundle/YouCompleteMe &&
    git submodule update --init --recursive &&
    PATH=$PATH:$HOME/go/bin ./install.py --clang-completer --gocode-completer
}

# a function for setting up a /mnt/tmpfs, pass a size: $ make_tmpfs 2G
make_tmpfs() {
    defsize='2G'

    fssize="$1"
    if [ -z "$fssize" ]; then
        sz="$defsize"
    fi

    sudo mkdir /mnt/tmpfs
    sudo mount -o size="$fssize" -t tmpfs tmpfs /mnt/tmpfs
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\[\033[00m\]\[\033[01;32m\]\u\[\033[00m\]\[\033[01;33m\]@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[\033[01;31m\]]\[\033[00m\]$ '

alias lspics="ls *.jpeg *.jpg *.png"

alias python="python3"
alias c="clear"

# Open passed directory or file path in its default program and close terminal
function open() {
        xdg-open "$1" && exit
}

# Ze ultimate script
alias upgrade="sudo apt update; sudo apt upgrade -y"
# Ze ultimate script 2.0
alias e="exit"

function check-installed-packages() {
        comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
}

# One for all, all for one
alias aic="ascii-image-converter"

function ipcheck() {
    echo "Fetching Public IP Address..."
    curl htt.pw/myip
}

# Convert any video into readable .mp4 format. Deletes the previous video
function conv-vid() {
        arg1=$1
        ffmpeg -y -i $arg1 -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 192k -vaapi_device /dev/dri/renderD128 -ar 48000 temp.mp4
        rm -rf $arg1
        echo "Removed old" $arg1
        mv temp.mp4 $arg1
        echo "Placed modified" $arg1
}

function mkcd() {
        mkdir "$1"
        cd "$1"
}

function stopXAMPP() {
        sudo service mysql stop
        sudo /etc/init.d/apache2 stop
}

function qemu64install() {
        qemu-system-x86_64 -enable-kvm -cdrom "$1" -boot menu=on -drive file="$2" -m "$3" -cpu host -smp "$4" -vga qxl -display gtk,gl=on,grab-on-hover=on
}


function qemu64run() {
        qemu-system-x86_64 -enable-kvm -boot menu=on -drive file="$1" -m "$2" -cpu host -smp "$3" -vga qxl -display gtk,gl=on,grab-on-hover=on
}

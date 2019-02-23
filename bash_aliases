function pdf(){
        evince $1 &
}
alias matlab='/usr/local/MATLAB/R2018a/bin/matlab'
alias remove_tex='~/remove_tex.sh'
alias r='echo "Starting Ranger file manager"; ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias p='ping 8.8.8.8'
# alias st='speedometer -l -n 0 -m 50000 -i 0.5 -r wlo1'
alias pendrive='~/.i3/pendrive.sh'


#vim key beindings for bash
set -o vi
#bind -m vi-command ".":yank-last-argument # or insert-last-argument

export PATH=/usr/local/mysql/bin:$PATH


alias l='ls -lah'
alias ..='cd ..'
alias cdc="cd ~/code"

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxexexxxxxxxxx

#auto complete for ssh and scp
complete -o default -o nospace -W "$(grep -e 'Host[^N]' ~/.ssh/config | awk '{print substr($0, index($0,$2))}' ORS=' ')" scp sftp ssh




PS1='[\u@\h:\w]$ '
export PS1=$PS1
export PATH=$PATH:~/bin


function mp3split()
{
	echo "mp3 split with values $1 and valus $2"

	mkdir split;
	X=0; 
	while( [ $X -lt $2 ] ); 
	do 
		echo ${X}; 
		Y=$((X+1));
		ffmpeg -i "$1" -acodec copy -t 00:30:00 -ss 0$X:00:00 "split/${Y}a_$1";
		ffmpeg -i "$1" -acodec copy -t 00:30:00 -ss 0$X:30:00 "split/${Y}b_$1";
		X=$((X+1));
	done;

}


function tomp3()
{
	echo "converting all $1 to flv"

	for i in *.$1 ; do 
		ffmpeg -i "$i" -acodec libmp3lame $(basename "${i/.$1}").mp3 
		sleep 1
	done
}


function epoch(){
	if [ $@ == "now" ]
	then 
		date "+%s";
	else
		date -r $@;
	fi
}

# MacPorts Installer addition on 2011-04-06_at_12:26:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

function z(){
	for i in {1..90};do printf "\n" "+";done;printf "\n"
}


function mkdirs99()
{
	mkdir $(seq -w 00 99)
}



function zz(){
	z; z;
}


function remove_spaces()
{
	for f in *; do mv "$f" "`echo $f | sed s/[^A-Za-z0-9.]/_/g`"; done
}

# Setting PATH for Python 3.5
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

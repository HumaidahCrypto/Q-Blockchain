#!/bin/bash
clear

sleep 2

echo -e "\e[1m\e[32m1. Install docker... \e[0m" && sleep 1
sudo apt-get update && sudo apt install jq && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\e[1m\e[32m1. Clone repo... \e[0m" && sleep 1
git clone https://gitlab.com/q-dev/testnet-public-tools.git

echo -e "\e[1m\e[32m1. Membuat dir... \e[0m" && sleep 1
mkdir -p /root/testnet-public-tools/testnet-validator/keystore

echo '╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬ </SUDAH> ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬'

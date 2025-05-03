#!/bin/bash

## This tool needs wireguard-tools

mkdir -p wireguard
mkdir -p nginx/etc/wireguard/
wg genkey | tee wireguard/server.key | wg pubkey > wireguard/server.pub
wg genkey | tee wireguard/home.key | wg pubkey > wireguard/home.pub

HOME_NETWORK=192.168.16
PORT=51820
SERVER_ADDRESS=mazze.org

echo "[Interface]
Address = 192.168.17.1/24
Table = off
PostUp = ip route add ${HOME_NETWORK}.0/24 via 192.168.17.2
ListenPort = $PORT
PrivateKey = $(cat wireguard/server.key)

[Peer]
PublicKey = $(cat wireguard/home.pub)
AllowedIPs = 192.168.17.2/24
" > nginx/etc/wireguard/home.conf


echo "[Interface]
PrivateKey = $(cat wireguard/home.key)
Address = 192.168.17.2/24

[Peer]
PublicKey = $(cat wireguard/server.pub)
Endpoint = ${SERVER_ADDRESS}:${PORT}
PersistentKeepalive = 25
" > wireguard/home_wg0.conf

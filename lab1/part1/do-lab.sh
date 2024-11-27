#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh
docker ps
vi 4node-part1.clab.yml
mkdir lab-host1
mkdir lab-host2
mkdir lab-host3
mkdir lab-host4
mkdir lab-switch

sudo containerlab deploy

docker exec -it clab-lab1-part1-switch ip link set dev eth1 address aa:bb:cc:11:22:11
docker exec -it clab-lab1-part1-switch ip link set dev eth2 address aa:bb:cc:11:22:22
docker exec -it clab-lab1-part1-switch ip link set dev eth3 address aa:bb:cc:11:22:33
docker exec -it clab-lab1-part1-switch ip link set dev eth4 address aa:bb:cc:11:22:44


docker exec -it clab-lab1-part1-switch sysctl -w net.ipv6.conf.all.disable_ipv6=1
docker exec -it clab-lab1-part1-switch sysctl -w net.ipv6.conf.default.disable_ipv6=1

docker exec -it clab-lab1-part1-switch ip link set multicast off dev eth1
docker exec -it clab-lab1-part1-switch ip link set multicast off dev eth2
docker exec -it clab-lab1-part1-switch ip link set multicast off dev eth3
docker exec -it clab-lab1-part1-switch ip link set multicast off dev eth4

docker exec -it clab-lab1-part1-host1 ip link set dev eth1 address aa:bb:cc:11:11:11
docker exec -it clab-lab1-part1-host2 ip link set dev eth1 address aa:bb:cc:11:11:22
docker exec -it clab-lab1-part1-host3 ip link set dev eth1 address aa:bb:cc:11:11:33
docker exec -it clab-lab1-part1-host4 ip link set dev eth1 address aa:bb:cc:11:11:44


docker exec -it clab-lab1-part1-host1 sysctl -w net.ipv6.conf.all.disable_ipv6=1
docker exec -it clab-lab1-part1-host1 sysctl -w net.ipv6.conf.default.disable_ipv6=1
docker exec -it clab-lab1-part1-host1 ip link set multicast off dev eth1

docker exec -it clab-lab1-part1-host2 sysctl -w net.ipv6.conf.all.disable_ipv6=1
docker exec -it clab-lab1-part1-host2 sysctl -w net.ipv6.conf.default.disable_ipv6=1
docker exec -it clab-lab1-part1-host2 ip link set multicast off dev eth1

docker exec -it clab-lab1-part1-host3 sysctl -w net.ipv6.conf.all.disable_ipv6=1
docker exec -it clab-lab1-part1-host3 sysctl -w net.ipv6.conf.default.disable_ipv6=1
docker exec -it clab-lab1-part1-host3 ip link set multicast off dev eth1

docker exec -it clab-lab1-part1-host4 sysctl -w net.ipv6.conf.all.disable_ipv6=1
docker exec -it clab-lab1-part1-host4 sysctl -w net.ipv6.conf.default.disable_ipv6=1
docker exec -it clab-lab1-part1-host4 ip link set multicast off dev eth1

sw   ip link add name mybridge type bridge
sw   ip link set mybridge up
sw   ip link set eth1 master mybridge
sw   ip link set eth2 master mybridge
sw   ip link set eth3 master mybridge
sw   ip link set eth4 master mybridge

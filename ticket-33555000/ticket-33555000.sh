#!/bin/bash

echo "DELAY 30 SEGUNDOS: 500ms"
tc qdisc add dev eth0 root netem delay 500ms 300ms
sleep 30
tc qdisc del dev eth0 root netem delay 500ms 300ms



echo "DELAY 30 SEGUNDOS: 1200ms"
tc qdisc add dev eth0 root netem delay 4000ms 800ms
sleep 30
tc qdisc del dev eth0 root netem delay 4000ms 800ms


echo "PERDA DE PACOTES 30 SEGUNDOS"
tc qdisc add dev eth0 root netem loss 50% 70%
sleep 30 
tc qdisc del dev eth0 root netem loss 50% 70%


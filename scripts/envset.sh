#!/bin/sh
for ip in `cat my_hosts` ;
do
  ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done


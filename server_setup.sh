#!/bin/bash

echo "Welcome to the Server Setup Interface in targeted servers"

read -p "Do you want to configure the base server (timezone, firewall, lvm, mount, package installation)? (yes/no): " base
read -p "Do you want to create users? (yes/no): " users
read -p "Do you want to create HES/MDM user setup? (yes/no): " hes
read -p "Do you want to collect system report? (yes/no): " report
read -p "Do you want speed test and collect report? (yes/no): " speed

echo "Running selected tasks..."

if [ "$base" == "yes" ]; then
  ansible-playbook -i inventory conf/01_base_setup.yml
fi

if [ "$users" == "yes" ]; then
  bash /ansible2/conf/user_input.sh
fi

if [ "$hes" == "yes" ]; then
  ansible-playbook -i inventory conf/03_hes_or_mdm_deployment.yml 
fi

if [ "$report" == "yes" ]; then
  ansible-playbook -i inventory conf/generate_report.yml
fi

if [ "$speed" == "yes" ]; then 
  ansible-playbook -i inventory conf/speedtest_collect.yml
fi

echo "All selected tasks completed."


#naveen_kumar

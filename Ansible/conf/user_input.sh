#!/bin/bash

echo "Enter number of users to create:"
read num_users

users=()

for ((i = 1; i <= num_users; i++)); do
  echo "Enter username #$i:"
  read uname
  echo "Should $uname have sudo access? (yes/no):"
  read sudo
  users+=("{\"name\": \"$uname\", \"sudo\": \"$sudo\"}")
done

# Join entries with commas
user_list=$(IFS=, ; echo "[${users[*]}]")

echo "Enter a common password for all users:"
read -s common_password

# Write to a temporary JSON file
echo "{\"common_password\": \"$common_password\", \"user_list\": $user_list}" > vars.json

# Run the playbook with the JSON file
ansible-playbook -i inventory conf/02_normal_user_create.yml --extra-vars "@vars.json"

# Clean up
rm vars.json


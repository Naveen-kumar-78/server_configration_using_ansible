#!/bin/bash

# Resolve the directory path where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$SCRIPT_DIR/logs"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

echo "===== Server Setup Interface ====="
echo "Select the tasks you want to perform:"
echo "1. Base Server Setup (timezone, firewall disabling , packages installation)"
echo "2. Create Normal Users"
echo "3. HES/MDM User Setup"
echo "4. Collect System Report"
echo "5. Speed Test and Report"
echo "6. LVM and Mount Setup"
echo "=================================="
read -p "Enter choices (e.g., 1 3 4): " choices

# Function to run Ansible playbook with logging
run_playbook() {
  playbook=$1
  name=$2
  echo "--- Running: $name ---"
  ansible-playbook -i "$SCRIPT_DIR/inventory" "$SCRIPT_DIR/conf/$playbook" | tee "$LOG_DIR/${name// /_}.log"
}

# Process user choices
for choice in $choices; do
  case $choice in
    1)
      run_playbook "01_base_setup.yml" "Base Server Setup"
      ;;
    2)
      bash "$SCRIPT_DIR/conf/user_input.sh"
      ;;
    3)
      run_playbook "03_hes_or_mdm_deployment.yml" "HES or MDM User Setup"
      ;;
    4)
      run_playbook "generate_report.yml" "System Report Collection"
      ;;
    5)
      run_playbook "speedtest_collect.yml" "Speed Test"
      ;;
    6)
      run_playbook "lvm_setup.yml" "LVM and Mount Setup"
      ;;
    *)
      echo "⚠️  Invalid option: $choice"
      ;;
  esac
done

echo "✅ All selected tasks completed."

# 🔧 Ansible Server Setup Automation

This project automates the setup and configuration of Linux servers using Ansible and a user-friendly Bash interface. It’s designed to help DevOps engineers and system administrators quickly deploy common server configurations, create users, and generate reports with minimal effort.

---

## 🔧 Features

- 📦 Install packages
- 🔒 Disable firewalls
- 👤 Create users with password & sudo access
- 🌐 Set timezone and user folders
- 📁 LVM partitioning and formatting
- 🖥️ HES / MDM deployment (custom users + directories)
- 🧠 Interactive shell script UI (`script.sh`) — no need to run Ansible manually

---

## 🚀 Technologies Used

- Bash
- Ansible
- YAML
- Linux CLI

---


## 📁 Project Structure

Ansible/
├── conf/ # All playbooks, tasks, and scripts

│ ├── 01_base_setup.yml # Sets timezone, disables firewall, installs packages, etc.

│ ├── 02_normal_user_create.yml

│ ├── 03_hes_or_mdm_deployment.yml

│ ├── generate_report.yml # Collects system info and saves to report

│ ├── speedtest_collect.yml # Runs internet speed test and logs result

│ ├── group_vars/all.yml # Global Ansible variables

│ ├── tasks/ # Individual tasks included in playbooks

│ └── user_input.sh # Script for interactive user creation

├── inventory # Ansible inventory (list of target servers)

├── logs/ # Stores output logs of each task

├── server_setup.sh # Main script - interactive menu to run tasks

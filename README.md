# 🛠️ Ansible Server Setup Automation

This project is a **menu-driven automation tool** for Linux server setup using Ansible. It's designed to help users — even beginners — run server configuration tasks easily without manually typing Ansible commands.

---

## 📋 Features

- 🕐 **Base Server Setup**: Timezone config, firewall disabling, package installation
- 👤 **User Creation**: Add normal users with input prompt
- 🧪 **HES/MDM Deployment**: Create project-specific users/groups
- 📄 **System Report**: Collect system info (RAM, disk, OS, etc.)
- ⚡ **Speed Test**: Internet speed test with log report
- 💾 **LVM + Mount Setup**: Create and mount LVM volumes separately

---

## 📂 Folder Structure

```
Ansible/
├── conf/
│   ├── 01_base_setup.yml
│   ├── 02_normal_user_create.yml
│   ├── 03_hes_or_mdm_deployment.yml
│   ├── generate_report.yml
│   ├── speedtest_collect.yml
│   ├── lvm_setup.yml
│   ├── user_input.sh
│   ├── group_vars/
│   │   └── all.yml
│   ├── tasks/
│   │   ├── set_timezone.yml
│   │   ├── disable_firewall.yml
│   │   ├── install_packages.yml
│   │   ├── setup_mount.yml
│   │   ├── create_user_normal.yml
│   │   ├── create_user_deployment.yml
│   │   ├── install_db.yml
│   │   └── speedtest.yml
├── inventory
├── logs/
│   ├── Base_Server_Setup.log
│   ├── LVM_and_Mount_Setup.log
├── server_setup.sh
└── readme/
```

---

## 🚀 How to Use

### ✅ Prerequisites

- Ubuntu/Debian system
- Ansible installed:  
  ```bash
  sudo apt update && sudo apt install ansible -y
  ```

---

### ▶️ Run the Setup Script

```bash
sh server_setup.sh
```

You will see a menu like this:

```
===== Server Setup Interface =====
Select the tasks you want to perform:
1. Base Server Setup (timezone, firewall disabling, packages installation)
2. Create Normal Users
3. HES/MDM User Setup
4. Collect System Report
5. Speed Test and Report
6. LVM and Mount Setup
==================================
Enter choices (e.g., 1 3 5):
```

Based on your choices, the selected Ansible playbooks will run automatically and logs will be saved under the `logs/` folder.

---

## 📘 (Optional) Run Manually

You can also run individual playbooks if needed:

```bash
ansible-playbook -i inventory conf/01_base_setup.yml
```

Or with tags:

```bash
ansible-playbook -i inventory conf/01_base_setup.yml --tags packages
```

---


## 🙌 Author

**Naveen Kumar S**  
Cloud Engineer | DevOps Enthusiast  
📧 naveenayak02@gmail.com]  
🔗 inkedin.com/in/naveenkumars04



# First-Day IT Toolkit (PowerShell)

**Author:** Kapr Idriss Conteh  
**GitHub:** https://github.com/kconteh1  
**License:** MIT License  

---

## Overview

The **First-Day IT Toolkit** is a PowerShell script designed to help IT professionals quickly prepare a Windows workstation for administrative and scripting work.

This project automates common setup tasks that are often done manually on a new system, such as creating standard directories, installing essential PowerShell modules, and configuring a basic PowerShell profile.

The script is intentionally designed to be safe, readable, and beginner-friendly.

---

## What This Script Does

- Verifies PowerShell version compatibility
- Checks the current execution policy (read-only)
- Creates a standardized IT folder structure
- Installs commonly used PowerShell modules
- Creates or updates the PowerShell profile
- Adds basic quality-of-life settings and aliases
- Displays a clear summary of actions performed

---

## Who This Is For

- Junior IT professionals learning PowerShell
- New hires in IT environments
- Home lab users
- Anyone setting up a new Windows admin workstation

---

## Why This Is Useful

- Saves time on repetitive first-day setup tasks
- Encourages consistent folder and environment standards
- Demonstrates safe automation practices
- Serves as a foundation for learning and extending PowerShell scripts

---

## Folder Structure Created

The script creates the following directories under your user profile:

```text
User/
├── Scripts
├── Logs
├── Backups
├── Modules
└── Temp
```
---

## How to Run the Script

1. Clone the repository or download the script.
2. Open PowerShell **as your user account**.
3. Temporarily allow script execution for this session: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
4. Run the script: .\FirstDay-ITToolkit.ps1

---

**Safety Notes**
- The script does not delete files or modify system settings.
- All changes are user-scoped.
- Execution policy is checked but not permanently changed.
- Module installation is limited to the current user.

**Customization**
You are encouraged to:
- Add or remove PowerShell modules
- Modify the folder structure
- Extend the PowerShell profile configuration
- Add logging or reporting features
- This script is meant to be a starting point.

**License**
This project is licensed under the MIT License.
You are free to use, modify, and distribute this code, provided proper attribution is given.

**Author**
Created and maintained by Kapr Idriss Conteh
GitHub: https://github.com/kconteh1

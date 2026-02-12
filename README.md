# 🧠 Linux Dotfiles

This repository contains my personal Linux dotfiles — a fully reproducible development environment built around a minimal and keyboard-driven workflow.

The goal of this setup is simplicity, performance, and consistency across machines.

---

## ⚙️ Core Stack

- **Window Manager:** Hyprland
- **Terminal:** WezTerm
- **Editor:** Zed
- **Shell:** bash
- **Status Bar:** Waybar
- **Notifications:** SwayNC

---

## ✨ Philosophy

- Keep the system minimal
- Prefer keyboard-driven workflows
- Avoid unnecessary bloat
- Make the environment reproducible
- Optimize for developer productivity

This setup allows me to rebuild my entire working environment in minutes.

---

## 📂 Structure

.config/ contains all application configurations managed via GNU Stow.

Each config is symlinked into `~/.config` to keep the home directory clean while maintaining version control.

---

## 🚀 Setup

Clone the repository:

```bash
git clone https://github.com/Whitfrost21/dotfiles.git ~/dots
cd ~/dots
```

Stow the configuration:

```bash
stow .
```

Restart your session or reload the relevant applications.

---

## ⚠️ Notes

- This setup is tailored to my workflow — feel free to adapt it to yours.
- Some applications may require additional dependencies (fonts, themes, plugins).

---

---

## 🛠️ Future Improvements

- Bootstrap install script
- Automated package installation
- Theming consistency
- Host-specific configs

---

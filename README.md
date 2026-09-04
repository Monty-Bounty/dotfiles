# Minimal & Aesthetic i3wm Dotfiles

<p align="center">
  <img src="assets/d1.png" width="48%" />
  <img src="assets/d2.png" width="48%" />
  <img src="assets/d3.png" width="48%" />
  <img src="assets/d4.png" width="48%" />
</p>

<p align="center">
  <img src="assets/l1.png" width="48%" />
  <img src="assets/l2.png" width="48%" />
  <img src="assets/l3.png" width="48%" />
  <img src="assets/l4.png" width="48%" />
</p>

* **Desktop:** Soft purple-blue aesthetic with rounded corners via Picom, a custom Polybar, and an automated multi-tile dashboard.
* **Laptop:** Distraction-free monochrome environment styled with stock `i3status` bar.

---

## Environment Overview

| Component | Desktop | Laptop |
| :--- | :--- | :--- |
| **OS** | Linux Mint (X11) | Linux Lubuntu (X11) |
| **Window Manager** | i3wm / i3-gaps | i3wm |
| **Status Bar** | Polybar | i3bar + i3status |
| **Compositor** | Picom (`glx` backend, 10px corners) | None |
| **Terminal** | Alacritty | Alacritty |
| **Font** | Monospace / Nerd Font | Monospace |
| **GTK Theme** | Mint-Y-Dark-Purple | Dark / Monokai |
| **Cursor** | Bibata-Modern-Classic | Default |

---

## Installation

### 1. Base Dependencies

Install the utilities via APT:

```bash
sudo apt update
sudo apt install i3 picom polybar feh rofi alacritty cava htop dunst micro mpv xsettingsd tty-clock
```

Additional CLI tools used for the workspace dashboard:

* **lf:** Download the binary from the [lf releases page](https://github.com/gokcehan/lf/releases) and place it in `~/.local/bin/`
* **unimatrix:** Grab the script from the [unimatrix repository](https://www.google.com/search?q=https://github.com/will8211/unimatrix) and make it executable in your `$PATH`

---

### 2. Deploying via GNU Stow

This repository is structured for seamless symlinking with **GNU Stow**.

**Desktop Setup:**

```bash
cd ~/dotfiles
stow -t ~ desktop
```

**Laptop Setup:**

```bash
cd ~/dotfiles
stow -t ~ laptop
```

*(Alternatively, manually copy the contents of `desktop/.config` or `laptop/.config` into your `~/.config/` directory).*

---

## Configuration & Hardware Adjustments

* **Laptop Network Interface:** Open `~/.config/i3status/config` and replace `wlp3s0` with your machine's wireless interface identifier (run `ip link` to find yours).
* **Wallpapers:** Set directly inside `~/.config/i3/config` via `exec_always feh --bg-fill ~/.config/wallpapers/<image-name>` (all wallpaper assets are bundled in `~/.config/wallpapers/`).* **Workspace Dashboard (Desktop):** The included script `~/.config/i3/launch_dashboard.sh` automatically splits and spawns a pre-arranged terminal grid (`unimatrix`, `lf`, `htop`, `tty-clock`, and `cava`) on workspace 10.


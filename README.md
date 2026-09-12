# Minimal & Aesthetic i3wm Dotfiles

<p align="center">
  <img src="assets/d1.png" width="32%" />
  <img src="assets/d2.png" width="32%" />
  <img src="assets/d3.png" width="32%" />
  <img src="assets/d4.png" width="48%" />
  <img src="assets/d5.png" width="48%" />
</p>

<p align="center">
  <img src="assets/l1.png" width="32%" />
  <img src="assets/l2.png" width="32%" />
  <img src="assets/l3.png" width="32%" />
  <img src="assets/l4.png" width="48%" />
  <img src="assets/l5.png" width="48%" />
</p>

* **Desktop:** Soft purple-blue aesthetic with rounded corners via Picom, a custom Polybar, and an automated multi-tile dashboard.
* **Laptop:** Distraction-free monochrome environment styled with stock `i3status` bar on Debian.

---

## Environment Overview

| Component | Desktop | Laptop |
| :--- | :--- | :--- |
| **OS** | Linux Mint (X11) | Debian (X11) |
| **Window Manager** | i3wm / i3-gaps | i3wm |
| **Status Bar** | Polybar | i3bar + i3status |
| **Compositor** | Picom (`glx` backend, 10px corners) | None |
| **Terminal** | Alacritty | Alacritty |
| **File Manager** | lf | lf |
| **Font** | JetBrainsMono Nerd Font | JetBrainsMono Nerd Font |
| **GTK Theme** | Mint-Y-Dark-Purple | Adwaita-dark (Papirus-Dark icons) |
| **Cursor** | Bibata-Modern-Classic | Bibata-Modern-Classic |

---

## Installation

### 1. Core Packages (Both Devices)

Essential utilities shared across both machines:

```bash
sudo apt update
sudo apt install i3 dunst feh alacritty cava htop micro mpv xsettingsd lf tty-clock fastfetch redshift
```

### 2. Device-Specific Packages

#### Desktop Setup (Linux Mint)

Compositor, custom status bar, app launcher:

```Bash
sudo apt install picom polybar rofi 
```

#### Laptop Setup (Debian)

Stock status bar and utilities:

```Bash
sudo apt install i3status gnome-keyring papirus-icon-theme
```

#### 3. Additional Scripts & Tools
* **unimatrix**: Download the script from the unimatrix repository, make it executable (`chmod +x`), and move it to `~/.local/bin/.` Or use **cmatrix**!

* **yt-dlp**: Installed the standalone binary in the `~/.local/bin/`.

---

## Deploying via GNU Stow
#### Desktop Setup:

```Bash
cd ~/dotfiles
stow -t ~ desktop
```

#### Laptop Setup:

```Bash
cd ~/dotfiles
stow -t ~ laptop
```

*(Alternatively, copy the contents of `desktop/` or `laptop/` directly into your home directory).*

---

### Configuration & Hardware Adjustments
* **Laptop Network Interface:** Open `~/.config/i3status/config` and replace `wlp3s0` with your machine's wireless interface identifier (run `ip link` to find yours).

* **Wallpapers:** Set directly inside `~/.config/i3/config` via `exec_always feh --bg-fill ~/.config/wallpapers/<image-name>`

* **Workspace Dashboard:** The included script `~/.local/bin/launch_dashboard.sh` automatically splits and spawns a pre-arranged terminal grid (`unimatrix` or `cmatrix` (configure it), `lf`, `htop`, `tty-clock`, and `cava`) on workspace 10.

* **Coding layout:** The included script `~/.local/bin/coding_layout.sh` automatically splits and spawns a pre-arranged terminal grid (`micto` regular terminal and `lf` on workspace 3.


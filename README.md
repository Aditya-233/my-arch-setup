# Zero-Friction Arch + Hyprland Setup

No bloat. No hand-holding. Just a clean Hyprland desktop that works.

**Theme:** Catppuccin Mocha (Blue/Dark Grey)
**Font:** JetBrains Mono Nerd Font

---

## 📦 Phase 1 — Base Install (5 minutes)

1. Boot the Arch ISO.
2. Run:

   ```bash
   archinstall
   ```
3. Pick **Desktop → Hyprland**.
4. Audio: `Pipewire`
5. Bluetooth: `Yes`
6. Extra packages: `firefox git`
7. Install and reboot.

---

## 🧹 Phase 2 — First Login Cleanup (10 minutes)

### Kill what you won’t use

```bash
sudo pacman -Rns dolphin dunst
```

### Install the good stuff

Balanced, lean, no fluff.

```bash
sudo pacman -S sddm wofi waybar mako swaybg hyprlock hypridle \
  thunar firefox btop imv mpv okular nano fastfetch \
  brightnessctl network-manager-applet polkit-gnome \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xorg-xwayland \
  wl-clipboard cliphist ttf-jetbrains-mono-nerd ttf-opensans noto-fonts-emoji noto-fonts-cjk \
  qt5-wayland qt6-wayland qt5ct qt6ct starship \
  gvfs thunar-archive-plugin file-roller unzip ffmpegthumbnailer \
  ntfs-3g dosfstools 7zip unrar tlp tlp-rdw \
  papirus-icon-theme base-devel git pavucontrol blueman
```

### Turn services on

```bash
sudo systemctl enable sddm
sudo systemctl enable --now bluetooth
sudo systemctl enable --now tlp
sudo systemctl enable --now NetworkManager
```

---

## ⚡ Phase 3 — AUR Polish

Install yay the standard way:

```bash
git clone https://aur.archlinux.org/yay.bin
cd yay
makepkg -si
cd ..
rm -rf yay
```

Grab the last tools:

```bash
yay -S visual-studio-code-bin hyprshot nwg-look
```

---

## 🚀 Phase 4 — Drop In Your Config

This is where it becomes *your* system.

### Folder layout

```text
config-backup/
├── btop/
├── fontconfig/
├── gtk-3.0/
├── hypr/
├── kitty/
├── mako/
├── waybar/
├── wofi/
├── fastfetch/
├── .bashrc
└── starship.toml
```

### Copy it all

```bash
cp -r btop fontconfig gtk-3.0 hypr kitty mako waybar wofi fastfetch ~/.config/
cp starship.toml ~/.config/
cp .bashrc ~/.bashrc
```

### Wallpaper

Put one image here:

```bash
~/Pictures/wallpaper.jpg
```

That’s it. The config expects it there.

---

## 🎨 Phase 5 — Final Tweaks

### Fix ugly Qt apps

If VLC or Okular looks cursed, it’s normal. Fix it:

```bash
qt5ct
qt6ct
```

Pick **Adwaita-Dark** (or GTK2 theme) in both.

### Reload your shell

```bash
source ~/.bashrc
```

Starship should light up immediately.

### Reboot

Just reboot. Let the system settle.

---

## ⌨️ Keybinds

| Keys              | What it does |
| ----------------- | ------------ |
| Super + Enter     | Terminal     |
| Super + R         | Launcher     |
| Super + C         | Close window |
| Super + F         | Fullscreen   |
| Super + V         | Float        |
| Super + L         | Lock         |
| PRINT             | Screenshot   |

---

## 💡 Why this build doesn’t suck

* Fast install, zero drama
* No broken defaults
* GTK + Qt actually match
* Minimal AUR garbage
* Everything is readable, themed, and sane

If something breaks here, it's either your hardware or upstream Arch — not this setup.

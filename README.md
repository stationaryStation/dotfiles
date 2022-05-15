# Dotfiles (feat. catppuccin + dmenumoji)

## Dependencies:
  - polybar
  - Bspwm
  - sxhkd
  - dmenu (dmenumoji path)
  - picom (picom-jonaburg-git)
  - mpd
  - ncmpcpp
  - dm-dmenu (Binaries from bin folder should be in ~/bin/)
  - feh
  - dex (Autostart stuff)

## Optional:
   - dunst (Notifications)
   - kitty (Default Terminal Emulator)
   - betterlockscreen (Default Lockscreen)

---

## Installation: 

Instalation instructions available in the respective repositories

 - [dmenumoji](https://github.com/valeriangalliat/dmenumoji)
 - [picom-jonaburg-git](https://github.com/jonaburg/picom)
 - dm-dmenu:
    - Move Binaries from bin folder to ~/bin/ and add the directory to path
 - mpd:
    - Copy the sample config from the mpd folder to ~/.mpd (No further configuration needed)
 - ncmpcpp:
    - Copy the sample config from the ncmpcpp folder to ~/.config/ncmpcpp and It should work out of the box
 - sxhkd:
    - Copy the config from the sxhkd folder to ~/.config/sxhkd and replace all instances of "stationuwu" to your current username
 - Wallpapers:
    - Add some wallpapers to ~/Pictures/Wallpapers/ and It should work out of the box, by default, feh will choose a random wallpaper and apply it every bspwm restart.

---

## Further Customization

### dmenu

To change dmenu's look, go to ~/.config/sxhkd/sxhkdrc and and change the configuration to your liking. Also another location is ~/bin/\_dm_helper.sh and dm_shutdown.

I will try to remove this fragmentation when I find a propper fix to this issue.

### feh

To change feh's behavior, go to ~/.config/bspwm/bspwmrc and change the following line to your liking

```bash
# Default
feh --randomize --bg-scale ~/Pictures/Wallpapers/

# Display 1 Wallpaper
feh --bg-scale ~/Pictures/Wallpapers/file_name.png

```

### dex

To disable autostarting applications, remove the following line on bspwmrc:

```bash
dex --autostart
```

### betterlockscreen

To change the default lockscreen image run this command on any terminal emulator:

```bash
# One image
betterlockscreen -u ~/Path_To_wallpaper/image_name.png

# Random Image from folder
betterlockscreen -u ~/Path_to_wallpaper/
```

### polybar

To disable the aur/pacman update indicator remove the following:

```diff
modules-right = pulseaudio media xkeyboard battery wlan etch date

- updates
```

To disable the Wireless Indicator remove the following:

```diff
modules-right = pulseaudio media xkeyboard battery eth date

- wlan
```

To disable the battery indicator remove the following:

```diff
modules-right = pulseaudio media xkeyboard eth date

- battery
```

---

## Final look

![Photo](https://i.imgur.com/cWYbjSU.png)

Wallpaper from [catppuccin/wallpapers](https://github.com/catppuccin/wallpapers)

## To-do

 - [x] Add Customization options
 - [x] Add optional dependencies
 - [ ] Add keybind helper (Similar to what awesomewm has)
 - [x] Add mpd config

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

---

## Installation: 

Instalation instructions available in the respective repositories

 - [dmenumoji](https://github.com/valeriangalliat/dmenumoji)
 - [picom-jonaburg-git](https://github.com/jonaburg/picom)
 - dm-dmenu:
    - Move Binaries from bin folder to ~/bin/ and add the directory to path
 - mpd:
    - Copy the sample config from the mpd folder to ~/.mpd and replace {username_here} with your current username (ej: /home/stationuwu/.mpd/...)
 - ncmpcpp:
    - Copy the sample config from the ncmpcpp folder to ~/.config/ncmpcpp and It should work out of the box
 - sxhkd:
    - Copy the config from the sxhkd folder to ~/.config/sxhkd and replace all instances of "stationuwu" to your current username
 - Wallpapers:
    - Add some wallpapers to ~/Pictures/Wallpapers/ and It should work out of the box, by default, feh will choose a random wallpaper and apply it every bspwm restart.

---

## Further Configuration

### dmenu

To change dmenu's look, go to ~/.config/sxhkd/sxhkdrc and and change the configuration to your liking. Also another location is ~/bin/\_dm_helper.sh and dm_shutdown.

### feh

To change feh's behavior, go to ~/.config/bspwm/bspwmrc and change the following line to your liking

```bash
# Default
feh --randomize --bg-scale ~/Pictures/Wallpapers/

# Display 1 Wallpaper
feh --bg-scale ~/Pictures/Wallpapers/file_name.png

```

---

## Final look
![Photo](https://i.imgur.com/cWYbjSU.png)


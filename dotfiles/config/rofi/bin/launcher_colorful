#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6
# style_7     style_8     style_9     style_10    style_11    style_12

theme="style_8"
dir="$HOME/.config/rofi/launchers/colorful"

# dark
ALPHA="#00000000"
BG="#161320ff"
FG="#6E6C7Eff"
SELECT="#161320ff"
# light
#ALPHA="#00000000"
#BG="#FFFFFFff"
#FG="#000000ff"
#SELECT="#f3f3f3ff"

# accent colors
COLORS=('#F2CDCD' '#DDB6F2' '#F5C2E7' '#E8A2AF' '#F28FAD' '#F8BD96' '#FAE3B0' \
		'#ABE9B3' '#B5E8E0' '#96CDFB' '#89DCEB')
ACCENT="${COLORS[$(( $RANDOM % 11 ))]}ff"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

# comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" --hide="colors.rasi" $dir))
#theme="${themes[$(( $RANDOM % 12 ))]}"

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"

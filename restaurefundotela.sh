#!/bin/bash
if [ -e '/usr/share/xfce4/backdrops/0-parana-integral.jpg' ]; then
    FUNDOTELA="/usr/share/xfce4/backdrops/cevm.jpg"
elif [ -e "/usr/share/xfce4/backdrops/linuxmint.jpg" ]; then
    FUNDOTELA="/usr/share/xfce4/backdrops/cevm.jpg"
elif [ -e "/usr/share/xfce4/backdrops/linuxmint.png" ]; then
    FUNDOTELA="/usr/share/xfce4/backdrops/cevm.png"
else
    FUNDOTELA="/usr/share/backgrounds/linuxmint/cevm.jpg"
fi
xfconf-query -c xfce4-desktop -lv | while read param; do
{
    lastImage=$(echo "$param" | grep "last-image" | sed 's/[ \t].*//') 
    backdropCycle=$(echo "$param" | grep "backdrop-cycle-enable" | sed 's/[ \t].*//')
    if [ "$lastImage" = "" ] && [ "$backdropCycle" = "" ]; then
        continue;
    fi

    if [ "$backdropCycle" != "" ]; then
        #echo "desativado Cycle"
        xfconf-query -c xfce4-desktop -p "$backdropCycle" -r -R
    fi

    if [ "$lastImage" != "" ]; then
        #echo "mudando fundo tela ao padrao"
        xfconf-query -c xfce4-desktop -p "$lastImage" -s "$FUNDOTELA"
    fi
}
done
#echo fim

cd ~
git clone https://github.com/beamyyl/dwm.git
cd dwm/dwm
sudo make clean install
cd ../st
sudo make clean install
cd ../slstatus
sudo make clean install
cd ..
mv .dwminitrc ~/
fastfetch
echo Done! Run 'startx ~/.dwminitrc' to go into DWM!

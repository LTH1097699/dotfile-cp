#make directory
DIR_HOME=$(echo ~)
#mkdir $DIR_HOME/Documents || echo "error "&& exit

cd $DIR_HOME/Documents/

git clone --depth 1 --recurse-submodules "https://github.com/owl4ce/dotfiles.git"

echo "----------Copy dotfile in dotfile directory-------------"
cp -r dotfiles/. ~/ << "EXCLUDE"
.git*
LICENSE
*.md
EXTRA_JOYFUL
EXCLUDE
echo "----------Copy dotfile in dotfile directory completely-------------"
echo "----------Copy dotfile in dotfile directory of extra_joyful-------------"
cp -r dotfiles/EXTRA_JOYFUL/. ~/ << "EXCLUDE"
.git*
neofetch
EXCLUDE
echo "----------Copy dotfile in dotfile directory of extra_joyful completely-------------"

echo "----------Regenerate the font caches-------------"
#This ensures all existing caches are cleaned and regenerated for all installed fonts.
fc-cache -rv
echo "----------Regenerate the font caches completely-------------"

#The step you're waiting for
#The final step is to login to the openbox-session, basically login from your display manager such as lightdm, gdm, etc. If you're using ~/.xinitrc without a display manager, simply add the following one-liner command at the end.
#Systemd-based Linux distributions
#exec openbox-session
#Init-freedom Linux distributions
#exec dbus-launch --exit-with-x11 openbox-session

#mount external disk by add new line to /etc/fstab with option : defaults
#UUID=xxx /data btrfs  defaults 0 0

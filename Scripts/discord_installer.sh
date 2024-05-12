#!/bin/env bash

# Ask a pass if not enough privileges
if (($EUID != 0)); then
  if hash pkexec 2>/dev/null; then
    pkexec "$0" "$@"
  elif hash gksu 2>/dev/null; then
    if [[ -t 1 ]]; then
      sudo "$0" "$@"
    else
      exec 1>output_file
      gksu "$0 $@"
    fi
  else
    sudo "$0" "$@"
  fi
  exit
fi

DEST_DIR="/opt/"
EXEC_PATH="/usr/bin/discord"
DESKTOP_ENTRY_PATH="/usr/share/applications/discord.desktop"
ARCHIVE_PATH="/tmp/discord.tar.gz"

wget -O $ARCHIVE_PATH "https://discord.com/api/download?platform=linux&format=tar.gz"
tar xf $ARCHIVE_PATH

# Copy files to destination with overwrite
cp -rvR Discord $DEST_DIR
sudo ln -sf $DEST_DIR/Discord/Discord $EXEC_PATH

# Write the desktop entry
touch -a $DESKTOP_ENTRY_PATH
cat > $DESKTOP_ENTRY_PATH <<- EOM
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$EXEC_PATH
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
EOM

# Cleanup
rm -rf ./Discord
rm $ARCHIVE_PATH

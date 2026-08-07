#!/usr/bin/env bash

set -Eeuo pipefail

update_and_upgrade() {
  echo
  read -r -p "Update and upgrade all packages? [y/N] " answer
  case "$answer" in
    [yY]|[yY][eE][sS])
      sudo apt-get update -y && sudo apt-get upgrade -y
      ;;
    *)
      echo "Cancelled."
      ;;
  esac
}

while true; do
  clear
  echo "=============================================="
  echo "              VPS Management Menu"
  echo "=============================================="
  echo "1) Update & Upgrade"
  echo "0) Exit"
  echo
  read -r -p "Choose an option: " choice

  case "$choice" in
    1) update_and_upgrade ;;
    0) exit 0 ;;
    *) echo "Invalid option." ;;
  esac

  echo
  read -r -p "Press Enter to return to the menu..."
done

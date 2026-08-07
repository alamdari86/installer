# VPS Management Menu

A small interactive Bash menu for running common Ubuntu/Debian server tasks.

## Run

On your server:

```bash
chmod +x vps-menu.sh
./vps-menu.sh
```

Choose `1` for **Update & Upgrade**. The script requests confirmation before it updates installed packages.

> This first version is intended for Debian/Ubuntu systems because it uses `apt-get`.

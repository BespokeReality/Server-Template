# Change to home directory
cd ~
rm -rf Documents Downloads Music Pictures Public Templates Videos
sudo apt update && sudo apt upgrade -y
sudo apt install -y vlc
sudo apt install -y python3-pip
sudo apt install -y python3-pygame
sudo apt install -y python3-vlc
sudo apt install -y python3-flask
sudo apt install -y gunicorn
sudo apt install -y tmux
sudo apt install -y neovim
sudo apt install -y iptables-persistent

# Enable VNC
sudo raspi-config nonint do_vnc 0

# Open port 80 for web server, link to port 12413
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 12413

# Open port 80 for internal access
sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 12413

# Save iptables rules
sudo netfilter-persistent save

# Display current iptables rules
sudo iptables -t nat -L PREROUTING -n -v
sudo iptables -t nat -L OUTPUT -n -v

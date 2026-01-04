sudo ln -s /home/lodomo/Server-Template/bespoke-reality.service /etc/systemd/system/bespoke-reality.service
sudo systemctl daemon-reload
sudo systemctl enable bespoke-reality.service
sudo systemctl start bespoke-reality.service
sudo systemctl status bespoke-reality.service
echo "Bespoke Reality service has been made permanent and started."

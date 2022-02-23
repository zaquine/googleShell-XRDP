echo "PROGRESS TIME : 5 MNT"
echo "USE STABIL CONNECTION"
echo ""

echo ">> Setting Ngrok Start"
rm -fr google-xrdp.sh  ngrok  ngrok.zip
wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok.zip > /dev/null 2>&1
read -p "Ngrok Authtoken: " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp --region ap 3389 &>/dev/null &
rm -fr ngrok.zip
echo ">> Setting Ngrok Success"
echo ""

echo "==> Installing X-Rdp Start"
sudo apt-get install lxde > /dev/null 2>&1
sudo apt install -y xrdp > /dev/null 2>&1
sudo sed -i.bak '/fi/a lxde-session \n' /etc/xrdp/startwm.sh > /dev/null 2>&1
echo "==> Installing X-Rdp Success"
echo ""


sudo service xrdp start > /dev/null 2>&1
echo "==========================="
echo "YOUR XRDP INFO"
echo "==========================="
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Username: bintang"
echo "Password: That you created"
echo "==========================="
echo ""

echo "NOTE: Don't close this tab to keep your RDP still running"
sleep 9876543210

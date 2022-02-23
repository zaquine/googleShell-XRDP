echo "Progress Time: 5 Minute"
echo "Use stabil connection"
echo ""
echo "==> Setting Ngrok Start"
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1
sudo wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1 && unzip ngrok.zip && rm ngrok.zip
read -p "Ngrok Authtoken: " CRP
./ngrok authtoken $CRP
echo "==> Setting Ngrok Success...next"
echo ""
echo "==> Installing X-Rdp Start"
sudo apt-get install lxde > /dev/null 2>&1
sudo sed -i.bak '/fi/a lxde-session \n' /etc/xrdp/startwm.sh > /dev/null 2>&1
sudo apt install -y xrdp > /dev/null 2>&1
./ngrok tcp 3389 &>/dev/null &
sudo service xrdp start > /dev/null 2>&1
./ngrok tcp 3389 &>/dev/null &
sudo service xrdp start > /dev/null 2>&1
echo "==> Installing X-Rdp Success...next"
echo ""
echo "==> Installing Firefox Start"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F
sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu bionic main"
sudo apt-get update > /dev/null 2>&1
sudo apt-get install firefox -y > /dev/null 2>&1
echo "==> Installing Firefox Success...next"
echo ""
echo "============================================="
echo "              Your Login Info"
echo "============================================="
read curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Username: root"
echo "Password: That you created on first progress"
echo "============================================="
echo ""
echo"."
echo "NOTE: Don't close this tab to keep your RDP still running"
sleep 9876543210

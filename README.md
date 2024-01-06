<H2>Receive Information from technoline thermometers</H2>

Put an Jeelink-Stick (LaCrosse) on a free USB-Port.<BR>
This stick receives the information via 868 MHz from the thermometers.<BR>
The script jeelink.py decodes it and sends it to your mosquitto-server.<BR>
<BR>
i.e. jeelink/sensor[xy] => {"temperature":99.99,"humidity":99,"battery":100|0}
<BR><BR>
Just now the images are available for aarch64<BR>
I am using pi5 with debian. But a build at an other platform is possible.<BR>
Feel free for changing jeelink.py to your conditions.<BR>
<H3>Please define your parameters in config.json</H3>
(JSON-style)<BR>
<BR>
tty-port  => /dev/ttyUSB0 (in the docker Container)<BR>
mqtt-server => your_mqtt_server_ip<BR>
mqtt-port => 1883 <BR>
client-id => a name<BR>
username => username for login in mqqt-server | or ""<BR>
password => password for login in mqqt-server | or ""<BR>
socat => true we start a socat connection to remote usb socat server<BR>
sleep => time to sleep after socat connection initialisied (i use "2")<BR>
remote-ip => your_socat_server_ip<BR>
remote-port => your_socat_server_port (example:"4001")<BR>
<BR>
<H3>Docker-command</H3>
<PRE>docker run \
  -v &lt;your-path&gt;/app:/app \
  --name jeelink \
  --network &lt;your network&gt; \
  --restart unless-stopped \
  -d \
  laubi/jeelink2mqtt:latest \
  jeelink.py
</PRE>
Both files "jeelink.py" and "config.json" must be in subdir "./app".

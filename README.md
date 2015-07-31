# Secure VNC Server Docker

Run a docker container with turboVNC and websockify in secure mode.


1) Create the certificate self.pem

```bash
openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
```
2) Build the image

```bash
docker build -t vncsecure .
```
3) Run the container in background.

```bash
docker run -p 5900:5900 --name vncsecurecontainer -d vncsecure
```

4) Get the One Time Password (OTP).

```bash
docker exec vncsecurecontainer /opt/TurboVNC/bin/vncpasswd -o -display :1
```

5) Access in a browser the https://localhost:5900 and accept the
self-signed certificate.
Note for boot2docker users: change localhost for the IP of your docker
host. Run the command `boot2docker ip` to get it.

6) Access http://novnc.com to connect to the machine.

7) Check the Encrypt option in the settings.

![noVNC settings](https://cdn.rawgit.com/karinepires/docker-secure-vncserver/master/novnc-settings.png "noVNC settings")

8) Inform the connection settings:

<table>
  <thead>
    <tr>
      <td>Setting</td>
      <td>Description</td>
      <td>Default of this example</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HOST</td>
      <td>docker ip</td>
      <td>localhost (maybe it is a different one if you are using boot2docker)</td>
    </tr>
    <tr>
      <td>PORT</td>
      <td>vnc port</td>
      <td>5900</td>
    </tr>
    <tr>
      <td>PASSWORD</td>
      <td colspan="2">OTP created at step 4</td>
    </tr>
  </tbody>
</table>

![noVNC connection](https://cdn.rawgit.com/karinepires/docker-secure-vncserver/master/novnc-connection.png  "noVNC connection")

9) Open a program in the display (firefox for example).

```bash
docker exec vncsecurecontainer firefox
```
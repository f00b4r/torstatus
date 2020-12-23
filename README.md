<h1 align=center>TorStatus</h1>

<p align=center>
   Reboot of famous 🧅 TorStatus project.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

![](https://github.com/pwnlabs/torstatus/blob/master/.docs/torstatus.png "TorStatus")

-----

## Info

This is reasearch project to support [Tor](https://www.torproject.org/) community.
Based on awesome [torstatus.rueckgr.at](https://torstatus.rueckgr.at/) and source codes [paulchen/torstatus](https://github.com/paulchen/torstatus). Thank you.

## Usage

Feel free to clone this project and run your own version.

**Requirements**

- VPS
- Docker
- Docker Compose
- Make

**Installation**

1. Setup Docker Compose stack.

  - Take a look at our prepared `docker-compose.yml`.
  - Feel free to edit DB credentials.
  - Torstatus configuration is located at `./torstatus/web/config.php`.

2. Initialize app structure.

  - Create data and confif folders (`./_data` & `./_config` by default).
  - Setup permissions for Tor.

  ```
  make init
  ```

3. Configure your Tor node.

  - Make a copy of `./docker/tor/torrc` file to configure your own Tor node (name, ip, contact, limits, etc).

  ```
  cp ./docker/tor/torrc ./_config/torrc
  ```

4. Start Docker Compose stack.

  ```
  # Recommended for the first time
  docker-compose up

  # Later
  docker-compose up -d
  ```

5. Import SQL data.

  - Once MySQL is fully loaded, import tables and first records.

  ```
  make db-init
  ```

6. Retrive Tor data.

  - You need to fetch data from your Tor node.
  - Run perl script located in `./torstatus/tns_update.pl`.

  ```
  make update
  ```

  - It might take a while for the first time.

7. Open `http://IP:8000`.

## Development

See [how to contribute](https://contributte.org/contributing.html) to this package.

This package is currently maintained by these authors.

<a href="https://github.com/f3l1x">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>
<a href="https://github.com/stuchl4n3k">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/1194552?v=3&s=80">
</a>

-----

Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Also thank you for using this package.

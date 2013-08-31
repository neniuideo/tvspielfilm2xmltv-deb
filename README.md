tvspielfilm2xmltv-deb
=====================

Debian Pakaging for tvspielfilm2xmltv

Build pakage set from GIT. If you are using the generated regular package see README.Debian how to update upstream.

You need
- git
- devscripts
- libwww-perl
- libcrypt-ssleay-perl
- libparse-debcontrol-perl
- libdistro-info-perl
- file
- debhelper

```bash
apt-get install git devscripts libwww-perl libcrypt-ssleay-perl libparse-debcontrol-perl libdistro-info-perl file debhelper
```

1. Checkout

    ```bash
    git clone https://github.com/neniuideo/tvspielfilm2xmltv-deb.git
    ```

2.  Go to the right directory

    ```bash
    cd tvspielfilm2xmltv-deb/vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-0.0.0
    ```

3. Get the upstream source

   Do 1. or 2.

   1. Use the latest release

        ```bash
        debian/update-upstream.sh update-release
        ```

   2. Use the latest GIT revision

        ```bash
        debian/update-upstream.sh update-git
        ```

    You got an new source directory called "vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-&lt;new version&gt;". Go to that directory

    ```bash
    cd ..
    cd vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-<new version>
    ```

4. Build the package

    ```bash
    dpkg-buildpackage -tc
    ```

    Now you get the debian pakage and the pakage source.



Put the binary and/or Source pakages into your repository or install the binary pakage with
```bash
apt-get install python3 python3-requests python3-tz
dpkg -i vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv_<version>_all.deb
```

have fun...

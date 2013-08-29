tvspielfilm2xmltv-deb
=====================

Debian Pakaging for tvspielfilm2xmltv

Build pakage set from GIT. If you are using the generated regular package see README.Debian how to update upstream.

You need
- git
- devscripts
- libwww-perl
- libcrypt-ssleay-perl

```bash
apt-get install git devscripts libwww-perl libcrypt-ssleay-perl
```

1. Checkout

    ```bash
    git clone https://github.com/neniuideo/tvspielfilm2xmltv-deb.git
    ```

2.  Go to the right directory

    ```bash
    cd tvspielfilm2xmltv-deb/vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-0.0.1
    ```

3. Get the upstream source

   Do 1. or 2.

   1. Use the latest release

        ```bash
        debian/rules update-release
        ```

   2. Use the latest GIT revision

        ```bash
        debian/rules update-git
        ```

    Beware that all files in "vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-0.0.1" will be deleted (except the debian directory).

4. Build the package

    ```bash
    dpkg-buildpackage -tc
    ```

    Now you get the debian pakage and the pakage source.



Put the binary and/or Source pakages into your repository or install the binary pakage with
```bash
apt-get install <foo bar>
dpkg -i <foo bar>
```

have fun...

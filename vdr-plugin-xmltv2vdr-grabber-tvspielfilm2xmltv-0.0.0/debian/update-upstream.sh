#!/bin/sh

case $1 in

  update-release)
    echo "Checking Versions..."
    us=$(uscan --report-status)
    local=$(echo "${us}" | sed -ne 's/^Newest version on remote site is .*, local version is \(.*\)/\1/p')
    upstream=$(echo "${us}" | sed -ne 's/^Newest version on remote site is \(.*\), local version is .*/\1/p')

    echo "Local Version: ${local}"
    echo "Upstream Version: ${upstream}"

    if [ "${local}" = "${upstream}" ]; then
      echo "Up to date"
      exit 0
    fi

    echo "Download upstream tarball"
    uscan --rename

    echo "Create package directory..."
    mkdir -p "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"
    cp -R debian "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"
    tar -xf "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv_${upstream}.orig.tar.gz"\
      -C "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"\
      --strip-components=1

    echo "Append new version to changelog..."
    dch --newversion="${upstream}-1"\
      --controlmaint\
      --distribution=unstable\
      --changelog="../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}/debian/changelog"\
      "New upstream version."
  ;;

  update-git)
    echo "Checking Versions..."
    tmp="$(mktemp -d)"
    curdir="$(pwd)"
    cd "${tmp}"
    git clone https://github.com/chriszero/tvspielfilm2xmltv.git
    cd "${tmp}/tvspielfilm2xmltv"
    upstream=$(git describe --tags --dirty | sed 's/^v//')
    cd "${curdir}"
    local=$(dpkg-parsechangelog | sed -ne 's/^Version: \(\([0-9]\+\):\)\?\(.*\)-.*/\3/p')
    echo "Local Version: ${local}"
    echo "Upstream Version: ${upstream}"

    if [ "${local}" = "${upstream}" ]; then
      echo "Up to date"
      exit 0
    fi

    echo "Create upstream tarball"
    git --git-dir="${tmp}/tvspielfilm2xmltv/.git" archive --format=tar HEAD | gzip -c9 > "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv_${upstream}.orig.tar.gz"

    echo "Create package directory..."
    mkdir -p "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"
    cp -R debian "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"
    tar -xf "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv_${upstream}.orig.tar.gz"\
      -C "../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}"
    
    echo "Append new version to changelog..."
    dch --newversion="${upstream}-1"\
      --maintmaint\
      --distribution=unstable\
      --changelog="../vdr-plugin-xmltv2vdr-grabber-tvspielfilm2xmltv-${upstream}/debian/changelog"\
      "New upstream version."
    true
  ;;
esac


exit 0

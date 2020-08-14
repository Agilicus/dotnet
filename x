{
  "layer": [
    {
      "index": 0,
      "digestId": "sha256:ce30112909569cead47eac188789d0cf95924b166405aa4b71fb500d6e4ae08d",
      "sizeBytes": 72848637,
      "command": "#(nop) ADD file:65a1cc50a9867c153deb3bed36d9d51d469fb123df6ee0ba31e01646edf1a1c4 in / "
    },
    {
      "index": 1,
      "digestId": "sha256:8eeb4a14bcb4379021c215017c94800a848a8203a8ce76aa1bd211d4c995f792",
      "sizeBytes": 1006733,
      "command": "[ -z \"$(apt-get indextargets)\" ]"
    },
    {
      "index": 2,
      "digestId": "sha256:a37e74863e723df4ddd599ef1b7d9a68e2301794a8c37c2370f8c2c8993ef72c",
      "sizeBytes": 811,
      "command": "set -xe \t\t\u0026\u0026 echo '#!/bin/sh' \u003e /usr/sbin/policy-rc.d \t\u0026\u0026 echo 'exit 101' \u003e\u003e /usr/sbin/policy-rc.d \t\u0026\u0026 chmod +x /usr/sbin/policy-rc.d \t\t\u0026\u0026 dpkg-divert --local --rename --add /sbin/initctl \t\u0026\u0026 cp -a /usr/sbin/policy-rc.d /sbin/initctl \t\u0026\u0026 sed -i 's/^exit.*/exit 0/' /sbin/initctl \t\t\u0026\u0026 echo 'force-unsafe-io' \u003e /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \t\t\u0026\u0026 echo 'DPkg::Post-Invoke { \"rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true\"; };' \u003e /etc/apt/apt.conf.d/docker-clean \t\u0026\u0026 echo 'APT::Update::Post-Invoke { \"rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true\"; };' \u003e\u003e /etc/apt/apt.conf.d/docker-clean \t\u0026\u0026 echo 'Dir::Cache::pkgcache \"\"; Dir::Cache::srcpkgcache \"\";' \u003e\u003e /etc/apt/apt.conf.d/docker-clean \t\t\u0026\u0026 echo 'Acquire::Languages \"none\";' \u003e /etc/apt/apt.conf.d/docker-no-languages \t\t\u0026\u0026 echo 'Acquire::GzipIndexes \"true\"; Acquire::CompressionTypes::Order:: \"gz\";' \u003e /etc/apt/apt.conf.d/docker-gzip-indexes \t\t\u0026\u0026 echo 'Apt::AutoRemove::SuggestsImportant \"false\";' \u003e /etc/apt/apt.conf.d/docker-autoremove-suggests"
    },
    {
      "index": 3,
      "digestId": "sha256:095624243293a7dfdb582f8471d6e2d9d7772dd621bc57906b034c59f388ebac",
      "sizeBytes": 7,
      "command": "mkdir -p /run/systemd \u0026\u0026 echo 'docker' \u003e /run/systemd/container"
    },
    {
      "index": 4,
      "digestId": "sha256:db0a51c9a342e6f7ea8ea2c7421671a9938bc67cfb6e8395322bc3e815987263",
      "sizeBytes": 13271040,
      "command": "COPY --from=build /tmp/local.tar /tmp/local.tar"
    },
    {
      "index": 5,
      "digestId": "sha256:4eb0dc18217d2ad63b53eddefc796ce2b575338cba44ad30a658564401019fa6",
      "sizeBytes": 4164560,
      "command": "COPY --from=rust /usr/local/cargo/bin/websocat /usr/local/bin/websocat"
    },
    {
      "index": 6,
      "digestId": "sha256:b5843d8aaea25b6bb232e2362ad9575225925c3aacb12409c8964217cf7e7f2e",
      "sizeBytes": 82025258,
      "command": "RUN     cd / \u0026\u0026     tar xf /tmp/local.tar \u0026\u0026     adduser --disabled-password --gecos '' openresty \u0026\u0026     apt-get update \u0026\u0026     apt-get install -y wget gnupg2 libpcre3 \u0026\u0026     wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - \u0026\u0026     echo deb http://openresty.org/package/ubuntu focal main | tee -a /etc/apt/sources.list \u0026\u0026     apt-get update \u0026\u0026     apt-get -y install openresty \u0026\u0026     mkdir -p /usr/local/openresty/site/lualib/rules/              /app              /rules/http.d              /rules/server.d              /rules/location.d              /rules/init-by-lua.d \u0026\u0026     ln -s /dev/stderr /usr/local/openresty/nginx/logs/error.log \u0026\u0026     echo \"\u003chtml\u003e\u003chead\u003eEMPTY\u003c/head\u003e\u003cbody\u003eEMPTY\u003c/body\u003e\u003c/html\u003e\" \u003e /app/index.html \u0026\u0026     rm -rf /tmp/local.tar /var/lib/apt/lists/*"
    },
    {
      "index": 7,
      "digestId": "sha256:31bce82a4bb001f4141a5ef7bff3289532c648f98c95b2e1070a6ccc08422a58",
      "sizeBytes": 8712,
      "command": "COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf"
    },
    {
      "index": 8,
      "digestId": "sha256:1c0f30af366bbb836e9dafc042f3e9f950b59f90e45ce07109e4067639f51743",
      "sizeBytes": 132,
      "command": "COPY root.conf /rules/server.d/root.conf"
    },
    {
      "index": 9,
      "digestId": "sha256:e6845e35f12d83af7ce70cf5c7063fc3f50b8daefb597997ddf27d89cd6e234e",
      "sizeBytes": 1843429,
      "command": "useradd --create-home -s /bin/bash dotnet  \u0026\u0026 apt-get update  \u0026\u0026 apt-get install -y xz-utils unzip bzip2  \u0026\u0026 rm -rf /var/lib/apt/lists/*"
    },
    {
      "index": 10,
      "digestId": "sha256:15205c9607ab33df6f4281d829523140661f1220e872736da0d26e6ec1e9d5a3",
      "sizeBytes": 100591196,
      "command": "#(nop) COPY --chown=dotnetdir:186313864aafa26333d639cf60223db4391ee6ffa7d69a689a44e1683b33e035 in /tmp/fcgi "
    },
    {
      "index": 11,
      "digestId": "sha256:00f4909e62b2d92cbe289cf96529c80e5d77281dc7a9bf8ce88300457a4d38cb",
      "sizeBytes": 334519169,
      "command": ":  \u0026\u0026 printf \"\\nfetch wine-mono\\n\\n\"  \u0026\u0026 curl -sL https://dl.winehq.org/wine/wine-mono/5.1.0/wine-mono-5.1.0-x86.msi \u003e /tmp/wine-mono.msi  \u0026\u0026 curl -sL https://dl.winehq.org/wine/wine-mono/5.1.0/wine-mono-5.1.0-x86.tar.xz \u003e /tmp/wine-mono.tar.xz  \u0026\u0026 printf \"\\nfetch wine-gecko\\n\\n\"  \u0026\u0026 curl -sL https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi \u003e /tmp/wine_gecko.msi  \u0026\u0026 curl -sL https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.tar.bz2 \u003e /tmp/wine_gecko.tar.bz2  \u0026\u0026 printf \"\\nInstall wine-mono\\en\\n\"  \u0026\u0026 mkdir -p /usr/share/wine/mono  \u0026\u0026 xzcat /tmp/wine-mono.tar.xz | tar xf - -C /usr/share/wine/mono/  \u0026\u0026 printf \"\\nInstall wine-gecko\\n\\n\"  \u0026\u0026 mkdir -p /usr/share/wine/gecko  \u0026\u0026 bzip2 -cd /tmp/wine_gecko.tar.bz2 | tar xvf - -C /usr/share/wine/gecko/  \u0026\u0026 rm -rf /tmp/win*"
    },
    {
      "index": 12,
      "digestId": "sha256:b38626e1054c0098c634cef1d87285a01411b85b3c3e0764a5b029c33014a595",
      "sizeBytes": 1816007654,
      "command": ":  \u0026\u0026 curl -sL http://storage.googleapis.com/agilicus/artifacts/wine.tar.xz.20200807151546.enc | openssl enc -d -aes256 -pass env:PASS \u003e /tmp/wine.tar.xz  \u0026\u0026 xzcat /tmp/wine.tar.xz | tar xf - -C /home/dotnet  \u0026\u0026 cd /tmp/fcgi  \u0026\u0026 unzip gac.zip  \u0026\u0026 chown -R dotnet:dotnet /home/dotnet /tmp/fcgi  \u0026\u0026 rm -rf /home/dotnet/.wine/drive_c/users/dotnet/Temp/*  \u0026\u0026 ls /tmp/fcgi  \u0026\u0026 rm /tmp/wine.tar.xz"
    },
    {
      "index": 13,
      "digestId": "sha256:e44c8a6e793470bae30f66df6560e099d5d3770f136b5e795e9aa3eb50be8aa8",
      "sizeBytes": 1869720428,
      "command": "dpkg --add-architecture i386  \u0026\u0026 apt-get update  \u0026\u0026 apt-get -y upgrade  \u0026\u0026 apt-get -y install curl gnupg2 dumb-init libfcgi0ldbl software-properties-common  \u0026\u0026 curl -L https://dl.winehq.org/wine-builds/winehq.key | apt-key add -  \u0026\u0026 echo \"deb https://dl.winehq.org/wine-builds/ubuntu/ focal main\" \u003e /etc/apt/sources.list.d/wine.list  \u0026\u0026 apt-get update  \u0026\u0026 echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections  \u0026\u0026 apt-get install -y --install-recommends wine-stable cabextract libntlm0 libwbclient0 ttf-mscorefonts-installer winbind unzip xml2 wget p7zip-full  \u0026\u0026 rm -rf /var/lib/apt/lists/*"
    },
    {
      "index": 14,
      "digestId": "sha256:6bb6a20634e0dfdf46d8450f8c0e76a56abee594e9befd5463843d3d075ea982",
      "sizeBytes": 866103,
      "command": ":  \u0026\u0026 curl -sL https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \u003e /usr/local/bin/winetricks  \u0026\u0026 chmod a=rx /usr/local/bin/winetricks  \u0026\u0026 mkdir -p /app  \u0026\u0026 chown -R dotnet:dotnet /app  \u0026\u0026 mkdir -p /tmp/.X11-unix  \u0026\u0026 chmod 1777 /tmp/.X11-unix"
    },
    {
      "index": 15,
      "digestId": "sha256:2d6cf716b42e7c2ab65de32c104dfea5cf78de86b0c6c7119f7d884b284f6c6f",
      "sizeBytes": 377151653,
      "command": ":  \u0026\u0026 cd /tmp/fcgi  \u0026\u0026 ls  \u0026\u0026 wine gacutil.exe /i fastcgi-mono-server4.exe  \u0026\u0026 wine gacutil.exe /i Mono.WebServer.dll  \u0026\u0026 wine gacutil.exe /i Mono.Posix.NETStandard.dll"
    },
    {
      "index": 16,
      "digestId": "sha256:541eaa13d5d3346c58b237a1fab5db19a2467601f069d25140c56c1318025015",
      "sizeBytes": 0,
      "command": ":   \u0026\u0026 rm -rf ~/.cache /tmp/*"
    },
    {
      "index": 17,
      "digestId": "sha256:1d90e86273a342ad17d3d32ff8c1532f48dd5f043ee79ca718b1917044286176",
      "sizeBytes": 1116,
      "command": "#(nop) COPY file:d363ba7e65842d1ef648cde12a668e51686ba5bf3f75d67002a54894d962acf3 in /usr/local/openresty/nginx/conf/fastcgi_params "
    },
    {
      "index": 18,
      "digestId": "sha256:7be22f56d212263cbebd8e66d54e89d2f157a591a5bd13c4f232b511f36662b2",
      "sizeBytes": 371,
      "command": "#(nop) COPY --chown=dotnetfile:727f6aca2c613b9b6ac74dd368b6428dc1a2158197be99c9055f3dc849feb788 in /rules/server.d/root.conf "
    },
    {
      "index": 19,
      "digestId": "sha256:2c8b233a7792eda1c42340315810ee73b1bd328fdd1a320144e3f4b170af7de2",
      "sizeBytes": 305,
      "command": "#(nop) COPY --chown=dotnetfile:3642f6912c26659e171c354d3adff6a2421613ce27eae92a88da06caf61c35ff in /rules/server.d/root.dnc "
    },
    {
      "index": 20,
      "digestId": "sha256:d9bc8844ee67de3fec90319e00b2b5e97d028c86f66c5cdfc6d188c9e949068d",
      "sizeBytes": 86,
      "command": "#(nop) COPY file:e17ff260aaa15e54d322aeb8f8da472e43e55fb5ac3e900233e42d716ebea5a2 in /app "
    },
    {
      "index": 21,
      "digestId": "sha256:22972c32c91372b8eedd1199a5399f52f601a5c7d5ca50f0f2ddd38a00868925",
      "sizeBytes": 1177,
      "command": "#(nop) COPY file:c9c7a9b32ff333e9e7dbeea261b743d2ff0075122c0a42cbd6f0df0e6bbdbdfe in / "
    },
    {
      "index": 22,
      "digestId": "sha256:b25219b4097b6d717d508705f182c534e901302929624d78a54bb5780eb7e8c3",
      "sizeBytes": 643,
      "command": "#(nop) COPY dir:22f6c44ed2b191a84570c76fd3ee6680e28aef243ecf2de5e6485dc5036d1600 in /rules/ "
    }
  ],
  "image": {
    "sizeBytes": 4674029220,
    "inefficientBytes": 948606874,
    "efficiencyScore": 0.8941761395613633,
    "inefficientFiles": [
      {
        "count": 2,
        "sizeBytes": 198878490,
        "file": "/tmp/fcgi/cr-32.zip"
      },
      {
        "count": 2,
        "sizeBytes": 48924081,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mshtml.dll"
      },
      {
        "count": 2,
        "sizeBytes": 18506904,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shell32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 13271040,
        "file": "/tmp/local.tar"
      },
      {
        "count": 2,
        "sizeBytes": 12501341,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 10910806,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 9434309,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/jscript.dll"
      },
      {
        "count": 2,
        "sizeBytes": 9152416,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.windows.common-controls_6595b64144ccf1df_6.0.2600.2982_none_deadbeef/comctl32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 9152416,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/comctl32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 7909849,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/actxprxy.dll"
      },
      {
        "count": 2,
        "sizeBytes": 7799073,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/quartz.dll"
      },
      {
        "count": 2,
        "sizeBytes": 7717660,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/oleaut32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 7361759,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ieframe.dll"
      },
      {
        "count": 2,
        "sizeBytes": 6469533,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d2d1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 6009850,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/kernelbase.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_33.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_38.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_37.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_41.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_35.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_34.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_40.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5821548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_39.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5820562,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_29.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5820562,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_30.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5820562,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_28.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5820012,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_36.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5819538,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_27.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5819312,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_31.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5818346,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_26.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5817878,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_42.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5817878,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_43.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5812558,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_25.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5810214,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx9_24.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5570888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/urlmon.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5309738,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d11.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5022010,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5013428,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4994878,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp70.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4884247,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/comdlg32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4827841,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp110.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4819843,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp120.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4810987,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ddraw.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4770134,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gdiplus.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4770134,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.windows.gdiplus_6595b64144ccf1df_1.0.6000.16386_none_deadbeef/gdiplus.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4770134,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.windows.gdiplus_6595b64144ccf1df_1.1.7601.23038_none_deadbeef/gdiplus.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4708444,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp100.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4503523,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/riched20.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4494900,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp60.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4471763,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rpcrt4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3852522,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wininet.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3748374,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cmd.exe"
      },
      {
        "count": 2,
        "sizeBytes": 3651454,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/setupapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3605808,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/kernel32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3493236,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3drm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3429165,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dsound.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3150621,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wineps.drv"
      },
      {
        "count": 2,
        "sizeBytes": 3059659,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cryptui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3044062,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vbscript.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3042667,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_47.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3042353,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_46.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3038653,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_41.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3038653,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_40.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3038653,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_42.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3038649,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_38.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3038649,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_39.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037833,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_43.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_37.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_34.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_35.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_36.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3037527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dcompiler_33.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2935685,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winmm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2923947,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d9.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2703601,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmime.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2693099,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/taskmgr.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2690694,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/qedit.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2666310,
        "file": "/home/dotnet/.wine/drive_c/windows/regedit.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2637783,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/webservices.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2566679,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shlwapi.dll"
      },
      {
        "count": 4,
        "sizeBytes": 2526718,
        "file": "/var/cache/debconf/templates.dat"
      },
      {
        "count": 2,
        "sizeBytes": 2517784,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wbem/wbemprox.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2458606,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Windows NT/Accessories/wordpad.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2395667,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d10.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2342652,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hhctrl.ocx"
      },
      {
        "count": 2,
        "sizeBytes": 2335015,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mfplat.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2330950,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/inetcomm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2308927,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msctf.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2306378,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mf.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2303665,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msctfp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2232560,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mshtml.tlb"
      },
      {
        "count": 2,
        "sizeBytes": 2219466,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dplayx.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2209271,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/oleacc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2204044,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Common Files/System/OLE DB/msdaps.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2164332,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/oleview.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2087058,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/avifil32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2031661,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winhttp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2003470,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ntoskrnl.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1989740,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d8.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1967620,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winefile.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1948075,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winhlp32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1948075,
        "file": "/home/dotnet/.wine/drive_c/windows/winhlp32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1944413,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/amstream.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1924860,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/explorer.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1924860,
        "file": "/home/dotnet/.wine/drive_c/windows/explorer.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1889724,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/taskschd.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1875001,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmstyle.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1874992,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/user32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1726344,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winecfg.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1722781,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/usp10.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1663645,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/services.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1653366,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wmp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1546323,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmusic.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1537453,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/scrrun.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1527695,
        "file": "/var/cache/debconf/templates.dat-old"
      },
      {
        "count": 2,
        "sizeBytes": 1524634,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Common Files/System/OLE DB/oledb32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1469599,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wineboot.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1444509,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hnetcfg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1414149,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/Speech/Common/sapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1405593,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wscript.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1402304,
        "file": "/usr/lib/x86_64-linux-gnu/libsystemd.so.0.28.0"
      },
      {
        "count": 2,
        "sizeBytes": 1399283,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/devenum.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1394257,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cscript.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1377174,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/notepad.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1377174,
        "file": "/home/dotnet/.wine/drive_c/windows/notepad.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1376988,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/progman.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1376765,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dxdiagn.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1356292,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Common Files/System/ADO/msado15.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1339271,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atl.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1332877,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmloader.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1323623,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wintrust.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1266838,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/appwiz.cpl"
      },
      {
        "count": 2,
        "sizeBytes": 1254057,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.vc80.atl_1fc8b3b9a1e18e3b_8.0.50727.4053_none_deadbeef/atl80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1254057,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atl80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1240958,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wuapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1239569,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/qmgr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1236216,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gameux.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1229720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1215150,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xcopy.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1211164,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wusa.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1209925,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.vc90.atl_1fc8b3b9a1e18e3b_9.0.30729.6161_none_deadbeef/atl90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1209925,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atl90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1209021,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atl100.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1209021,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atl110.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1208954,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/reg.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1179630,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winemine.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1173319,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmcompos.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1168695,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/itss.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1163660,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ddrawex.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1160841,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpnet.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1156343,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rsaenh.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1154934,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmband.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1136774,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/uxtheme.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1120716,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msiexec.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1118507,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dxdiag.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1115798,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dxof.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1106091,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rpcss.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1098016,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wshom.ocx"
      },
      {
        "count": 2,
        "sizeBytes": 1097763,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hlink.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1085847,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/qmgrprxy.dll"
      },
      {
        "count": 4,
        "sizeBytes": 1083294,
        "file": "/var/lib/dpkg/status"
      },
      {
        "count": 2,
        "sizeBytes": 1075093,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mmdevapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1063158,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/inetcpl.cpl"
      },
      {
        "count": 2,
        "sizeBytes": 1061124,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmscript.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1055046,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/browseui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1042528,
        "file": "/home/dotnet/.wine/drive_c/windows/command/start.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1034939,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mfreadwrite.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1015481,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/propsys.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1011482,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mlang.dll"
      },
      {
        "count": 2,
        "sizeBytes": 999424,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp71.dll"
      },
      {
        "count": 2,
        "sizeBytes": 997812,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dbgeng.dll"
      },
      {
        "count": 2,
        "sizeBytes": 996350,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/opcservices.dll"
      },
      {
        "count": 3,
        "sizeBytes": 995857,
        "file": "/var/lib/dpkg/status-old"
      },
      {
        "count": 2,
        "sizeBytes": 988350,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mstask.dll"
      },
      {
        "count": 2,
        "sizeBytes": 987871,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/explorerframe.dll"
      },
      {
        "count": 2,
        "sizeBytes": 979138,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmsynth.dll"
      },
      {
        "count": 2,
        "sizeBytes": 975646,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/scrobj.dll"
      },
      {
        "count": 2,
        "sizeBytes": 972432,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/evr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 959631,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sti.dll"
      },
      {
        "count": 2,
        "sizeBytes": 957126,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Internet Explorer/iexplore.exe"
      },
      {
        "count": 2,
        "sizeBytes": 957126,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/iexplore.exe"
      },
      {
        "count": 2,
        "sizeBytes": 942512,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shdocvw.dll"
      },
      {
        "count": 2,
        "sizeBytes": 939417,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dispex.dll"
      },
      {
        "count": 2,
        "sizeBytes": 935157,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wmvcore.dll"
      },
      {
        "count": 2,
        "sizeBytes": 934798,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wsdapi.dll"
      },
      {
        "count": 4,
        "sizeBytes": 921124,
        "file": "/var/log/dpkg.log"
      },
      {
        "count": 2,
        "sizeBytes": 917110,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/net.exe"
      },
      {
        "count": 2,
        "sizeBytes": 916535,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/schedsvc.dll"
      },
      {
        "count": 4,
        "sizeBytes": 906952,
        "file": "/var/log/lastlog"
      },
      {
        "count": 2,
        "sizeBytes": 894562,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/uninstaller.exe"
      },
      {
        "count": 2,
        "sizeBytes": 892439,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xmllite.dll"
      },
      {
        "count": 2,
        "sizeBytes": 887424,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp140.dll"
      },
      {
        "count": 2,
        "sizeBytes": 884527,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/schtasks.exe"
      },
      {
        "count": 2,
        "sizeBytes": 880000,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/extrac32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 877723,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dhtmled.ocx"
      },
      {
        "count": 2,
        "sizeBytes": 874815,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/attrib.exe"
      },
      {
        "count": 2,
        "sizeBytes": 858490,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/taskkill.exe"
      },
      {
        "count": 2,
        "sizeBytes": 858263,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/regsvr32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 856810,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wbem/wbemdisp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 856639,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wbem/wmic.exe"
      },
      {
        "count": 2,
        "sizeBytes": 837154,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rundll32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 836499,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cabarc.exe"
      },
      {
        "count": 2,
        "sizeBytes": 832869,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msidb.exe"
      },
      {
        "count": 2,
        "sizeBytes": 832498,
        "file": "/home/dotnet/.wine/drive_c/windows/hh.exe"
      },
      {
        "count": 2,
        "sizeBytes": 830304,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/netstat.exe"
      },
      {
        "count": 2,
        "sizeBytes": 822315,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/clock.exe"
      },
      {
        "count": 2,
        "sizeBytes": 819324,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dswave.dll"
      },
      {
        "count": 2,
        "sizeBytes": 806138,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mfmediaengine.dll"
      },
      {
        "count": 2,
        "sizeBytes": 796364,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winemsibuilder.exe"
      },
      {
        "count": 2,
        "sizeBytes": 793176,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/localspl.dll"
      },
      {
        "count": 2,
        "sizeBytes": 790794,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winedevice.exe"
      },
      {
        "count": 2,
        "sizeBytes": 787123,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvfw32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 781722,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/view.exe"
      },
      {
        "count": 2,
        "sizeBytes": 769671,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sc.exe"
      },
      {
        "count": 2,
        "sizeBytes": 767662,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/svchost.exe"
      },
      {
        "count": 2,
        "sizeBytes": 766982,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ipconfig.exe"
      },
      {
        "count": 2,
        "sizeBytes": 764930,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcirt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 759856,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/oledlg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 759208,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msacm32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 751858,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/find.exe"
      },
      {
        "count": 2,
        "sizeBytes": 750154,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/advpack.dll"
      },
      {
        "count": 2,
        "sizeBytes": 744923,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/uianimation.dll"
      },
      {
        "count": 2,
        "sizeBytes": 737384,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msinfo32.exe"
      },
      {
        "count": 2,
        "sizeBytes": 730714,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ping.exe"
      },
      {
        "count": 2,
        "sizeBytes": 723386,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wiaservc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 722352,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/eject.exe"
      },
      {
        "count": 2,
        "sizeBytes": 719092,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/chcp.com"
      },
      {
        "count": 2,
        "sizeBytes": 718373,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/comsvcs.dll"
      },
      {
        "count": 2,
        "sizeBytes": 717002,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wuauserv.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716998,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/spoolsv.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716897,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/tasklist.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716897,
        "file": "/home/dotnet/.wine/drive_c/Program Files/Windows Media Player/wmplayer.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716895,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/conhost.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716844,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/termsv.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716842,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/plugplay.exe"
      },
      {
        "count": 2,
        "sizeBytes": 716838,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winmgmt.exe"
      },
      {
        "count": 2,
        "sizeBytes": 715066,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpvoice.dll"
      },
      {
        "count": 2,
        "sizeBytes": 714781,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/systeminfo.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714781,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/WindowsPowerShell/v1.0/powershell.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714777,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shutdown.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714777,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wevtutil.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714775,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/findstr.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714775,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sdbinst.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714773,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/regini.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714773,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpnsvr.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714773,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fsutil.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714771,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/subst.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714771,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/netsh.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714769,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dism.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714767,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/arp.exe"
      },
      {
        "count": 2,
        "sizeBytes": 714765,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fc.exe"
      },
      {
        "count": 2,
        "sizeBytes": 713816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/icacls.exe"
      },
      {
        "count": 2,
        "sizeBytes": 713814,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cacls.exe"
      },
      {
        "count": 2,
        "sizeBytes": 710888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/write.exe"
      },
      {
        "count": 2,
        "sizeBytes": 705892,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wbem/mofcomp.exe"
      },
      {
        "count": 2,
        "sizeBytes": 704000,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/control.exe"
      },
      {
        "count": 2,
        "sizeBytes": 699784,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hostname.exe"
      },
      {
        "count": 2,
        "sizeBytes": 698830,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/combase.dll"
      },
      {
        "count": 2,
        "sizeBytes": 697649,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ieproxy.dll"
      },
      {
        "count": 2,
        "sizeBytes": 696320,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr71.dll"
      },
      {
        "count": 2,
        "sizeBytes": 693620,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/objsel.dll"
      },
      {
        "count": 2,
        "sizeBytes": 692460,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mshta.exe"
      },
      {
        "count": 2,
        "sizeBytes": 690045,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msimtf.dll"
      },
      {
        "count": 2,
        "sizeBytes": 689410,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msdmo.dll"
      },
      {
        "count": 2,
        "sizeBytes": 687396,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/icinfo.exe"
      },
      {
        "count": 2,
        "sizeBytes": 683554,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cabinet.dll"
      },
      {
        "count": 2,
        "sizeBytes": 677423,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_43.dll"
      },
      {
        "count": 2,
        "sizeBytes": 675858,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/expand.exe"
      },
      {
        "count": 2,
        "sizeBytes": 668384,
        "file": "/usr/lib/x86_64-linux-gnu/libseccomp.so.2.4.3"
      },
      {
        "count": 2,
        "sizeBytes": 666842,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msscript.ocx"
      },
      {
        "count": 2,
        "sizeBytes": 656252,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/uiribbon.dll"
      },
      {
        "count": 2,
        "sizeBytes": 653512,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/unlodctr.exe"
      },
      {
        "count": 2,
        "sizeBytes": 652992,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/lodctr.exe"
      },
      {
        "count": 2,
        "sizeBytes": 648278,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/secedit.exe"
      },
      {
        "count": 2,
        "sizeBytes": 642813,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hidclass.sys"
      },
      {
        "count": 2,
        "sizeBytes": 639600,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xolehlp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 633484,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mpr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 632084,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/jsproxy.dll"
      },
      {
        "count": 2,
        "sizeBytes": 620186,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cards.dll"
      },
      {
        "count": 2,
        "sizeBytes": 612553,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/inseng.dll"
      },
      {
        "count": 2,
        "sizeBytes": 609558,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/netcfgx.dll"
      },
      {
        "count": 2,
        "sizeBytes": 608982,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dsquery.dll"
      },
      {
        "count": 2,
        "sizeBytes": 597208,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dx8vb.dll"
      },
      {
        "count": 2,
        "sizeBytes": 595616,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mscoree.dll"
      },
      {
        "count": 2,
        "sizeBytes": 590364,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/infosoft.dll"
      },
      {
        "count": 2,
        "sizeBytes": 586382,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mciqtz32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 581171,
        "file": "/var/cache/apt/pkgcache.bin"
      },
      {
        "count": 2,
        "sizeBytes": 575257,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/joy.cpl"
      },
      {
        "count": 2,
        "sizeBytes": 558219,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mciavi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 556058,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mmcndmgr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 539924,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcp120_app.dll"
      },
      {
        "count": 2,
        "sizeBytes": 534976,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/crypt32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 523467,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shcore.dll"
      },
      {
        "count": 2,
        "sizeBytes": 523448,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/imm32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 516063,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/tapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 515642,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/netprofm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 495741,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx11_43.dll"
      },
      {
        "count": 2,
        "sizeBytes": 495741,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx11_42.dll"
      },
      {
        "count": 2,
        "sizeBytes": 489088,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/concrt140.dll"
      },
      {
        "count": 2,
        "sizeBytes": 483806,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msftedit.dll"
      },
      {
        "count": 2,
        "sizeBytes": 480930,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mtxdm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 472851,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sxs.dll"
      },
      {
        "count": 2,
        "sizeBytes": 469590,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/credui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 468396,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wbem/wmiutils.dll"
      },
      {
        "count": 2,
        "sizeBytes": 461042,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/odbccp32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 446704,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mferror.dll"
      },
      {
        "count": 2,
        "sizeBytes": 436464,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shdoclc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 425562,
        "file": "/var/cache/apt/srcpkgcache.bin"
      },
      {
        "count": 2,
        "sizeBytes": 396928,
        "file": "/tmp/fcgi/System.Net.Http.dll"
      },
      {
        "count": 2,
        "sizeBytes": 395628,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cryptnet.dll"
      },
      {
        "count": 2,
        "sizeBytes": 388336,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/tzres.dll"
      },
      {
        "count": 2,
        "sizeBytes": 379008,
        "file": "/home/dotnet/.wine/drive_c/windows/Microsoft.NET/assembly/GAC_MSIL/Mono.Posix.NETStandard/v4.0_1.0.0.0__cc7b13ffcd2ddd51/Mono.Posix.NETStandard.dll"
      },
      {
        "count": 2,
        "sizeBytes": 379008,
        "file": "/tmp/fcgi/Mono.Posix.NETStandard.dll"
      },
      {
        "count": 2,
        "sizeBytes": 369956,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 366360,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/unicows.dll"
      },
      {
        "count": 2,
        "sizeBytes": 348544,
        "file": "/usr/lib/x86_64-linux-gnu/libudev.so.1.6.17"
      },
      {
        "count": 2,
        "sizeBytes": 342332,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d10core.dll"
      },
      {
        "count": 2,
        "sizeBytes": 335716,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3d10_1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 332808,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wineconsole.exe"
      },
      {
        "count": 2,
        "sizeBytes": 328010,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wintab32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 326256,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp140.dll"
      },
      {
        "count": 2,
        "sizeBytes": 325165,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/imagehlp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 321864,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/pdh.dll"
      },
      {
        "count": 2,
        "sizeBytes": 316096,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/uiautomationcore.dll"
      },
      {
        "count": 2,
        "sizeBytes": 313730,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mspatcha.dll"
      },
      {
        "count": 2,
        "sizeBytes": 308928,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cryptdlg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 308172,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/http.sys"
      },
      {
        "count": 2,
        "sizeBytes": 304485,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/packager.dll"
      },
      {
        "count": 2,
        "sizeBytes": 301490,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mciwave.dll"
      },
      {
        "count": 2,
        "sizeBytes": 293232,
        "file": "/tmp/fcgi/System.Data.Common.dll"
      },
      {
        "count": 2,
        "sizeBytes": 291120,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 289352,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msxml6.dll"
      },
      {
        "count": 2,
        "sizeBytes": 289352,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft-windows-msxml60_31bf3856ad364e35_6.0.6000.16386_none_deadbeef/msxml6.dll"
      },
      {
        "count": 2,
        "sizeBytes": 285657,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mciseq.dll"
      },
      {
        "count": 2,
        "sizeBytes": 284232,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.msxml2_6bd6b9abf345378f_4.1.0.0_none_deadbeef/msxml4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 284232,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msxml4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 279369,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mcicda.dll"
      },
      {
        "count": 2,
        "sizeBytes": 278078,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr120_app.dll"
      },
      {
        "count": 2,
        "sizeBytes": 277258,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msrle32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 259160,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/httpapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 258824,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msxml3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 258824,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft-windows-msxml30_31bf3856ad364e35_6.0.6000.16386_none_deadbeef/msxml3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 258612,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/ndis.sys"
      },
      {
        "count": 2,
        "sizeBytes": 257158,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/windowscodecsext.dll"
      },
      {
        "count": 2,
        "sizeBytes": 256813,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpwsockx.dll"
      },
      {
        "count": 2,
        "sizeBytes": 254378,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/adsldp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 252691,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wsock32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 252464,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/localui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 250816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xinput1_4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 250406,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msacm32.drv"
      },
      {
        "count": 2,
        "sizeBytes": 247337,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msident.dll"
      },
      {
        "count": 2,
        "sizeBytes": 247318,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xinput1_3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 246954,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hid.dll"
      },
      {
        "count": 2,
        "sizeBytes": 246506,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/spoolss.dll"
      },
      {
        "count": 2,
        "sizeBytes": 246294,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xinput9_1_0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 246294,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xinput1_1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 246294,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xinput1_2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 245514,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wpc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 239790,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/userenv.dll"
      },
      {
        "count": 2,
        "sizeBytes": 228484,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rasapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 227196,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/fltmgr.sys"
      },
      {
        "count": 2,
        "sizeBytes": 227108,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/inetmib1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 221568,
        "file": "/tmp/fcgi/System.IO.Compression.dll"
      },
      {
        "count": 2,
        "sizeBytes": 219085,
        "file": "/home/dotnet/.wine/drive_c/windows/twain_32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 217840,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/pstorec.dll"
      },
      {
        "count": 2,
        "sizeBytes": 211042,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/iccvid.dll"
      },
      {
        "count": 2,
        "sizeBytes": 210944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winemapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 205096,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/esent.dll"
      },
      {
        "count": 2,
        "sizeBytes": 202458,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/serialui.dll"
      },
      {
        "count": 3,
        "sizeBytes": 200573,
        "file": "/var/log/apt/term.log"
      },
      {
        "count": 2,
        "sizeBytes": 198690,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/powrprof.dll"
      },
      {
        "count": 2,
        "sizeBytes": 193008,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wldap32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 192008,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wtsapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 190472,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winedbg.exe"
      },
      {
        "count": 2,
        "sizeBytes": 184772,
        "file": "/tmp/fcgi/gac.zip"
      },
      {
        "count": 2,
        "sizeBytes": 182198,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/snmpapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 178336,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winscard.dll"
      },
      {
        "count": 2,
        "sizeBytes": 177346,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/imaadp32.acm"
      },
      {
        "count": 2,
        "sizeBytes": 175860,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mfplay.dll"
      },
      {
        "count": 2,
        "sizeBytes": 175101,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/apphelp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 174162,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vssapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 172162,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/usbd.sys"
      },
      {
        "count": 2,
        "sizeBytes": 171738,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvidc32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 171680,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcruntime140.dll"
      },
      {
        "count": 2,
        "sizeBytes": 171008,
        "file": "/tmp/fcgi/Mono.WebServer.dll"
      },
      {
        "count": 2,
        "sizeBytes": 171008,
        "file": "/home/dotnet/.wine/drive_c/windows/Microsoft.NET/assembly/GAC_MSIL/Mono.WebServer/v4.0_0.4.0.0__0738eb9f132ed756/Mono.WebServer.dll"
      },
      {
        "count": 2,
        "sizeBytes": 168464,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/ksecdd.sys"
      },
      {
        "count": 2,
        "sizeBytes": 167094,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcrt20.dll"
      },
      {
        "count": 2,
        "sizeBytes": 166722,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vmm.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 166247,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fwpuclnt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 164860,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ntdsapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 164158,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/version.dll"
      },
      {
        "count": 2,
        "sizeBytes": 162830,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/midimap.dll"
      },
      {
        "count": 2,
        "sizeBytes": 162046,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dwmapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 161869,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcm80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 161713,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/schannel.dll"
      },
      {
        "count": 2,
        "sizeBytes": 161352,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msxml.dll"
      },
      {
        "count": 2,
        "sizeBytes": 160878,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wer.dll"
      },
      {
        "count": 2,
        "sizeBytes": 160412,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winsta.dll"
      },
      {
        "count": 2,
        "sizeBytes": 160328,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msxml2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 159744,
        "file": "/tmp/fcgi/fastcgi-mono-server4.exe"
      },
      {
        "count": 2,
        "sizeBytes": 159744,
        "file": "/home/dotnet/.wine/drive_c/windows/Microsoft.NET/assembly/GAC_32/fastcgi-mono-server4/v4.0_0.4.0.0__0738eb9f132ed756/fastcgi-mono-server4.exe"
      },
      {
        "count": 2,
        "sizeBytes": 158429,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ncrypt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 158262,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msadp32.acm"
      },
      {
        "count": 2,
        "sizeBytes": 157376,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/hal.dll"
      },
      {
        "count": 2,
        "sizeBytes": 155484,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/activeds.dll"
      },
      {
        "count": 2,
        "sizeBytes": 154534,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/scsiport.sys"
      },
      {
        "count": 2,
        "sizeBytes": 154368,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sspicli.dll"
      },
      {
        "count": 2,
        "sizeBytes": 153368,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcrt40.dll"
      },
      {
        "count": 2,
        "sizeBytes": 151176,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msisip.dll"
      },
      {
        "count": 2,
        "sizeBytes": 151025,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wdscore.dll"
      },
      {
        "count": 2,
        "sizeBytes": 150146,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dsdmo.dll"
      },
      {
        "count": 2,
        "sizeBytes": 149738,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mprapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 149472,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cdosys.dll"
      },
      {
        "count": 2,
        "sizeBytes": 149213,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/adsldpc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 148124,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/tdi.sys"
      },
      {
        "count": 2,
        "sizeBytes": 148083,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/printui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 147848,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wmphoto.dll"
      },
      {
        "count": 2,
        "sizeBytes": 147597,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/nddeapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 146249,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/clusapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 144878,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wevtapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 144090,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olecli32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 142458,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/newdev.dll"
      },
      {
        "count": 2,
        "sizeBytes": 140944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dxva2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 139060,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/query.dll"
      },
      {
        "count": 2,
        "sizeBytes": 139024,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msg711.acm"
      },
      {
        "count": 2,
        "sizeBytes": 138780,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sensapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 138294,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/t2embed.dll"
      },
      {
        "count": 2,
        "sizeBytes": 136627,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcm90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 133500,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/winehid.sys"
      },
      {
        "count": 2,
        "sizeBytes": 132464,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/url.dll"
      },
      {
        "count": 2,
        "sizeBytes": 130532,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olepro32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 129691,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mapistub.dll"
      },
      {
        "count": 2,
        "sizeBytes": 129002,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dhcpcsvc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 128866,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/authz.dll"
      },
      {
        "count": 2,
        "sizeBytes": 127110,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ntprint.dll"
      },
      {
        "count": 2,
        "sizeBytes": 126590,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wlanapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 126198,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msasn1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 125463,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rtutils.dll"
      },
      {
        "count": 2,
        "sizeBytes": 125273,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mssign32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 123750,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/aclui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 123282,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/bthprops.cpl"
      },
      {
        "count": 2,
        "sizeBytes": 122782,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/amsi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 121698,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ninput.dll"
      },
      {
        "count": 2,
        "sizeBytes": 121666,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dmusic32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 120873,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wsnmp32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 120253,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vulkan-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 119066,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/faultrep.dll"
      },
      {
        "count": 2,
        "sizeBytes": 118856,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/slc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 118658,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olesvr32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 118463,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ktmw32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 116256,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/difxapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 115881,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msls31.dll"
      },
      {
        "count": 2,
        "sizeBytes": 115606,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fltlib.dll"
      },
      {
        "count": 2,
        "sizeBytes": 115055,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/resutils.dll"
      },
      {
        "count": 2,
        "sizeBytes": 115010,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/inkobj.dll"
      },
      {
        "count": 2,
        "sizeBytes": 114142,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/loadperf.dll"
      },
      {
        "count": 2,
        "sizeBytes": 114054,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wimgapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 113711,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atmlib.dll"
      },
      {
        "count": 2,
        "sizeBytes": 113498,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mswsock.dll"
      },
      {
        "count": 2,
        "sizeBytes": 112231,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cryptext.dll"
      },
      {
        "count": 2,
        "sizeBytes": 112216,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/tdh.dll"
      },
      {
        "count": 2,
        "sizeBytes": 112006,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sfc_os.dll"
      },
      {
        "count": 2,
        "sizeBytes": 111685,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msnet32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 111622,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/virtdisk.dll"
      },
      {
        "count": 2,
        "sizeBytes": 110932,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/avrt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 110797,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/regapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 110739,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/samlib.dll"
      },
      {
        "count": 2,
        "sizeBytes": 110050,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/riched32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 109749,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rstrtmgr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 109012,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/updspapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 108870,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rasdlg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 108728,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/prntvpt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 108180,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpnhpast.dll"
      },
      {
        "count": 2,
        "sizeBytes": 108013,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/pidgen.dll"
      },
      {
        "count": 2,
        "sizeBytes": 106253,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/feclient.dll"
      },
      {
        "count": 2,
        "sizeBytes": 105524,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vnbt.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 103228,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vwin32.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 102818,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msisys.ocx"
      },
      {
        "count": 2,
        "sizeBytes": 99903,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dciman32.dll"
      },
      {
        "count": 4,
        "sizeBytes": 99392,
        "file": "/var/log/faillog"
      },
      {
        "count": 2,
        "sizeBytes": 99289,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/utildll.dll"
      },
      {
        "count": 2,
        "sizeBytes": 99239,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wmasf.dll"
      },
      {
        "count": 2,
        "sizeBytes": 98513,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drmclien.dll"
      },
      {
        "count": 2,
        "sizeBytes": 98246,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fntcache.dll"
      },
      {
        "count": 4,
        "sizeBytes": 98029,
        "file": "/var/log/apt/history.log"
      },
      {
        "count": 2,
        "sizeBytes": 97773,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/traffic.dll"
      },
      {
        "count": 2,
        "sizeBytes": 97509,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ifsmgr.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 97446,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/davclnt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 96735,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dssenh.dll"
      },
      {
        "count": 2,
        "sizeBytes": 96735,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/slbcsp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 96649,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sccbase.dll"
      },
      {
        "count": 2,
        "sizeBytes": 96549,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gpkcsp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 96170,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/qwave.dll"
      },
      {
        "count": 2,
        "sizeBytes": 95549,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olethk32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 95478,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/atlthunk.dll"
      },
      {
        "count": 2,
        "sizeBytes": 95451,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/monodebg.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 95103,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wuaueng.dll"
      },
      {
        "count": 2,
        "sizeBytes": 94528,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vdmdbg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 94481,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/odbcbcp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 93563,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mscat32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 93173,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/connect.dll"
      },
      {
        "count": 2,
        "sizeBytes": 92329,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/svrapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 92234,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/fontsub.dll"
      },
      {
        "count": 2,
        "sizeBytes": 92219,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mssip32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 92004,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mgmtapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 91865,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msdelta.dll"
      },
      {
        "count": 2,
        "sizeBytes": 91558,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cryptdll.dll"
      },
      {
        "count": 2,
        "sizeBytes": 91230,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vnetbios.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 91103,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msports.dll"
      },
      {
        "count": 2,
        "sizeBytes": 91011,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/srclient.dll"
      },
      {
        "count": 2,
        "sizeBytes": 90895,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sfc.dll"
      },
      {
        "count": 2,
        "sizeBytes": 90846,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/acledit.dll"
      },
      {
        "count": 2,
        "sizeBytes": 90581,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/itircl.dll"
      },
      {
        "count": 2,
        "sizeBytes": 90424,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/compstui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 90181,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vdhcp.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 89632,
        "file": "/tmp/fcgi/System.Security.Cryptography.Algorithms.dll"
      },
      {
        "count": 2,
        "sizeBytes": 89603,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mmdevldr.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 89561,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/initpki.dll"
      },
      {
        "count": 2,
        "sizeBytes": 89087,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vtdapi.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 89029,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wlanui.dll"
      },
      {
        "count": 2,
        "sizeBytes": 88944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/scarddlg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 88911,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/strmdll.dll"
      },
      {
        "count": 2,
        "sizeBytes": 88564,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msimg32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 87477,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sas.dll"
      },
      {
        "count": 2,
        "sizeBytes": 86540,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/cfgmgr32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 83949,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/normaliz.dll"
      },
      {
        "count": 2,
        "sizeBytes": 81906,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_39.dll"
      },
      {
        "count": 2,
        "sizeBytes": 81688,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_37.dll"
      },
      {
        "count": 2,
        "sizeBytes": 81584,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_38.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_36.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_34.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_41.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_42.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_40.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_35.dll"
      },
      {
        "count": 2,
        "sizeBytes": 78674,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dx10_33.dll"
      },
      {
        "count": 2,
        "sizeBytes": 77908,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/w32skrnl.dll"
      },
      {
        "count": 2,
        "sizeBytes": 70294,
        "file": "/usr/share/common-licenses/GPL-3"
      },
      {
        "count": 2,
        "sizeBytes": 66692,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-math-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 66416,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dinput.dll"
      },
      {
        "count": 2,
        "sizeBytes": 66392,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dinput8.dll"
      },
      {
        "count": 3,
        "sizeBytes": 66256,
        "file": "/etc/ld.so.cache"
      },
      {
        "count": 2,
        "sizeBytes": 66012,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/bluetoothapis.dll"
      },
      {
        "count": 2,
        "sizeBytes": 64912,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winspool.drv"
      },
      {
        "count": 2,
        "sizeBytes": 62896,
        "file": "/tmp/fcgi/System.Diagnostics.Tracing.dll"
      },
      {
        "count": 2,
        "sizeBytes": 62470,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-dx-d3dkmt-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 62200,
        "file": "/home/dotnet/.wine/drive_c/windows/twain_32/gphoto2.ds"
      },
      {
        "count": 2,
        "sizeBytes": 59924,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-multibyte-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 58608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/stdole2.tlb"
      },
      {
        "count": 2,
        "sizeBytes": 58236,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-com-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 57830,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msdrm.dll"
      },
      {
        "count": 3,
        "sizeBytes": 54632,
        "file": "/var/cache/ldconfig/aux-cache"
      },
      {
        "count": 2,
        "sizeBytes": 53776,
        "file": "/tmp/fcgi/System.Runtime.Serialization.Primitives.dll"
      },
      {
        "count": 2,
        "sizeBytes": 53060,
        "file": "/usr/share/common-licenses/LGPL-2.1"
      },
      {
        "count": 2,
        "sizeBytes": 51632,
        "file": "/tmp/fcgi/System.Threading.Overlapped.dll"
      },
      {
        "count": 2,
        "sizeBytes": 51510,
        "file": "/usr/share/common-licenses/MPL-1.1"
      },
      {
        "count": 4,
        "sizeBytes": 51319,
        "file": "/var/cache/debconf/config.dat"
      },
      {
        "count": 2,
        "sizeBytes": 50766,
        "file": "/usr/share/common-licenses/LGPL-2"
      },
      {
        "count": 2,
        "sizeBytes": 50728,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wow32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 50528,
        "file": "/var/lib/dpkg/info/libsystemd0:amd64.symbols"
      },
      {
        "count": 2,
        "sizeBytes": 48592,
        "file": "/tmp/fcgi/System.Globalization.Extensions.dll"
      },
      {
        "count": 2,
        "sizeBytes": 47836,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wing32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 47434,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/psapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 47156,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/npptools.dll"
      },
      {
        "count": 2,
        "sizeBytes": 47090,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/irprops.cpl"
      },
      {
        "count": 2,
        "sizeBytes": 46810,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ctl3d32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 46528,
        "file": "/tmp/fcgi/System.Diagnostics.StackTrace.dll"
      },
      {
        "count": 2,
        "sizeBytes": 46448,
        "file": "/tmp/fcgi/System.Net.Sockets.dll"
      },
      {
        "count": 2,
        "sizeBytes": 45924,
        "file": "/usr/share/common-licenses/GFDL-1.3"
      },
      {
        "count": 2,
        "sizeBytes": 45578,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-advapi32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 45488,
        "file": "/tmp/fcgi/System.Xml.XPath.XDocument.dll"
      },
      {
        "count": 2,
        "sizeBytes": 44480,
        "file": "/tmp/fcgi/System.Security.SecureString.dll"
      },
      {
        "count": 2,
        "sizeBytes": 44164,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/user.exe"
      },
      {
        "count": 2,
        "sizeBytes": 43822,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-base-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 43126,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-base-l1-2-0.dll"
      },
      {
        "count": 4,
        "sizeBytes": 42786,
        "file": "/var/lib/apt/extended_states"
      },
      {
        "count": 2,
        "sizeBytes": 42684,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp120.dll"
      },
      {
        "count": 2,
        "sizeBytes": 42684,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp110.dll"
      },
      {
        "count": 2,
        "sizeBytes": 42592,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp100.dll"
      },
      {
        "count": 2,
        "sizeBytes": 42592,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/vcomp90.dll"
      },
      {
        "count": 4,
        "sizeBytes": 42124,
        "file": "/var/log/apt/eipp.log.xz"
      },
      {
        "count": 2,
        "sizeBytes": 41454,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-shlwapi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 41010,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-string-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 40862,
        "file": "/usr/share/common-licenses/GFDL-1.2"
      },
      {
        "count": 2,
        "sizeBytes": 40658,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-stdio-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 38944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-com-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 38726,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-com-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 38344,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-convert-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 38046,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-devices-config-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 38002,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-runtime-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 37946,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-devices-config-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 37274,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-private-l1-3-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 36444,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-shlwapi-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 36364,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l1-2-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 36184,
        "file": "/usr/share/common-licenses/GPL-2"
      },
      {
        "count": 2,
        "sizeBytes": 36118,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-kernel32-legacy-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 36050,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-grouppolicy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35906,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-domainjoin-netjoin-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35776,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gdi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35772,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processthreads-l1-1-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35734,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-appmodel-runtime-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35440,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-wmpointer-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 35056,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/stdole32.tlb"
      },
      {
        "count": 2,
        "sizeBytes": 34570,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-synch-l1-2-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 34570,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-synch-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 34532,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winusb.dll"
      },
      {
        "count": 2,
        "sizeBytes": 34442,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processthreads-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 34284,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-crt-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 34280,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33844,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-threadpool-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33742,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-kernel32-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33660,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33660,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-l1-2-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33452,
        "file": "/usr/share/common-licenses/MPL-2.0"
      },
      {
        "count": 2,
        "sizeBytes": 33312,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-private-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33260,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-kernel32-package-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 33026,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-threadpool-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32998,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-appmodel-identity-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32996,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-error-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32956,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-memory-l1-1-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32936,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-mm-mme-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32688,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-appmodel-runtime-l1-1-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32612,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-filesystem-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32488,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-misc-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32464,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/d3dim.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32434,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-shlwapi-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32386,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-winsvc-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32352,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-uicontext-ext-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32352,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-window-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32340,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-credentials-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32336,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/odbccu32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32280,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processthreads-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32254,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-ole32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32238,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-shlwapi-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 32156,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-string-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31902,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-private-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31706,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-devices-query-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31690,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-lsalookup-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31620,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-audit-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31568,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-sysinfo-l1-2-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31552,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-memory-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31552,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/security.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31250,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localregistry-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31250,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-registry-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31246,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31218,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-window-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31214,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-shlwapi-obsolete-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31028,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-string-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31026,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-conio-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 31012,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-uxtheme-themes-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30892,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-lsapolicy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30774,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gecko/plugin/npmshtml.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30540,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-registry-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30454,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/softpub.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30360,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/comcat.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30254,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winnls32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30226,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-libraryloader-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30216,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processenvironment-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30216,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processenvironment-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30206,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-sysinfo-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30168,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-appcompat-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30164,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-error-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 30058,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-lsalookup-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29898,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-authz-context-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29864,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-window-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29626,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ras-rasapi32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29612,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xpsprint.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29548,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/photometadatahandler.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29466,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-timezone-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29324,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-utility-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29298,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-winsvc-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29294,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-heap-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29260,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-mm-misc-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29202,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-advapi32-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29200,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-sysparams-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29192,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-errorhandling-l1-1-3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29176,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-locale-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29068,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xpssvcs.dll"
      },
      {
        "count": 2,
        "sizeBytes": 29040,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-perf-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28992,
        "file": "/usr/bin/locale-check"
      },
      {
        "count": 2,
        "sizeBytes": 28980,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-xstate-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28840,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-time-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28836,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processthreads-l1-1-3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28800,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-activedirectoryclient-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28798,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28724,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-namespace-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28670,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-quirks-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28650,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shcore-scaling-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28632,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-power-setting-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28566,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventing-controller-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28558,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-xstate-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28552,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-bem-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28520,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-windowserrorreporting-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28418,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/icmp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28412,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-security-credui-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28380,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-private-l1-1-4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28344,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-power-base-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28338,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shcore-stream-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28324,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28322,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventing-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28306,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28302,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-crt-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28300,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-realtime-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28292,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-namedpipe-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28258,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l1-2-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28252,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-atoms-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28186,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-namedpipe-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28184,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-core-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28184,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-security-cryptui-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28176,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-ntuser-sysparams-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28172,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shcore-thread-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28170,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-lsalookup-l2-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28168,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-errorhandling-l1-1-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28168,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-misc-l1-5-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28164,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shell-shellfolders-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28158,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-management-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28152,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-draw-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28148,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventing-provider-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28146,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-heap-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28142,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28142,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l2-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 28142,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-file-l2-1-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-user32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-console-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wmi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27414,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ksuser.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27370,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-base-private-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27344,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-render-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27318,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-dwmapi-ext-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27292,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-errorprivate-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27232,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mf3216.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27222,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-normalization-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27166,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-winrt-registration-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27152,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-version-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27148,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-wmpointer-l1-1-3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27148,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-delayload-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27142,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-kernel32-package-current-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27134,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-gdi-dpiinfo-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27130,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-appinit-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 27130,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-kernel32-private-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 26864,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rsabase.dll"
      },
      {
        "count": 2,
        "sizeBytes": 26792,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-synch-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 26792,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-cryptoapi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25840,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/lz32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-libraryloader-l1-2-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-draw-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-font-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-misc-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-url-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-libraryloader-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-libraryloader-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-registryuserspecific-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25768,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-sysinfo-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 25264,
        "file": "/usr/share/common-licenses/GPL-1"
      },
      {
        "count": 2,
        "sizeBytes": 24816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpnaddr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dplay.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dpnlobby.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24816,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shfolder.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24776,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/windowscodecs.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-message-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-psapi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-misc-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-dialogbox-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-process-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-message-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-path-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 24744,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-windowclass-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23792,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msimsg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-gdi-rgn-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-heap-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-mm-joystick-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-draw-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventing-classicprovider-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/iprop.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-gui-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-ntuser-rectangle-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-heap-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-interlocked-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-rectangle-ext-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-io-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-threadpool-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-io-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-psapi-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-windowclass-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-synch-ansi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-font-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-stringansi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-lsalookup-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-dc-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-obsolete-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-localization-obsolete-l1-3-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-provider-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-string-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-sddl-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-memory-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-string-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-crt-environment-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-comm-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-management-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-console-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-errorhandling-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-errorhandling-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-string-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-sidebyside-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-psapi-ansi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-debug-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 23720,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-interlocked-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22716,
        "file": "/usr/share/common-licenses/Apache-2.0"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-winevent-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-wow64-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-datetime-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-datetime-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-versionansi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-debug-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-version-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-version-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-util-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-delayload-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-toolhelp-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-fibers-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-threadpool-private-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-normaliz-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-shell32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-downlevel-version-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventing-consumer-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-eventlog-legacy-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-mm-time-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-ntuser-dc-access-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-rtcore-ntuser-draw-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-fibers-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-apiquery-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-stringloader-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-dc-create-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-security-systemfunctions-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-service-core-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shcore-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-shell-shellcom-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-shutdown-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-devcaps-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-handle-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-heap-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-rtlsupport-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-rtlsupport-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-gui-l1-3-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-keyboard-l1-3-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-mouse-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-job-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-job-l2-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-largeinteger-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-libraryloader-l1-2-2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-shell-comctl32-init-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-profile-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-processtopology-obsolete-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-gdi-dc-create-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-ntuser-window-l1-1-4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-gdi-devcaps-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-gdi-object-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-cursor-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-dc-access-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-privateprofile-l1-1-1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-shell-shell32-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-dpi-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-shell-comdlg32-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-oleacc-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-dpi-l1-2-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-syscolors-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ext-ms-win-rtcore-ntuser-rawinput-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22696,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/api-ms-win-core-wow64-l1-1-0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 22009,
        "file": "/var/cache/debconf/config.dat-old"
      },
      {
        "count": 2,
        "sizeBytes": 21868,
        "file": "/usr/share/doc/libsystemd0/copyright"
      },
      {
        "count": 2,
        "sizeBytes": 21868,
        "file": "/usr/share/doc/libudev1/copyright"
      },
      {
        "count": 2,
        "sizeBytes": 20880,
        "file": "/home/dotnet/.wine/drive_c/windows/twain_32/sane.ds"
      },
      {
        "count": 2,
        "sizeBytes": 19600,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/setupx.dll"
      },
      {
        "count": 2,
        "sizeBytes": 19478,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/compobj.dll"
      },
      {
        "count": 4,
        "sizeBytes": 16824,
        "file": "/var/log/alternatives.log"
      },
      {
        "count": 2,
        "sizeBytes": 15302,
        "file": "/usr/share/common-licenses/LGPL-3"
      },
      {
        "count": 2,
        "sizeBytes": 14846,
        "file": "/usr/share/doc/libudev1/changelog.Debian.gz"
      },
      {
        "count": 2,
        "sizeBytes": 14846,
        "file": "/usr/share/doc/libsystemd0/changelog.Debian.gz"
      },
      {
        "count": 2,
        "sizeBytes": 14096,
        "file": "/usr/share/common-licenses/CC0-1.0"
      },
      {
        "count": 2,
        "sizeBytes": 13664,
        "file": "/home/dotnet/.wine/drive_c/windows/system/mmsystem.dll"
      },
      {
        "count": 2,
        "sizeBytes": 13452,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/l_intl.nls"
      },
      {
        "count": 2,
        "sizeBytes": 13104,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 12222,
        "file": "/usr/share/common-licenses/Artistic"
      },
      {
        "count": 2,
        "sizeBytes": 11838,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olecli.dll"
      },
      {
        "count": 2,
        "sizeBytes": 11368,
        "file": "/usr/local/openresty/nginx/conf/nginx.conf"
      },
      {
        "count": 2,
        "sizeBytes": 10048,
        "file": "/var/lib/dpkg/info/base-files.postinst"
      },
      {
        "count": 2,
        "sizeBytes": 9944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2disp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 8234,
        "file": "/var/lib/dpkg/info/libudev1:amd64.symbols"
      },
      {
        "count": 2,
        "sizeBytes": 8170,
        "file": "/tmp/fcgi/fastcgi-mono-server4.exe.config"
      },
      {
        "count": 2,
        "sizeBytes": 7542,
        "file": "/home/dotnet/.bashrc"
      },
      {
        "count": 2,
        "sizeBytes": 6528,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winegstreamer.dll"
      },
      {
        "count": 2,
        "sizeBytes": 6478,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvideo.dll"
      },
      {
        "count": 2,
        "sizeBytes": 6212,
        "file": "/usr/share/base-files/dot.bashrc"
      },
      {
        "count": 2,
        "sizeBytes": 5634,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/avifile.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5546,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/display.drv"
      },
      {
        "count": 2,
        "sizeBytes": 5537,
        "file": "/etc/apt/sources.list"
      },
      {
        "count": 2,
        "sizeBytes": 5164,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winsock.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5088,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wpcap.dll"
      },
      {
        "count": 2,
        "sizeBytes": 5008,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ucrtbase.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4992,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/bcrypt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4984,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dbghelp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4976,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/advapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4968,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/odbc32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4960,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/iphlpapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4952,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mscms.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4952,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xapofx1_3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4952,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ntdll.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4952,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ws2_32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4952,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xapofx1_1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dxgi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4944,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winver.exe"
      },
      {
        "count": 2,
        "sizeBytes": 4936,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr100.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4936,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winevulkan.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4912,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcrt.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4904,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dnsapi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4904,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winex11.drv"
      },
      {
        "count": 2,
        "sizeBytes": 4888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wined3d.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4888,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/qcap.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4800,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/opengl32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4747,
        "file": "/etc/apt/trusted.gpg"
      },
      {
        "count": 2,
        "sizeBytes": 4630,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/shell.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_6.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_5.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4608,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4576,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_7.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4460,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/win32s16.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4368,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/storage.dll"
      },
      {
        "count": 4,
        "sizeBytes": 4349,
        "file": "/etc/passwd"
      },
      {
        "count": 2,
        "sizeBytes": 4312,
        "file": "/var/lib/dpkg/info/base-files.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 4308,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wintab.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4234,
        "file": "/var/lib/dpkg/info/base-files.list"
      },
      {
        "count": 2,
        "sizeBytes": 4094,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/imm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4056,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4056,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4056,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.vc90.crt_1fc8b3b9a1e18e3b_9.0.30729.6161_none_deadbeef/msvcr90.dll"
      },
      {
        "count": 2,
        "sizeBytes": 4056,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/x86_microsoft.vc80.crt_1fc8b3b9a1e18e3b_8.0.50727.4053_none_deadbeef/msvcr80.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3986,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msacm.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3856,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mp3dmod.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3544,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_8.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3544,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xaudio2_9.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3466,
        "file": "/usr/share/doc/libseccomp2/changelog.Debian.gz"
      },
      {
        "count": 3,
        "sizeBytes": 3377,
        "file": "/etc/passwd-"
      },
      {
        "count": 2,
        "sizeBytes": 3314,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/toolhelp.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3290,
        "file": "/home/dotnet/.wine/drive_c/windows/system/ddeml.dll"
      },
      {
        "count": 2,
        "sizeBytes": 3158,
        "file": "/usr/share/doc/perl-base/changelog.Debian.gz"
      },
      {
        "count": 2,
        "sizeBytes": 3150,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.windows.common-controls_6595b64144ccf1df_6.0.2600.2982_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 2998,
        "file": "/usr/share/common-licenses/BSD"
      },
      {
        "count": 2,
        "sizeBytes": 2907,
        "file": "/etc/pam.d/common-session"
      },
      {
        "count": 2,
        "sizeBytes": 2880,
        "file": "/etc/pam.d/common-password"
      },
      {
        "count": 2,
        "sizeBytes": 2870,
        "file": "/etc/pam.d/common-session-noninteractive"
      },
      {
        "count": 2,
        "sizeBytes": 2858,
        "file": "/usr/share/doc/libseccomp2/copyright"
      },
      {
        "count": 2,
        "sizeBytes": 2658,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2nls.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2498,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ctl3dv2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2494,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ctl3d.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2488,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winnls.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2470,
        "file": "/etc/pam.d/common-auth"
      },
      {
        "count": 2,
        "sizeBytes": 2456,
        "file": "/usr/share/doc/base-files/copyright"
      },
      {
        "count": 2,
        "sizeBytes": 2416,
        "file": "/etc/pam.d/common-account"
      },
      {
        "count": 2,
        "sizeBytes": 2388,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/keyboard.drv"
      },
      {
        "count": 4,
        "sizeBytes": 2351,
        "file": "/etc/shadow"
      },
      {
        "count": 2,
        "sizeBytes": 2244,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/olesvr.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2123,
        "file": "/usr/local/openresty/nginx/conf/fastcgi_params"
      },
      {
        "count": 2,
        "sizeBytes": 2086,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/commdlg.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2084,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/sound.drv"
      },
      {
        "count": 4,
        "sizeBytes": 2084,
        "file": "/etc/group"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/capi2032.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcrtd.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/opencl.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winepulse.drv"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/crtdll.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winevdm.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ctapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ddhelp.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dosx.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_6.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/winebus.sys"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dsound.vxd"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winepath.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winemenubuilder.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winejoystick.drv"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dwrite.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winebrowser.exe"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/drivers/mountmgr.sys"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/glu32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/secur32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/kerberos.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/avicap32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr70.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/l3codeca.acm"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winealsa.drv"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr120.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_5.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msvcr110.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xapofx1_5.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/msgsm32.acm"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xapofx1_4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/xapofx1_2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_7.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/netapi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wnaspi32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_4.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_0.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_1.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/openal32.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_3.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2064,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/x3daudio1_2.dll"
      },
      {
        "count": 2,
        "sizeBytes": 2060,
        "file": "/var/lib/dpkg/info/libseccomp2:amd64.symbols"
      },
      {
        "count": 2,
        "sizeBytes": 1992,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/mouse.drv"
      },
      {
        "count": 2,
        "sizeBytes": 1970,
        "file": "/usr/share/lintian/overrides/base-files"
      },
      {
        "count": 3,
        "sizeBytes": 1822,
        "file": "/etc/shadow-"
      },
      {
        "count": 4,
        "sizeBytes": 1740,
        "file": "/etc/gshadow"
      },
      {
        "count": 2,
        "sizeBytes": 1654,
        "file": "/var/lib/dpkg/info/base-files.postrm"
      },
      {
        "count": 2,
        "sizeBytes": 1652,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wing.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1640,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/stress.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1618,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ver.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1614,
        "file": "/home/dotnet/.profile"
      },
      {
        "count": 2,
        "sizeBytes": 1614,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/comm.drv"
      },
      {
        "count": 2,
        "sizeBytes": 1606,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/system.drv"
      },
      {
        "count": 2,
        "sizeBytes": 1598,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/typelib.dll"
      },
      {
        "count": 3,
        "sizeBytes": 1584,
        "file": "/etc/group-"
      },
      {
        "count": 2,
        "sizeBytes": 1542,
        "file": "/usr/share/base-files/staff-group-for-usr-local"
      },
      {
        "count": 2,
        "sizeBytes": 1542,
        "file": "/usr/share/base-files/info.dir"
      },
      {
        "count": 2,
        "sizeBytes": 1438,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/w32sys.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1384,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/krnl386.exe"
      },
      {
        "count": 2,
        "sizeBytes": 1380,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/lzexpand.dll"
      },
      {
        "count": 2,
        "sizeBytes": 1372,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/gdi.exe"
      },
      {
        "count": 3,
        "sizeBytes": 1323,
        "file": "/etc/gshadow-"
      },
      {
        "count": 2,
        "sizeBytes": 1182,
        "file": "/home/dotnet/.wine/drive_c/windows/inf/winehid.inf"
      },
      {
        "count": 2,
        "sizeBytes": 1162,
        "file": "/usr/share/base-files/profile"
      },
      {
        "count": 2,
        "sizeBytes": 1004,
        "file": "/etc/nsswitch.conf"
      },
      {
        "count": 2,
        "sizeBytes": 964,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/wineps16.drv"
      },
      {
        "count": 2,
        "sizeBytes": 960,
        "file": "/home/dotnet/.wine/drive_c/windows/system.ini"
      },
      {
        "count": 2,
        "sizeBytes": 942,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/rasapi16.dll"
      },
      {
        "count": 2,
        "sizeBytes": 904,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2thk.dll"
      },
      {
        "count": 2,
        "sizeBytes": 890,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2conv.dll"
      },
      {
        "count": 2,
        "sizeBytes": 868,
        "file": "/home/dotnet/.wine/drive_c/windows/inf/winebus.inf"
      },
      {
        "count": 2,
        "sizeBytes": 834,
        "file": "/home/dotnet/.wine/drive_c/windows/twain.dll"
      },
      {
        "count": 2,
        "sizeBytes": 800,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/win87em.dll"
      },
      {
        "count": 2,
        "sizeBytes": 798,
        "file": "/var/lib/dpkg/info/base-files.prerm"
      },
      {
        "count": 2,
        "sizeBytes": 760,
        "file": "/usr/lib/os-release"
      },
      {
        "count": 2,
        "sizeBytes": 754,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.vc80.crt_1fc8b3b9a1e18e3b_8.0.50727.4053_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 754,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.vc90.crt_1fc8b3b9a1e18e3b_9.0.30729.6161_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 726,
        "file": "/usr/share/base-files/profile.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 672,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/windebug.dll"
      },
      {
        "count": 2,
        "sizeBytes": 652,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.windows.gdiplus_6595b64144ccf1df_1.0.6000.16386_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 650,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft-windows-msxml30_31bf3856ad364e35_6.0.6000.16386_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 650,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft-windows-msxml60_31bf3856ad364e35_6.0.6000.16386_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 634,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.vc80.atl_1fc8b3b9a1e18e3b_8.0.50727.4053_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 634,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.vc90.atl_1fc8b3b9a1e18e3b_9.0.30729.6161_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 618,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.windows.gdiplus_6595b64144ccf1df_1.1.7601.23038_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 618,
        "file": "/home/dotnet/.wine/drive_c/windows/winsxs/manifests/x86_microsoft.msxml2_6bd6b9abf345378f_4.1.0.0_none_deadbeef.manifest"
      },
      {
        "count": 2,
        "sizeBytes": 574,
        "file": "/var/lib/dpkg/info/base-files.conffiles"
      },
      {
        "count": 2,
        "sizeBytes": 572,
        "file": "/usr/share/base-files/motd"
      },
      {
        "count": 2,
        "sizeBytes": 562,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/ole2prox.dll"
      },
      {
        "count": 2,
        "sizeBytes": 546,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/dispdib.dll"
      },
      {
        "count": 2,
        "sizeBytes": 536,
        "file": "/var/lib/dpkg/info/libseccomp2:amd64.list"
      },
      {
        "count": 2,
        "sizeBytes": 514,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winoldap.mod"
      },
      {
        "count": 2,
        "sizeBytes": 514,
        "file": "/home/dotnet/.wine/drive_c/windows/winhelp.exe"
      },
      {
        "count": 2,
        "sizeBytes": 510,
        "file": "/home/dotnet/.wine/drive_c/windows/rundll.exe"
      },
      {
        "count": 2,
        "sizeBytes": 506,
        "file": "/var/lib/dpkg/info/libsystemd0:amd64.list"
      },
      {
        "count": 2,
        "sizeBytes": 503,
        "file": "/rules/server.d/root.conf"
      },
      {
        "count": 2,
        "sizeBytes": 476,
        "file": "/var/lib/dpkg/info/libudev1:amd64.list"
      },
      {
        "count": 2,
        "sizeBytes": 458,
        "file": "/var/lib/dpkg/info/libseccomp2:amd64.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 452,
        "file": "/var/lib/dpkg/info/libsystemd0:amd64.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 440,
        "file": "/home/dotnet/.bash_logout"
      },
      {
        "count": 2,
        "sizeBytes": 434,
        "file": "/var/lib/dpkg/info/libudev1:amd64.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 416,
        "file": "/home/dotnet/.wine/drive_c/windows/system32/winaspi.dll"
      },
      {
        "count": 2,
        "sizeBytes": 346,
        "file": "/usr/lib/systemd/system/motd-news.service"
      },
      {
        "count": 2,
        "sizeBytes": 322,
        "file": "/usr/lib/systemd/system/motd-news.timer"
      },
      {
        "count": 2,
        "sizeBytes": 322,
        "file": "/usr/share/base-files/dot.profile"
      },
      {
        "count": 2,
        "sizeBytes": 300,
        "file": "/var/lib/dpkg/diversions"
      },
      {
        "count": 2,
        "sizeBytes": 206,
        "file": "/etc/lsb-release"
      },
      {
        "count": 2,
        "sizeBytes": 190,
        "file": "/var/lib/pam/session"
      },
      {
        "count": 2,
        "sizeBytes": 182,
        "file": "/usr/share/base-files/networks"
      },
      {
        "count": 2,
        "sizeBytes": 177,
        "file": "/var/lib/pam/auth"
      },
      {
        "count": 2,
        "sizeBytes": 152,
        "file": "/var/lib/pam/account"
      },
      {
        "count": 2,
        "sizeBytes": 150,
        "file": "/var/lib/pam/session-noninteractive"
      },
      {
        "count": 2,
        "sizeBytes": 146,
        "file": "/var/lib/dpkg/info/libseccomp2:amd64.triggers"
      },
      {
        "count": 2,
        "sizeBytes": 146,
        "file": "/var/lib/dpkg/info/libsystemd0:amd64.triggers"
      },
      {
        "count": 2,
        "sizeBytes": 146,
        "file": "/var/lib/dpkg/info/libudev1:amd64.triggers"
      },
      {
        "count": 2,
        "sizeBytes": 144,
        "file": "/usr/share/base-files/dot.profile.md5sums"
      },
      {
        "count": 2,
        "sizeBytes": 138,
        "file": "/var/lib/pam/password"
      },
      {
        "count": 2,
        "sizeBytes": 112,
        "file": "/var/lib/systemd/deb-systemd-helper-enabled/motd-news.timer.dsh-also"
      },
      {
        "count": 2,
        "sizeBytes": 100,
        "file": "/app/index.html"
      },
      {
        "count": 2,
        "sizeBytes": 98,
        "file": "/var/lib/dpkg/info/libudev1:amd64.shlibs"
      },
      {
        "count": 2,
        "sizeBytes": 72,
        "file": "/var/lib/dpkg/info/libseccomp2:amd64.shlibs"
      },
      {
        "count": 3,
        "sizeBytes": 66,
        "file": "/etc/subgid"
      },
      {
        "count": 3,
        "sizeBytes": 66,
        "file": "/etc/subuid"
      },
      {
        "count": 2,
        "sizeBytes": 65,
        "file": "/var/lib/dpkg/statoverride"
      },
      {
        "count": 2,
        "sizeBytes": 50,
        "file": "/etc/issue"
      },
      {
        "count": 2,
        "sizeBytes": 50,
        "file": "/var/lib/dpkg/info/libsystemd0:amd64.shlibs"
      },
      {
        "count": 2,
        "sizeBytes": 49,
        "file": "/var/lib/pam/seen"
      },
      {
        "count": 2,
        "sizeBytes": 36,
        "file": "/etc/issue.net"
      },
      {
        "count": 2,
        "sizeBytes": 33,
        "file": "/etc/machine-id"
      },
      {
        "count": 2,
        "sizeBytes": 24,
        "file": "/home/dotnet/.wine/.update-timestamp"
      },
      {
        "count": 2,
        "sizeBytes": 23,
        "file": "/etc/subuid-"
      },
      {
        "count": 2,
        "sizeBytes": 23,
        "file": "/etc/subgid-"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/My Music"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/include"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/share/doc/base-files/FAQ"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/var/lib/dpkg/updates"
      },
      {
        "count": 3,
        "sizeBytes": 0,
        "file": "/var/lib/dpkg/triggers/Unincorp"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/var/lib/dpkg/triggers/Lock"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/Templates"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/var/lib/dpkg/lock"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/My Videos"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/My Pictures"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/share/common-licenses/LGPL"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/etc/os-release"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/share/common-licenses/GFDL"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/var/cache/apt/archives/partial"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/lib/x86_64-linux-gnu/libseccomp.so.2"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/share/common-licenses/GPL"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/Downloads"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/src"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/share/man"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/man"
      },
      {
        "count": 3,
        "sizeBytes": 0,
        "file": "/etc/.pwd.lock"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/games"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/local/etc"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/tmp"
      },
      {
        "count": 3,
        "sizeBytes": 0,
        "file": "/var/cache/apt/archives/lock"
      },
      {
        "count": 3,
        "sizeBytes": 0,
        "file": "/var/cache/debconf/passwords.dat"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/lib/x86_64-linux-gnu/libsystemd.so.0"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/usr/lib/x86_64-linux-gnu/libudev.so.1"
      },
      {
        "count": 3,
        "sizeBytes": 0,
        "file": "/var/lib/dpkg/lock-frontend"
      },
      {
        "count": 4,
        "sizeBytes": 0,
        "file": "/var/lib/apt/lists"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/My Documents"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/home/dotnet/.wine/drive_c/users/dotnet/Temp"
      },
      {
        "count": 2,
        "sizeBytes": 0,
        "file": "/etc/apt/trusted.gpg.d"
      }
    ]
  }
}
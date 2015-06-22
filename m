Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z70IH-0006dM-Pe
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:53:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70IB-0006Qw-8d
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z70I9-0000RP-Al
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:53:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z70I2-0000Nq-7c; Mon, 22 Jun 2015 07:53:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0662341E52;
	Mon, 22 Jun 2015 14:53:25 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E2816A5D;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9263 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:19 +0300
Message-Id: <f27dd001dfa1a0d9dc7f0099c22d5b717647b971.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/21] configure: rearrange --help and
	consolidate enable/disable together
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 11:53:39 -0000

This is an attempt to rearrange configure --help output a bit
and consolidate pairs of --enable/disable into its own section.

After this, help text is easier to sort, manage and read.
More descriptive text can be added as well, since we now have
more space.

While at it, mention en/dis-able-vte.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 196 ++++++++++++++++++++++++--------------------------------------
 1 file changed, 74 insertions(+), 122 deletions(-)

diff --git a/configure b/configure
index a5d8924..f9b49a7 100755
--- a/configure
+++ b/configure
@@ -1277,29 +1277,10 @@ Advanced options (experts only):
   --sysconfdir=PATH        install config in PATH$confsuffix
   --localstatedir=PATH     install local state in PATH (set at runtime on win32)
   --with-confsuffix=SUFFIX suffix for QEMU data inside datadir/libdir/sysconfdir [$confsuffix]
-  --enable-modules         enable modules support
-  --enable-debug-tcg       enable TCG debugging
-  --disable-debug-tcg      disable TCG debugging (default)
-  --enable-debug-info      enable debugging information (default)
-  --disable-debug-info     disable debugging information
   --enable-debug           enable common debug build options
-  --enable-sparse          enable sparse checker
-  --disable-sparse         disable sparse checker (default)
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
-  --disable-sdl            disable SDL
-  --enable-sdl             enable SDL
-  --with-sdlabi            select preferred SDL ABI 1.2 or 2.0
-  --disable-gtk            disable gtk UI
-  --enable-gtk             enable gtk UI
-  --with-gtkabi            select preferred GTK ABI 2.0 or 3.0
-  --disable-virtfs         disable VirtFS
-  --enable-virtfs          enable VirtFS
-  --disable-vnc            disable VNC
-  --enable-vnc             enable VNC
-  --disable-cocoa          disable Cocoa (Mac OS X only)
-  --enable-cocoa           enable Cocoa (default on Mac OS X)
   --audio-drv-list=LIST    set audio drivers list:
                            Available drivers: $audio_possible_drivers
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
@@ -1309,117 +1290,88 @@ Advanced options (experts only):
   --block-drv-ro-whitelist=L
                            set block driver read-only whitelist
                            (affects only QEMU, not qemu-img)
-  --disable-xen            disable xen backend driver support
-  --enable-xen             enable xen backend driver support
-  --disable-xen-pci-passthrough
-  --enable-xen-pci-passthrough
-  --disable-brlapi         disable BrlAPI
-  --enable-brlapi          enable BrlAPI
-  --disable-vnc-tls        disable TLS encryption for VNC server
-  --enable-vnc-tls         enable TLS encryption for VNC server
-  --disable-vnc-sasl       disable SASL encryption for VNC server
-  --enable-vnc-sasl        enable SASL encryption for VNC server
-  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server
-  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server
-  --disable-vnc-png        disable PNG compression for VNC server (default)
-  --enable-vnc-png         enable PNG compression for VNC server
-  --disable-vnc-ws         disable Websockets support for VNC server
-  --enable-vnc-ws          enable Websockets support for VNC server
-  --disable-curses         disable curses output
-  --enable-curses          enable curses output
-  --disable-curl           disable curl connectivity
-  --enable-curl            enable curl connectivity
-  --disable-fdt            disable fdt device tree
-  --enable-fdt             enable fdt device tree
-  --disable-bluez          disable bluez stack connectivity
-  --enable-bluez           enable bluez stack connectivity
-  --disable-slirp          disable SLIRP userspace network connectivity
-  --disable-kvm            disable KVM acceleration support
-  --enable-kvm             enable KVM acceleration support
-  --disable-rdma           disable RDMA-based migration support
-  --enable-rdma            enable RDMA-based migration support
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
-  --enable-system          enable all system emulation targets
-  --disable-system         disable all system emulation targets
-  --enable-user            enable supported user emulation targets
-  --disable-user           disable all user emulation targets
-  --enable-linux-user      enable all linux usermode emulation targets
-  --disable-linux-user     disable all linux usermode emulation targets
-  --enable-bsd-user        enable all BSD usermode emulation targets
-  --disable-bsd-user       disable all BSD usermode emulation targets
-  --enable-guest-base      enable GUEST_BASE support for usermode
-                           emulation targets
-  --disable-guest-base     disable GUEST_BASE support
-  --enable-pie             build Position Independent Executables
-  --disable-pie            do not build Position Independent Executables
-  --oss-lib                path to OSS library
-  --cpu=CPU                Build for host CPU [$cpu]
-  --disable-uuid           disable uuid support
-  --enable-uuid            enable uuid support
-  --disable-vde            disable support for vde network
-  --enable-vde             enable support for vde network
-  --disable-netmap         disable support for netmap network
-  --enable-netmap          enable support for netmap network
-  --disable-linux-aio      disable Linux AIO support
-  --enable-linux-aio       enable Linux AIO support
-  --disable-cap-ng         disable libcap-ng support
-  --enable-cap-ng          enable libcap-ng support
-  --disable-attr           disable attr and xattr support
-  --enable-attr            enable attr and xattr support
-  --disable-blobs          disable installing provided firmware blobs
-  --enable-docs            enable documentation build
-  --disable-docs           disable documentation build
-  --disable-vhost-net      disable vhost-net acceleration support
-  --enable-vhost-net       enable vhost-net acceleration support
   --enable-trace-backends=B Set trace backend
                            Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
-  --disable-spice          disable spice
-  --enable-spice           enable spice
-  --enable-rbd             enable building the rados block device (rbd)
-  --disable-libiscsi       disable iscsi support
-  --enable-libiscsi        enable iscsi support
-  --disable-libnfs         disable nfs support
-  --enable-libnfs          enable nfs support
-  --disable-smartcard-nss  disable smartcard nss support
-  --enable-smartcard-nss   enable smartcard nss support
-  --disable-libusb         disable libusb (for usb passthrough)
-  --enable-libusb          enable libusb (for usb passthrough)
-  --disable-usb-redir      disable usb network redirection support
-  --enable-usb-redir       enable usb network redirection support
-  --enable-lzo             enable the support of lzo compression library
-  --enable-snappy          enable the support of snappy compression library
-  --enable-bzip2           enable the support of bzip2 compression library (for
-                           reading bzip2-compressed dmg images)
-  --disable-guest-agent    disable building of the QEMU Guest Agent
-  --enable-guest-agent     enable building of the QEMU Guest Agent
-  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
-  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
-  --disable-seccomp        disable seccomp support
-  --enable-seccomp         enable seccomp support
+  --disable-slirp          disable SLIRP userspace network connectivity
+  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --oss-lib                path to OSS library
+  --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            gthread, ucontext, sigaltstack, windows
-  --disable-coroutine-pool disable coroutine freelist (worse performance)
-  --enable-coroutine-pool  enable coroutine freelist (better performance)
-  --enable-glusterfs       enable GlusterFS backend
-  --disable-glusterfs      disable GlusterFS backend
-  --enable-archipelago     enable Archipelago backend
-  --disable-archipelago    disable Archipelago backend
   --enable-gcov            enable test coverage analysis with gcov
   --gcov=GCOV              use specified gcov [$gcov_tool]
-  --disable-tpm            disable TPM support
-  --enable-tpm             enable TPM support
-  --disable-libssh2        disable ssh block device support
-  --enable-libssh2         enable ssh block device support
-  --disable-vhdx           disable support for the Microsoft VHDX image format
-  --enable-vhdx            enable support for the Microsoft VHDX image format
-  --disable-quorum         disable quorum block filter support
-  --enable-quorum          enable quorum block filter support
-  --disable-numa           disable libnuma support
-  --enable-numa            enable libnuma support
-  --disable-tcmalloc       disable tcmalloc support
-  --enable-tcmalloc        enable tcmalloc support
+  --disable-blobs          disable installing provided firmware blobs
+  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
+  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
+
+Optional features, enabled with --enable-FEATURE and
+disabled with --disable-FEATURE, default is enabled if available:
+
+  system          all system emulation targets
+  user            supported user emulation targets
+  linux-user      all linux usermode emulation targets
+  bsd-user        all BSD usermode emulation targets
+  guest-base      GUEST_BASE support for usermode emulation targets
+  docs            build documentation
+  guest-agent     build the QEMU Guest Agent
+  pie             Position Independent Executables
+  modules         modules support
+  debug-tcg       TCG debugging (default is disabled)
+  debug-info      debugging information
+  sparse          sparse checker
+
+  sdl             SDL UI
+  --with-sdlabi     select preferred SDL ABI 1.2 or 2.0
+  gtk             gtk UI
+  --with-gtkabi     select preferred GTK ABI 2.0 or 3.0
+  vte             vte support for the gtk UI
+  curses          curses UI
+  vnc             VNC UI support
+  vnc-tls         TLS encryption for VNC server
+  vnc-sasl        SASL encryption for VNC server
+  vnc-jpeg        JPEG lossy compression for VNC server
+  vnc-png         PNG compression for VNC server
+  vnc-ws          Websockets support for VNC server
+  cocoa           Cocoa UI (Mac OS X only)
+  virtfs          VirtFS
+  xen             xen backend driver support
+  xen-pci-passthrough
+  brlapi          BrlAPI (Braile)
+  curl            curl connectivity
+  fdt             fdt device tree
+  bluez           bluez stack connectivity
+  kvm             KVM acceleration support
+  rdma            RDMA-based migration support
+  uuid            uuid support
+  vde             support for vde network
+  netmap          support for netmap network
+  linux-aio       Linux AIO support
+  cap-ng          libcap-ng support
+  attr            attr and xattr support
+  vhost-net       vhost-net acceleration support
+  spice           spice
+  rbd             rados block device (rbd)
+  libiscsi        iscsi support
+  libnfs          nfs support
+  smartcard-nss   smartcard nss support
+  libusb          libusb (for usb passthrough)
+  usb-redir       usb network redirection support
+  lzo             support of lzo compression library
+  snappy          support of snappy compression library
+  bzip2           support of bzip2 compression library
+                  (for reading bzip2-compressed dmg images)
+  seccomp         seccomp support
+  coroutine-pool  coroutine freelist (better performance)
+  glusterfs       GlusterFS backend
+  archipelago     Archipelago backend
+  tpm             TPM support
+  libssh2         ssh block device support
+  vhdx            support for the Microsoft VHDX image format
+  quorum          quorum block filter support
+  numa            libnuma support
+  tcmalloc        tcmalloc support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
-- 
2.1.4



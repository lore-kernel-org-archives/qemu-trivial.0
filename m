Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VtONb-0002MY-Ng
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2013 16:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtONV-0002F7-QM
	for qemu-trivial@nongnu.org; Wed, 18 Dec 2013 16:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtONR-0002Js-2O
	for qemu-trivial@nongnu.org; Wed, 18 Dec 2013 16:10:01 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:48222
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VtONE-0002Ho-Ap; Wed, 18 Dec 2013 16:09:44 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 5AE4717F6D6; Wed, 18 Dec 2013 22:09:39 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed, 18 Dec 2013 22:09:39 +0100
Message-Id: <1387400979-20435-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] configure: Rewrite code for help message
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
X-List-Received-Date: Wed, 18 Dec 2013 21:10:06 -0000

In the new form most lines of the code now look like the final output:
there is no leading echo command and the lines are shorter.

The resulting output is nearly identical: the only difference is a blank
character which was deliberately removed:

@@ -8,7 +8,7 @@
   --interp-prefix=PREFIX   where to find shared libraries, etc.
                            use %M for cpu name [/usr/gnemul/qemu-%M]
   --target-list=LIST       set target list (default: build everything)
-                           Available targets:  alpha-softmmu arm-softmmu
+                           Available targets: alpha-softmmu arm-softmmu
                            cris-softmmu i386-softmmu lm32-softmmu m68k-softmmu
                            microblaze-softmmu microblazeel-softmmu mips-softmmu
                            mips64-softmmu mips64el-softmmu mipsel-softmmu

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch might break other patches which are waiting for being pulled,
so I don't know whether it can be applied via qemu-trivial.

Regards,
Stefan

 configure |  324 ++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 162 insertions(+), 162 deletions(-)

diff --git a/configure b/configure
index edfea95..f81a629 100755
--- a/configure
+++ b/configure
@@ -1074,169 +1074,169 @@ cat << EOF
 Usage: configure [options]
 Options: [defaults in brackets after descriptions]
 
+Standard options:
+  --help                   print this message
+  --prefix=PREFIX          install in PREFIX [$prefix]
+  --interp-prefix=PREFIX   where to find shared libraries, etc.
+                           use %M for cpu name [$interp_prefix]
+  --target-list=LIST       set target list (default: build everything)
+$(echo Available targets: $default_target_list | \
+  fold -s -w 53 | sed -e 's/^/                           /')
+
+Advanced options (experts only):
+  --source-path=PATH       path of source code [$source_path]
+  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
+  --cc=CC                  use C compiler CC [$cc]
+  --iasl=IASL              use ACPI compiler IASL [$iasl]
+  --host-cc=CC             use C compiler CC [$host_cc] for code run at
+                           build time
+  --cxx=CXX                use C++ compiler CXX [$cxx]
+  --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
+  --extra-cflags=CFLAGS    append extra C compiler flags QEMU_CFLAGS
+  --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
+  --make=MAKE              use specified make [$make]
+  --install=INSTALL        use specified install [$install]
+  --python=PYTHON          use specified python [$python]
+  --smbd=SMBD              use specified smbd [$smbd]
+  --static                 enable static build [$static]
+  --mandir=PATH            install man pages in PATH
+  --datadir=PATH           install firmware in PATH$confsuffix
+  --docdir=PATH            install documentation in PATH$confsuffix
+  --bindir=PATH            install binaries in PATH
+  --libdir=PATH            install libraries in PATH
+  --sysconfdir=PATH        install config in PATH$confsuffix
+  --localstatedir=PATH     install local state in PATH (set at runtime on win32)
+  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir and sysconfdir [$confsuffix]
+  --enable-debug-tcg       enable TCG debugging
+  --disable-debug-tcg      disable TCG debugging (default)
+  --enable-debug-info       enable debugging information (default)
+  --disable-debug-info      disable debugging information
+  --enable-debug           enable common debug build options
+  --enable-sparse          enable sparse checker
+  --disable-sparse         disable sparse checker (default)
+  --disable-strip          disable stripping binaries
+  --disable-werror         disable compilation abort on warning
+  --disable-sdl            disable SDL
+  --enable-sdl             enable SDL
+  --disable-gtk            disable gtk UI
+  --enable-gtk             enable gtk UI
+  --disable-virtfs         disable VirtFS
+  --enable-virtfs          enable VirtFS
+  --disable-vnc            disable VNC
+  --enable-vnc             enable VNC
+  --disable-cocoa          disable Cocoa (Mac OS X only)
+  --enable-cocoa           enable Cocoa (default on Mac OS X)
+  --audio-drv-list=LIST    set audio drivers list:
+                           Available drivers: $audio_possible_drivers
+  --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
+  --block-drv-rw-whitelist=L
+                           set block driver read-write whitelist
+                           (affects only QEMU, not qemu-img)
+  --block-drv-ro-whitelist=L
+                           set block driver read-only whitelist
+                           (affects only QEMU, not qemu-img)
+  --disable-xen            disable xen backend driver support
+  --enable-xen             enable xen backend driver support
+  --disable-xen-pci-passthrough
+  --enable-xen-pci-passthrough
+  --disable-brlapi         disable BrlAPI
+  --enable-brlapi          enable BrlAPI
+  --disable-vnc-tls        disable TLS encryption for VNC server
+  --enable-vnc-tls         enable TLS encryption for VNC server
+  --disable-vnc-sasl       disable SASL encryption for VNC server
+  --enable-vnc-sasl        enable SASL encryption for VNC server
+  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server
+  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server
+  --disable-vnc-png        disable PNG compression for VNC server (default)
+  --enable-vnc-png         enable PNG compression for VNC server
+  --disable-vnc-ws         disable Websockets support for VNC server
+  --enable-vnc-ws          enable Websockets support for VNC server
+  --disable-curses         disable curses output
+  --enable-curses          enable curses output
+  --disable-curl           disable curl connectivity
+  --enable-curl            enable curl connectivity
+  --disable-fdt            disable fdt device tree
+  --enable-fdt             enable fdt device tree
+  --disable-bluez          disable bluez stack connectivity
+  --enable-bluez           enable bluez stack connectivity
+  --disable-slirp          disable SLIRP userspace network connectivity
+  --disable-kvm            disable KVM acceleration support
+  --enable-kvm             enable KVM acceleration support
+  --disable-rdma           disable RDMA-based migration support
+  --enable-rdma            enable RDMA-based migration support
+  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-system          enable all system emulation targets
+  --disable-system         disable all system emulation targets
+  --enable-user            enable supported user emulation targets
+  --disable-user           disable all user emulation targets
+  --enable-linux-user      enable all linux usermode emulation targets
+  --disable-linux-user     disable all linux usermode emulation targets
+  --enable-bsd-user        enable all BSD usermode emulation targets
+  --disable-bsd-user       disable all BSD usermode emulation targets
+  --enable-guest-base      enable GUEST_BASE support for usermode
+                           emulation targets
+  --disable-guest-base     disable GUEST_BASE support
+  --enable-pie             build Position Independent Executables
+  --disable-pie            do not build Position Independent Executables
+  --fmod-lib               path to FMOD library
+  --fmod-inc               path to FMOD includes
+  --oss-lib                path to OSS library
+  --enable-uname-release=R Return R for uname -r in usermode emulation
+  --cpu=CPU                Build for host CPU [$cpu]
+  --disable-uuid           disable uuid support
+  --enable-uuid            enable uuid support
+  --disable-vde            disable support for vde network
+  --enable-vde             enable support for vde network
+  --disable-netmap         disable support for netmap network
+  --enable-netmap          enable support for netmap network
+  --disable-linux-aio      disable Linux AIO support
+  --enable-linux-aio       enable Linux AIO support
+  --disable-cap-ng         disable libcap-ng support
+  --enable-cap-ng          enable libcap-ng support
+  --disable-attr           disables attr and xattr support
+  --enable-attr            enable attr and xattr support
+  --disable-blobs          disable installing provided firmware blobs
+  --enable-docs            enable documentation build
+  --disable-docs           disable documentation build
+  --disable-vhost-net      disable vhost-net acceleration support
+  --enable-vhost-net       enable vhost-net acceleration support
+  --enable-trace-backend=B Set trace backend
+                           Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
+  --with-trace-file=NAME   Full PATH,NAME of file to store traces
+                           Default:trace-<pid>
+  --disable-spice          disable spice
+  --enable-spice           enable spice
+  --enable-rbd             enable building the rados block device (rbd)
+  --disable-libiscsi       disable iscsi support
+  --enable-libiscsi        enable iscsi support
+  --disable-smartcard-nss  disable smartcard nss support
+  --enable-smartcard-nss   enable smartcard nss support
+  --disable-libusb         disable libusb (for usb passthrough)
+  --enable-libusb          enable libusb (for usb passthrough)
+  --disable-usb-redir      disable usb network redirection support
+  --enable-usb-redir       enable usb network redirection support
+  --disable-guest-agent    disable building of the QEMU Guest Agent
+  --enable-guest-agent     enable building of the QEMU Guest Agent
+  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
+  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
+  --disable-seccomp        disable seccomp support
+  --enable-seccomp         enables seccomp support
+  --with-coroutine=BACKEND coroutine backend. Supported options:
+                           gthread, ucontext, sigaltstack, windows
+  --disable-coroutine-pool disable coroutine freelist (worse performance)
+  --enable-coroutine-pool  enable coroutine freelist (better performance)
+  --enable-glusterfs       enable GlusterFS backend
+  --disable-glusterfs      disable GlusterFS backend
+  --enable-gcov            enable test coverage analysis with gcov
+  --gcov=GCOV              use specified gcov [$gcov_tool]
+  --enable-tpm             enable TPM support
+  --disable-libssh2        disable ssh block device support
+  --enable-libssh2         enable ssh block device support
+  --disable-vhdx           disables support for the Microsoft VHDX image format
+  --enable-vhdx            enable support for the Microsoft VHDX image format
+
+NOTE: The object files are built at the place where configure is launched
 EOF
-echo "Standard options:"
-echo "  --help                   print this message"
-echo "  --prefix=PREFIX          install in PREFIX [$prefix]"
-echo "  --interp-prefix=PREFIX   where to find shared libraries, etc."
-echo "                           use %M for cpu name [$interp_prefix]"
-echo "  --target-list=LIST       set target list (default: build everything)"
-echo "Available targets: $default_target_list" | \
-    fold -s -w 53 | sed -e 's/^/                           /'
-echo ""
-echo "Advanced options (experts only):"
-echo "  --source-path=PATH       path of source code [$source_path]"
-echo "  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]"
-echo "  --cc=CC                  use C compiler CC [$cc]"
-echo "  --iasl=IASL              use ACPI compiler IASL [$iasl]"
-echo "  --host-cc=CC             use C compiler CC [$host_cc] for code run at"
-echo "                           build time"
-echo "  --cxx=CXX                use C++ compiler CXX [$cxx]"
-echo "  --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]"
-echo "  --extra-cflags=CFLAGS    append extra C compiler flags QEMU_CFLAGS"
-echo "  --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS"
-echo "  --make=MAKE              use specified make [$make]"
-echo "  --install=INSTALL        use specified install [$install]"
-echo "  --python=PYTHON          use specified python [$python]"
-echo "  --smbd=SMBD              use specified smbd [$smbd]"
-echo "  --static                 enable static build [$static]"
-echo "  --mandir=PATH            install man pages in PATH"
-echo "  --datadir=PATH           install firmware in PATH$confsuffix"
-echo "  --docdir=PATH            install documentation in PATH$confsuffix"
-echo "  --bindir=PATH            install binaries in PATH"
-echo "  --libdir=PATH            install libraries in PATH"
-echo "  --sysconfdir=PATH        install config in PATH$confsuffix"
-echo "  --localstatedir=PATH     install local state in PATH (set at runtime on win32)"
-echo "  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir and sysconfdir [$confsuffix]"
-echo "  --enable-debug-tcg       enable TCG debugging"
-echo "  --disable-debug-tcg      disable TCG debugging (default)"
-echo "  --enable-debug-info       enable debugging information (default)"
-echo "  --disable-debug-info      disable debugging information"
-echo "  --enable-debug           enable common debug build options"
-echo "  --enable-sparse          enable sparse checker"
-echo "  --disable-sparse         disable sparse checker (default)"
-echo "  --disable-strip          disable stripping binaries"
-echo "  --disable-werror         disable compilation abort on warning"
-echo "  --disable-sdl            disable SDL"
-echo "  --enable-sdl             enable SDL"
-echo "  --disable-gtk            disable gtk UI"
-echo "  --enable-gtk             enable gtk UI"
-echo "  --disable-virtfs         disable VirtFS"
-echo "  --enable-virtfs          enable VirtFS"
-echo "  --disable-vnc            disable VNC"
-echo "  --enable-vnc             enable VNC"
-echo "  --disable-cocoa          disable Cocoa (Mac OS X only)"
-echo "  --enable-cocoa           enable Cocoa (default on Mac OS X)"
-echo "  --audio-drv-list=LIST    set audio drivers list:"
-echo "                           Available drivers: $audio_possible_drivers"
-echo "  --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L"
-echo "  --block-drv-rw-whitelist=L"
-echo "                           set block driver read-write whitelist"
-echo "                           (affects only QEMU, not qemu-img)"
-echo "  --block-drv-ro-whitelist=L"
-echo "                           set block driver read-only whitelist"
-echo "                           (affects only QEMU, not qemu-img)"
-echo "  --disable-xen            disable xen backend driver support"
-echo "  --enable-xen             enable xen backend driver support"
-echo "  --disable-xen-pci-passthrough"
-echo "  --enable-xen-pci-passthrough"
-echo "  --disable-brlapi         disable BrlAPI"
-echo "  --enable-brlapi          enable BrlAPI"
-echo "  --disable-vnc-tls        disable TLS encryption for VNC server"
-echo "  --enable-vnc-tls         enable TLS encryption for VNC server"
-echo "  --disable-vnc-sasl       disable SASL encryption for VNC server"
-echo "  --enable-vnc-sasl        enable SASL encryption for VNC server"
-echo "  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server"
-echo "  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server"
-echo "  --disable-vnc-png        disable PNG compression for VNC server (default)"
-echo "  --enable-vnc-png         enable PNG compression for VNC server"
-echo "  --disable-vnc-ws         disable Websockets support for VNC server"
-echo "  --enable-vnc-ws          enable Websockets support for VNC server"
-echo "  --disable-curses         disable curses output"
-echo "  --enable-curses          enable curses output"
-echo "  --disable-curl           disable curl connectivity"
-echo "  --enable-curl            enable curl connectivity"
-echo "  --disable-fdt            disable fdt device tree"
-echo "  --enable-fdt             enable fdt device tree"
-echo "  --disable-bluez          disable bluez stack connectivity"
-echo "  --enable-bluez           enable bluez stack connectivity"
-echo "  --disable-slirp          disable SLIRP userspace network connectivity"
-echo "  --disable-kvm            disable KVM acceleration support"
-echo "  --enable-kvm             enable KVM acceleration support"
-echo "  --disable-rdma           disable RDMA-based migration support"
-echo "  --enable-rdma            enable RDMA-based migration support"
-echo "  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)"
-echo "  --enable-system          enable all system emulation targets"
-echo "  --disable-system         disable all system emulation targets"
-echo "  --enable-user            enable supported user emulation targets"
-echo "  --disable-user           disable all user emulation targets"
-echo "  --enable-linux-user      enable all linux usermode emulation targets"
-echo "  --disable-linux-user     disable all linux usermode emulation targets"
-echo "  --enable-bsd-user        enable all BSD usermode emulation targets"
-echo "  --disable-bsd-user       disable all BSD usermode emulation targets"
-echo "  --enable-guest-base      enable GUEST_BASE support for usermode"
-echo "                           emulation targets"
-echo "  --disable-guest-base     disable GUEST_BASE support"
-echo "  --enable-pie             build Position Independent Executables"
-echo "  --disable-pie            do not build Position Independent Executables"
-echo "  --fmod-lib               path to FMOD library"
-echo "  --fmod-inc               path to FMOD includes"
-echo "  --oss-lib                path to OSS library"
-echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
-echo "  --cpu=CPU                Build for host CPU [$cpu]"
-echo "  --disable-uuid           disable uuid support"
-echo "  --enable-uuid            enable uuid support"
-echo "  --disable-vde            disable support for vde network"
-echo "  --enable-vde             enable support for vde network"
-echo "  --disable-netmap         disable support for netmap network"
-echo "  --enable-netmap          enable support for netmap network"
-echo "  --disable-linux-aio      disable Linux AIO support"
-echo "  --enable-linux-aio       enable Linux AIO support"
-echo "  --disable-cap-ng         disable libcap-ng support"
-echo "  --enable-cap-ng          enable libcap-ng support"
-echo "  --disable-attr           disables attr and xattr support"
-echo "  --enable-attr            enable attr and xattr support"
-echo "  --disable-blobs          disable installing provided firmware blobs"
-echo "  --enable-docs            enable documentation build"
-echo "  --disable-docs           disable documentation build"
-echo "  --disable-vhost-net      disable vhost-net acceleration support"
-echo "  --enable-vhost-net       enable vhost-net acceleration support"
-echo "  --enable-trace-backend=B Set trace backend"
-echo "                           Available backends:" $($python "$source_path"/scripts/tracetool.py --list-backends)
-echo "  --with-trace-file=NAME   Full PATH,NAME of file to store traces"
-echo "                           Default:trace-<pid>"
-echo "  --disable-spice          disable spice"
-echo "  --enable-spice           enable spice"
-echo "  --enable-rbd             enable building the rados block device (rbd)"
-echo "  --disable-libiscsi       disable iscsi support"
-echo "  --enable-libiscsi        enable iscsi support"
-echo "  --disable-smartcard-nss  disable smartcard nss support"
-echo "  --enable-smartcard-nss   enable smartcard nss support"
-echo "  --disable-libusb         disable libusb (for usb passthrough)"
-echo "  --enable-libusb          enable libusb (for usb passthrough)"
-echo "  --disable-usb-redir      disable usb network redirection support"
-echo "  --enable-usb-redir       enable usb network redirection support"
-echo "  --disable-guest-agent    disable building of the QEMU Guest Agent"
-echo "  --enable-guest-agent     enable building of the QEMU Guest Agent"
-echo "  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent"
-echo "  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)"
-echo "  --disable-seccomp        disable seccomp support"
-echo "  --enable-seccomp         enables seccomp support"
-echo "  --with-coroutine=BACKEND coroutine backend. Supported options:"
-echo "                           gthread, ucontext, sigaltstack, windows"
-echo "  --disable-coroutine-pool disable coroutine freelist (worse performance)"
-echo "  --enable-coroutine-pool  enable coroutine freelist (better performance)"
-echo "  --enable-glusterfs       enable GlusterFS backend"
-echo "  --disable-glusterfs      disable GlusterFS backend"
-echo "  --enable-gcov            enable test coverage analysis with gcov"
-echo "  --gcov=GCOV              use specified gcov [$gcov_tool]"
-echo "  --enable-tpm             enable TPM support"
-echo "  --disable-libssh2        disable ssh block device support"
-echo "  --enable-libssh2         enable ssh block device support"
-echo "  --disable-vhdx           disables support for the Microsoft VHDX image format"
-echo "  --enable-vhdx            enable support for the Microsoft VHDX image format"
-echo ""
-echo "NOTE: The object files are built at the place where configure is launched"
 exit 1
 fi
 
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkU-0000Er-8L
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:39:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkI-0008Sj-6P
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk7-0000RL-DQ
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:46 -0500
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:60083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk6-0000QZ-H0
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:35 -0500
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 07:09:32 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 07:09:29 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 238EDE004A;
	Fri, 24 Jan 2014 07:12:30 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1dTtg66977996; Fri, 24 Jan 2014 07:09:29 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dSX6029498; Fri, 24 Jan 2014 07:09:28 +0530
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dRcm029489; Fri, 24 Jan 2014 07:09:28 +0530
Received: by river.localdomain (Postfix, from userid 1000)
	id 6BC7A2391FB8; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:08 +1100
Message-Id: <1390527551-22069-4-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-3864-0000-0000-00000C18A66A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 3/6] configure: alphabetize output of
	--help and separate into groups
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:55 -0000

This should make it (slightly) easier to discover configure options.
I've tried to separate out build options (e.g. gcov) from feature
options (such as gtk).

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 174 ++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 89 insertions(+), 85 deletions(-)

diff --git a/configure b/configure
index e61708a..c225291 100755
--- a/configure
+++ b/configure
@@ -1102,7 +1102,7 @@ Standard options:
 $(echo Available targets: $default_target_list | \
   fold -s -w 53 | sed -e 's/^/                           /')
 
-Advanced options (experts only):
+Advanced options, build (experts only):
   --source-path=PATH       path of source code [$source_path]
   --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
@@ -1135,16 +1135,18 @@ Advanced options (experts only):
   --disable-sparse         disable sparse checker (default)
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
-  --disable-sdl            disable SDL
-  --enable-sdl             enable SDL
-  --disable-gtk            disable gtk UI
-  --enable-gtk             enable gtk UI
-  --disable-virtfs         disable VirtFS
-  --enable-virtfs          enable VirtFS
-  --disable-vnc            disable VNC
-  --enable-vnc             enable VNC
-  --disable-cocoa          disable Cocoa (Mac OS X only)
-  --enable-cocoa           enable Cocoa (default on Mac OS X)
+  --disable-attr           disables attr and xattr support
+  --enable-attr            enable attr and xattr support
+  --enable-pie             build Position Independent Executables
+  --disable-pie            do not build Position Independent Executables
+  --cpu=CPU                Build for host CPU [$cpu]
+  --disable-blobs          disable installing provided firmware blobs
+  --enable-gcov            enable test coverage analysis with gcov
+  --gcov=GCOV              use specified gcov [$gcov_tool]
+  --enable-docs            enable documentation build
+  --disable-docs           disable documentation build
+
+Advanced options, features (experts only):
   --audio-drv-list=LIST    set audio drivers list:
                            Available drivers: $audio_possible_drivers
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
@@ -1154,105 +1156,107 @@ Advanced options (experts only):
   --block-drv-ro-whitelist=L
                            set block driver read-only whitelist
                            (affects only QEMU, not qemu-img)
-  --disable-xen            disable xen backend driver support
-  --enable-xen             enable xen backend driver support
-  --disable-xen-pci-passthrough
-  --enable-xen-pci-passthrough
   --disable-brlapi         disable BrlAPI
   --enable-brlapi          enable BrlAPI
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
+  --disable-bluez          disable bluez stack connectivity
+  --enable-bluez           enable bluez stack connectivity
+  --disable-cap-ng         disable libcap-ng support
+  --enable-cap-ng          enable libcap-ng support
+  --disable-cocoa          disable Cocoa (Mac OS X only)
+  --enable-cocoa           enable Cocoa (default on Mac OS X)
+  --with-coroutine=BACKEND coroutine backend. Supported options:
+                           gthread, ucontext, sigaltstack, windows
+  --disable-coroutine-pool disable coroutine freelist (worse performance)
+  --enable-coroutine-pool  enable coroutine freelist (better performance)
   --disable-curl           disable curl connectivity
   --enable-curl            enable curl connectivity
+  --disable-curses         disable curses output
+  --enable-curses          enable curses output
   --disable-fdt            disable fdt device tree
   --enable-fdt             enable fdt device tree
-  --disable-bluez          disable bluez stack connectivity
-  --enable-bluez           enable bluez stack connectivity
-  --disable-slirp          disable SLIRP userspace network connectivity
-  --disable-kvm            disable KVM acceleration support
-  --enable-kvm             enable KVM acceleration support
+  --fmod-lib               path to FMOD library
+  --fmod-inc               path to FMOD includes
+  --enable-glusterfs       enable GlusterFS backend
+  --disable-glusterfs      disable GlusterFS backend
+  --disable-gtk            disable gtk UI
+  --enable-gtk             enable gtk UI
+  --enable-guest-base      enable GUEST_BASE support for usermode
+                           emulation targets
+  --disable-guest-base     disable GUEST_BASE support
   --disable-rdma           disable RDMA-based migration support
   --enable-rdma            enable RDMA-based migration support
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --disable-kvm            disable KVM acceleration support
+  --enable-kvm             enable KVM acceleration support
+  --disable-libiscsi       disable iscsi support
+  --enable-libiscsi        enable iscsi support
+  --disable-libssh2        disable ssh block device support
+  --enable-libssh2         enable ssh block device support
+  --disable-libusb         disable libusb (for usb passthrough)
+  --enable-libusb          enable libusb (for usb passthrough)
+  --disable-linux-aio      disable Linux AIO support
+  --enable-linux-aio       enable Linux AIO support
+  --disable-netmap         disable support for netmap network
+  --enable-netmap          enable support for netmap network
+  --enable-rbd             enable building the rados block device (rbd)
+  --disable-sdl            disable SDL
+  --enable-sdl             enable SDL
+  --disable-seccomp        disable seccomp support
+  --enable-seccomp         enables seccomp support
+  --disable-slirp          disable SLIRP userspace network connectivity
+  --disable-smartcard-nss  disable smartcard nss support
+  --enable-smartcard-nss   enable smartcard nss support
+  --disable-spice          disable spice
+  --enable-spice           enable spice
   --enable-system          enable all system emulation targets
   --disable-system         disable all system emulation targets
+  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tpm             enable TPM support
+  --enable-trace-backend=B Set trace backend
+                           Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
+  --with-trace-file=NAME   Full PATH,NAME of file to store traces
+                           Default:trace-<pid>
   --enable-user            enable supported user emulation targets
   --disable-user           disable all user emulation targets
-  --enable-linux-user      enable all linux usermode emulation targets
-  --disable-linux-user     disable all linux usermode emulation targets
   --enable-bsd-user        enable all BSD usermode emulation targets
   --disable-bsd-user       disable all BSD usermode emulation targets
-  --enable-guest-base      enable GUEST_BASE support for usermode
-                           emulation targets
-  --disable-guest-base     disable GUEST_BASE support
-  --enable-pie             build Position Independent Executables
-  --disable-pie            do not build Position Independent Executables
-  --fmod-lib               path to FMOD library
-  --fmod-inc               path to FMOD includes
+  --enable-linux-user      enable all linux usermode emulation targets
+  --disable-linux-user     disable all linux usermode emulation targets
   --oss-lib                path to OSS library
   --enable-uname-release=R Return R for uname -r in usermode emulation
-  --cpu=CPU                Build for host CPU [$cpu]
+  --disable-usb-redir      disable usb network redirection support
+  --enable-usb-redir       enable usb network redirection support
   --disable-uuid           disable uuid support
   --enable-uuid            enable uuid support
   --disable-vde            disable support for vde network
   --enable-vde             enable support for vde network
-  --disable-netmap         disable support for netmap network
-  --enable-netmap          enable support for netmap network
-  --disable-linux-aio      disable Linux AIO support
-  --enable-linux-aio       enable Linux AIO support
-  --disable-cap-ng         disable libcap-ng support
-  --enable-cap-ng          enable libcap-ng support
-  --disable-attr           disables attr and xattr support
-  --enable-attr            enable attr and xattr support
-  --disable-blobs          disable installing provided firmware blobs
-  --enable-docs            enable documentation build
-  --disable-docs           disable documentation build
+  --disable-vhdx           disables support for the Microsoft VHDX image format
+  --enable-vhdx            enable support for the Microsoft VHDX image format
   --disable-vhost-net      disable vhost-net acceleration support
   --enable-vhost-net       enable vhost-net acceleration support
-  --enable-trace-backend=B Set trace backend
-                           Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
-  --with-trace-file=NAME   Full PATH,NAME of file to store traces
-                           Default:trace-<pid>
-  --disable-spice          disable spice
-  --enable-spice           enable spice
-  --enable-rbd             enable building the rados block device (rbd)
-  --disable-libiscsi       disable iscsi support
-  --enable-libiscsi        enable iscsi support
-  --disable-smartcard-nss  disable smartcard nss support
-  --enable-smartcard-nss   enable smartcard nss support
-  --disable-libusb         disable libusb (for usb passthrough)
-  --enable-libusb          enable libusb (for usb passthrough)
-  --disable-usb-redir      disable usb network redirection support
-  --enable-usb-redir       enable usb network redirection support
+  --disable-virtfs         disable VirtFS
+  --enable-virtfs          enable VirtFS
+  --disable-vnc            disable VNC
+  --enable-vnc             enable VNC
+  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server
+  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server
+  --disable-vnc-png        disable PNG compression for VNC server (default)
+  --enable-vnc-png         enable PNG compression for VNC server
+  --disable-vnc-sasl       disable SASL encryption for VNC server
+  --enable-vnc-sasl        enable SASL encryption for VNC server
+  --disable-vnc-tls        disable TLS encryption for VNC server
+  --enable-vnc-tls         enable TLS encryption for VNC server
+  --disable-vnc-ws         disable Websockets support for VNC server
+  --enable-vnc-ws          enable Websockets support for VNC server
+  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
+  --disable-xen            disable xen backend driver support
+  --enable-xen             enable xen backend driver support
+  --disable-xen-pci-passthrough
+  --enable-xen-pci-passthrough
+
+Advanced options, Guest Agent (experts only):
   --disable-guest-agent    disable building of the QEMU Guest Agent
   --enable-guest-agent     enable building of the QEMU Guest Agent
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
-  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
-  --disable-seccomp        disable seccomp support
-  --enable-seccomp         enables seccomp support
-  --with-coroutine=BACKEND coroutine backend. Supported options:
-                           gthread, ucontext, sigaltstack, windows
-  --disable-coroutine-pool disable coroutine freelist (worse performance)
-  --enable-coroutine-pool  enable coroutine freelist (better performance)
-  --enable-glusterfs       enable GlusterFS backend
-  --disable-glusterfs      disable GlusterFS backend
-  --enable-gcov            enable test coverage analysis with gcov
-  --gcov=GCOV              use specified gcov [$gcov_tool]
-  --enable-tpm             enable TPM support
-  --disable-libssh2        disable ssh block device support
-  --enable-libssh2         enable ssh block device support
-  --disable-vhdx           disables support for the Microsoft VHDX image format
-  --enable-vhdx            enable support for the Microsoft VHDX image format
 
 NOTE: The object files are built at the place where configure is launched
 EOF
-- 
1.8.4.2



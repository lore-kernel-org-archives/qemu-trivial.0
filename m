Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6VkO-000050-Qi
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 20:39:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6VkE-0008Rh-ER
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk5-0000Qg-BG
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:42 -0500
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:41139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6Vk4-0000QL-La
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 20:39:33 -0500
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Fri, 24 Jan 2014 07:09:30 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 24 Jan 2014 07:09:29 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id A1A651258051;
	Fri, 24 Jan 2014 07:11:09 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0O1dSZm53870694; Fri, 24 Jan 2014 07:09:28 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0O1dSnV003008; Fri, 24 Jan 2014 07:09:28 +0530
Received: from river.localdomain (river.au.ibm.com [9.185.121.78])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0O1dR6i002992; Fri, 24 Jan 2014 07:09:28 +0530
Received: by river.localdomain (Postfix, from userid 1000)
	id 5D1C52391FB7; Fri, 24 Jan 2014 12:39:27 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jan 2014 12:39:07 +1100
Message-Id: <1390527551-22069-3-git-send-email-stewart@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012401-4790-0000-0000-00000C610C17
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 2/6] configure: sort output of configure
	results alphabetically
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
X-List-Received-Date: Fri, 24 Jan 2014 01:39:51 -0000

Keep the paths and compiler/target details at the top, but sort
all the yes/no features alphabetically, making it much easier to
both browse through and to check if a feature you want has been
enabled or not. Eyes can be faster than grep.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
 configure | 118 +++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/configure b/configure
index 8b6e64a..e61708a 100755
--- a/configure
+++ b/configure
@@ -3722,6 +3722,7 @@ QEMU_CFLAGS="$QEMU_CFLAGS $pixman_cflags $fdt_cflags"
 libs_softmmu="$libs_softmmu $pixman_libs"
 
 echo "Install prefix    $prefix"
+echo "Install blobs     $blobs"
 echo "BIOS directory    `eval echo $qemu_datadir`"
 echo "binary directory  `eval echo $bindir`"
 echo "library directory `eval echo $libdir`"
@@ -3753,92 +3754,91 @@ if test "$slirp" = "yes" ; then
 fi
 echo "host CPU          $cpu"
 echo "host big endian   $bigendian"
+[ ! -z "$uname_release" ] && \
+echo "uname -r          $uname_release"
 echo "target list       $target_list"
+if test -n "$sparc_cpu"; then
+    echo "Target Sparc Arch $sparc_cpu"
+fi
 echo "tcg debug enabled $debug_tcg"
 echo "gprof enabled     $gprof"
 echo "sparse enabled    $sparse"
 echo "strip binaries    $strip_opt"
 echo "profiler          $profiler"
 echo "static build      $static"
+echo "PIE               $pie"
 echo "-Werror enabled   $werror"
+echo "ATTR/XATTR support $attr"
+echo "Audio drivers     $audio_drv_list"
+echo "Block whitelist (rw) $block_drv_rw_whitelist"
+echo "Block whitelist (ro) $block_drv_ro_whitelist"
+echo "bluez  support    $bluez"
+echo "brlapi support    $brlapi"
+echo "build guest agent $guest_agent"
 if test "$darwin" = "yes" ; then
     echo "Cocoa support     $cocoa"
 fi
-echo "pixman            $pixman"
-echo "SDL support       $sdl"
-echo "GTK support       $gtk"
+echo "coroutine backend $coroutine"
+echo "coroutine pool    $coroutine_pool"
 echo "curses support    $curses"
 echo "curl support      $curl"
-echo "mingw32 support   $mingw32"
-echo "Audio drivers     $audio_drv_list"
-echo "Block whitelist (rw) $block_drv_rw_whitelist"
-echo "Block whitelist (ro) $block_drv_ro_whitelist"
-echo "VirtFS support    $virtfs"
-echo "VNC support       $vnc"
-if test "$vnc" = "yes" ; then
-    echo "VNC TLS support   $vnc_tls"
-    echo "VNC SASL support  $vnc_sasl"
-    echo "VNC JPEG support  $vnc_jpeg"
-    echo "VNC PNG support   $vnc_png"
-    echo "VNC WS support    $vnc_ws"
-fi
-if test -n "$sparc_cpu"; then
-    echo "Target Sparc Arch $sparc_cpu"
-fi
-echo "xen support       $xen"
-echo "brlapi support    $brlapi"
-echo "bluez  support    $bluez"
 echo "Documentation     $docs"
-[ ! -z "$uname_release" ] && \
-echo "uname -r          $uname_release"
+echo "fdatasync         $fdatasync"
+echo "fdt support       $fdt"
+echo "gcov              $gcov_tool"
+echo "gcov enabled      $gcov"
+echo "GTK support       $gtk"
+echo "GlusterFS support $glusterfs"
+echo "GLX support       $glx"
 echo "GUEST_BASE        $guest_base"
-echo "PIE               $pie"
-echo "vde support       $vde"
-echo "netmap support    $netmap"
-echo "Linux AIO support $linux_aio"
-echo "ATTR/XATTR support $attr"
-echo "Install blobs     $blobs"
 echo "KVM support       $kvm"
-echo "RDMA support      $rdma"
-echo "TCG interpreter   $tcg_interpreter"
-echo "fdt support       $fdt"
-echo "preadv support    $preadv"
-echo "fdatasync         $fdatasync"
-echo "madvise           $madvise"
-echo "posix_madvise     $posix_madvise"
-echo "sigev_thread_id   $sigev_thread_id"
-echo "uuid support      $uuid"
 echo "libcap-ng support $cap_ng"
-echo "vhost-net support $vhost_net"
-echo "vhost-scsi support $vhost_scsi"
-echo "Trace backend     $trace_backend"
-echo "Trace output file $trace_file-<pid>"
-echo "spice support     $spice ($spice_protocol_version/$spice_server_version)"
-echo "rbd support       $rbd"
-echo "xfsctl support    $xfs"
-echo "nss used          $smartcard_nss"
-echo "libusb            $libusb"
-echo "usb net redir     $usb_redir"
-echo "GLX support       $glx"
 if test "$libiscsi_version" = "1.4.0"; then
 echo "libiscsi support  $libiscsi (1.4.0)"
 else
 echo "libiscsi support  $libiscsi"
 fi
-echo "build guest agent $guest_agent"
+echo "libssh2 support   $libssh2"
+echo "libusb            $libusb"
+echo "Linux AIO support $linux_aio"
+echo "madvise           $madvise"
+echo "mingw32 support   $mingw32"
+echo "netmap support    $netmap"
+echo "nss used          $smartcard_nss"
+echo "pixman            $pixman"
+echo "preadv support    $preadv"
+echo "posix_madvise     $posix_madvise"
 echo "QGA VSS support   $guest_agent_with_vss"
+echo "QOM debugging     $qom_cast_debug"
+echo "rbd support       $rbd"
+echo "RDMA support      $rdma"
+echo "SDL support       $sdl"
 echo "seccomp support   $seccomp"
-echo "coroutine backend $coroutine"
-echo "coroutine pool    $coroutine_pool"
-echo "GlusterFS support $glusterfs"
-echo "virtio-blk-data-plane $virtio_blk_data_plane"
-echo "gcov              $gcov_tool"
-echo "gcov enabled      $gcov"
+echo "sigev_thread_id   $sigev_thread_id"
+echo "spice support     $spice ($spice_protocol_version/$spice_server_version)"
+echo "TCG interpreter   $tcg_interpreter"
 echo "TPM support       $tpm"
-echo "libssh2 support   $libssh2"
 echo "TPM passthrough   $tpm_passthrough"
-echo "QOM debugging     $qom_cast_debug"
+echo "Trace backend     $trace_backend"
+echo "Trace output file $trace_file-<pid>"
+echo "usb net redir     $usb_redir"
+echo "uuid support      $uuid"
+echo "vde support       $vde"
 echo "vhdx              $vhdx"
+echo "vhost-net support $vhost_net"
+echo "vhost-scsi support $vhost_scsi"
+echo "VirtFS support    $virtfs"
+echo "VNC support       $vnc"
+if test "$vnc" = "yes" ; then
+    echo "VNC TLS support   $vnc_tls"
+    echo "VNC SASL support  $vnc_sasl"
+    echo "VNC JPEG support  $vnc_jpeg"
+    echo "VNC PNG support   $vnc_png"
+    echo "VNC WS support    $vnc_ws"
+fi
+echo "virtio-blk-data-plane $virtio_blk_data_plane"
+echo "xen support       $xen"
+echo "xfsctl support    $xfs"
 
 if test "$sdl_too_old" = "yes"; then
 echo "-> Your SDL version is too old - please upgrade to have SDL support"
-- 
1.8.4.2



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ7y-0000I8-PL
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 03:03:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7s-00009b-Lp
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ7q-0000eu-Im
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:03:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ7k-0000Uz-5z; Sat, 10 Feb 2018 03:03:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DC7040C57;
	Sat, 10 Feb 2018 11:03:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 38B187AA;
	Sat, 10 Feb 2018 10:55:16 +0300 (MSK)
Received: (nullmailer pid 22809 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Andreas Gustafsson <gson@gson.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:06 +0300
Message-Id: <9bc5a7193fb422ee53187601eba577ee5d195522.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/17] oslib-posix: check for posix_memalign
 in configure script
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Feb 2018 08:03:15 -0000

From: Andreas Gustafsson <gson@gson.org>

Check for the presence of posix_memalign() in the configure script,
not using "defined(_POSIX_C_SOURCE) && !defined(__sun__)".  This
lets qemu use posix_memalign() on NetBSD versions that have it,
instead of falling back to valloc() which is wasteful when the
required alignment is smaller than a page.

Signed-off-by: Andreas Gustafsson <gson@gson.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure          | 19 +++++++++++++++++++
 util/oslib-posix.c |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index c1bbf17559..fe9eea9218 100755
--- a/configure
+++ b/configure
@@ -4659,6 +4659,21 @@ if compile_prog "" "" ; then
 fi
 
 ##########################################
+# check if we have posix_memalign()
+
+posix_memalign=no
+cat > $TMPC << EOF
+#include <stdlib.h>
+int main(void) {
+    void *p;
+    return posix_memalign(&p, 8, 8);
+}
+EOF
+if compile_prog "" "" ; then
+    posix_memalign=yes
+fi
+
+##########################################
 # check if we have posix_syslog
 
 posix_syslog=no
@@ -5746,6 +5761,7 @@ echo "preadv support    $preadv"
 echo "fdatasync         $fdatasync"
 echo "madvise           $madvise"
 echo "posix_madvise     $posix_madvise"
+echo "posix_memalign    $posix_memalign"
 echo "libcap-ng support $cap_ng"
 echo "vhost-net support $vhost_net"
 echo "vhost-scsi support $vhost_scsi"
@@ -6232,6 +6248,9 @@ fi
 if test "$posix_madvise" = "yes" ; then
   echo "CONFIG_POSIX_MADVISE=y" >> $config_host_mak
 fi
+if test "$posix_memalign" = "yes" ; then
+  echo "CONFIG_POSIX_MEMALIGN=y" >> $config_host_mak
+fi
 
 if test "$spice" = "yes" ; then
   echo "CONFIG_SPICE=y" >> $config_host_mak
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 77369c92ce..4655bc1f89 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -105,7 +105,7 @@ void *qemu_try_memalign(size_t alignment, size_t size)
         alignment = sizeof(void*);
     }
 
-#if defined(_POSIX_C_SOURCE) && !defined(__sun__)
+#if defined(CONFIG_POSIX_MEMALIGN)
     int ret;
     ret = posix_memalign(&ptr, alignment, size);
     if (ret != 0) {
-- 
2.11.0



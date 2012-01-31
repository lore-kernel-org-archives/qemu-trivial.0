Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsJBU-00046M-3B
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2012 14:16:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>) id 1RsJBL-0003a3-RD
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2012 14:16:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>) id 1RsJBE-0006et-Qp
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2012 14:15:52 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:45536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <slyfox@gentoo.org>)
	id 1RsJAv-0006bz-U4; Tue, 31 Jan 2012 14:15:30 -0500
Received: from sf.home (unknown [178.125.67.224])
	(using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: slyfox)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B02471B4060;
	Tue, 31 Jan 2012 19:15:23 +0000 (UTC)
Received: by sf.home (Postfix, from userid 1000)
	id B0B3E1358C63; Tue, 31 Jan 2012 22:04:02 +0300 (FET)
From: Sergei Trofimovich <slyfox@inbox.ru>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jan 2012 22:03:58 +0300
Message-Id: <1328036638-3190-1-git-send-email-slyfox@inbox.ru>
X-Mailer: git-send-email 1.7.8.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.211.166.183
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Sergei Trofimovich <slyfox@gentoo.org>
Subject: [Qemu-trivial] [PATCH resend] ./configure: add link check for
	nss-smartcard
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
X-List-Received-Date: Tue, 31 Jan 2012 19:16:02 -0000

From: Sergei Trofimovich <slyfox@gentoo.org>

Current './configure --static && make' fails for me:

    LINK  qemu-nbd
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lssl3
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lsmime3
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnssutil3
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnss3
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lplds4
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lplc4
    /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lnspr4

My system does not provide static libraries for nss, so
fix autoconfiguration by link checking.

Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
CC: qemu-trivial <qemu-trivial@nongnu.org>
---
 configure |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 8fd5404..3b0b300 100755
--- a/configure
+++ b/configure
@@ -2528,11 +2528,16 @@ if test "$smartcard" != "no" ; then
     smartcard_cflags=""
     # TODO - what's the minimal nss version we support?
     if test "$smartcard_nss" != "no"; then
-        if $pkg_config --atleast-version=3.12.8 nss >/dev/null 2>&1 ; then
+      cat > $TMPC << EOF
+#include <pk11pub.h>
+int main(void) { PK11_FreeSlot(0); return 0; }
+EOF
+        smartcard_cflags="-I\$(SRC_PATH)/libcacard"
+        libcacard_libs=$($pkg_config --libs nss 2>/dev/null)
+        libcacard_cflags=$($pkg_config --cflags nss 2>/dev/null)
+        if $pkg_config --atleast-version=3.12.8 nss >/dev/null 2>&1 && \
+          compile_prog "$smartcard_cflags $libcacard_cflags" "$libcacard_libs"; then
             smartcard_nss="yes"
-            smartcard_cflags="-I\$(SRC_PATH)/libcacard"
-            libcacard_libs=$($pkg_config --libs nss 2>/dev/null)
-            libcacard_cflags=$($pkg_config --cflags nss 2>/dev/null)
             QEMU_CFLAGS="$QEMU_CFLAGS $smartcard_cflags $libcacard_cflags"
             LIBS="$libcacard_libs $LIBS"
         else
-- 
1.7.8.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbq3x-0003YA-NH
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:56:13 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpeq-0007MT-Om
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:30:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpep-0006WR-GY
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:30:16 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpel-0006Uz-1c; Sat, 17 Dec 2011 03:30:11 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9B516728188A; Sat, 17 Dec 2011 09:30:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gBv7sEN4SKz0; Sat, 17 Dec 2011 09:29:40 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9D0EA7283291; Sat, 17 Dec 2011 09:27:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:39 +0100
Message-Id: <1324110459-3932-12-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PATCH 11/11] configure: Improve Xen autodetection
	for hosts without Xen
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
X-List-Received-Date: Sat, 17 Dec 2011 08:56:11 -0000

With this patch, it only takes one test (instead of four)
to detect that there is no Xen support at all.

For most build hosts, this will reduce the time configure needs.
It will also reduce noisy output in config.log.

Build hosts with Xen now need up to five (instead of up to four)
tests. They get improved diagnostics when Xen support fails.

Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   29 +++++++++++++++++++++++++----
 1 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 1ae380f..b8ec19a 100755
--- a/configure
+++ b/configure
@@ -1317,10 +1317,30 @@ fi
 if test "$xen" != "no" ; then
   xen_libs="-lxenstore -lxenctrl -lxenguest"
 
-  # Xen unstable
+  # First we test whether Xen headers and libraries are available.
+  # If no, we are done and there is no Xen support.
+  # If yes, more tests are run to detect the Xen version.
+
+  # Xen (any)
   cat > $TMPC <<EOF
 #include <xenctrl.h>
 #include <xs.h>
+int main(void) {
+  return 0;
+}
+EOF
+  if ! compile_prog "" "$xen_libs" ; then
+    # Xen not found
+    if test "$xen" = "yes" ; then
+      feature_not_found "xen"
+    fi
+    xen=no
+
+  # Xen unstable
+  elif (
+      cat > $TMPC <<EOF
+#include <xenctrl.h>
+#include <xs.h>
 #include <stdint.h>
 #include <xen/hvm/hvm_info_table.h>
 #if !defined(HVM_MAX_VCPUS)
@@ -1336,7 +1356,8 @@ int main(void) {
   return 0;
 }
 EOF
-  if compile_prog "" "$xen_libs" ; then
+      compile_prog "" "$xen_libs"
+    ) ; then
     xen_ctrl_version=410
     xen=yes
 
@@ -1407,10 +1428,10 @@ EOF
     xen_ctrl_version=330
     xen=yes
 
-  # Xen not found or unsupported
+  # Xen version unsupported
   else
     if test "$xen" = "yes" ; then
-      feature_not_found "xen"
+      feature_not_found "xen (unsupported version)"
     fi
     xen=no
   fi
-- 
1.7.2.5



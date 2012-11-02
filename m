Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUBSP-0003Bv-JB
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2012 03:14:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBSM-000369-W9
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBSM-0005u8-3H
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:14:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TUBSJ-0005tZ-Nv; Fri, 02 Nov 2012 03:14:15 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	209BF7280030; Fri,  2 Nov 2012 08:14:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HsdMt+Qn-0dA; Fri,  2 Nov 2012 08:14:13 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9A29A728003A; Fri,  2 Nov 2012 08:14:13 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@us.ibm.com>, Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri,  2 Nov 2012 08:14:12 +0100
Message-Id: <1351840452-481-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix spelling (prefered -> preferred)
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
X-List-Received-Date: Fri, 02 Nov 2012 07:14:19 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure       |    2 +-
 net/tap-win32.c |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 79701ea..860859b 100755
--- a/configure
+++ b/configure
@@ -2115,7 +2115,7 @@ if test "$pixman" = "system"; then
 else
   if test ! -d ${source_path}/pixman/pixman; then
     echo "ERROR: pixman not present. Your options:"
-    echo "  (1) Prefered: Install the pixman devel package (any recent"
+    echo "  (1) Preferred: Install the pixman devel package (any recent"
     echo "      distro should have packages as Xorg needs pixman too)."
     echo "  (2) Fetch the pixman submodule, using:"
     echo "      git submodule update --init pixman"
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 8d2d32b..f9bd741 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -565,7 +565,7 @@ static void tap_win32_free_buffer(tap_win32_overlapped_t *overlapped,
 }
 
 static int tap_win32_open(tap_win32_overlapped_t **phandle,
-                          const char *prefered_name)
+                          const char *preferred_name)
 {
     char device_path[256];
     char device_guid[0x100];
@@ -581,8 +581,9 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
     DWORD version_len;
     DWORD idThread;
 
-    if (prefered_name != NULL)
-        snprintf(name_buffer, sizeof(name_buffer), "%s", prefered_name);
+    if (preferred_name != NULL) {
+        snprintf(name_buffer, sizeof(name_buffer), "%s", preferred_name);
+    }
 
     rc = get_device_guid(device_guid, sizeof(device_guid), name_buffer, sizeof(name_buffer));
     if (rc)
-- 
1.7.10.4



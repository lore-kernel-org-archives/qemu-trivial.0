Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxev-0002E3-4H
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:45:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxeo-00026X-Pf
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxen-0002eX-Vs
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxei-0002cP-D3; Tue, 24 Jan 2017 04:44:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 384D842104;
	Tue, 24 Jan 2017 12:44:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5F63D58B;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12665 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Ziyue Yang <yzylivezh@hotmail.com>, qemu-trivial@nongnu.org,
	Ziyue Yang <skiver.cloud.yzy@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:32 +0300
Message-Id: <8c171da885807f7b534bdcde6757cd35b2969816.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 28/31] gdbstub.c: fix GDB connection segfault
 caused by empty machines
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
X-List-Received-Date: Tue, 24 Jan 2017 09:44:55 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

This patch is to fix the segmentation fault caused by attaching
GDB to a QEMU instance initialized with "-M none" option.

The bug can be reproduced by

> ./qemu-system-x86_64 -M none -nographic -S -s

and attach a GDB to it by

> gdb -ex 'target remote :1234

The segmentation fault was originally caused by trying to read
the information about CPU when communicating with GDB. However,
it's impossible for any control flow to exist on an empty machine,
nor can CPU's be hot plugged to an empty machine later by QOM
commands. So I think simply disabling GDB connections on empty
machines makes sense.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index de9b62b..27e0923 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "cpu.h"
 #ifdef CONFIG_USER_ONLY
@@ -1732,6 +1733,12 @@ int gdbserver_start(const char *device)
     CharDriverState *mon_chr;
     ChardevCommon common = { 0 };
 
+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
-- 
2.1.4



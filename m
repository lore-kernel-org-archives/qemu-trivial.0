Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsK7g-0007MW-2O
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 16:20:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TsK7a-00077n-MX
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 16:20:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TsK7Y-0000i2-4s
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 16:20:38 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TsK7S-0000hC-QG; Mon, 07 Jan 2013 16:20:30 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	54AB1728004E; Mon,  7 Jan 2013 22:20:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SXBRhFQ9oKcc; Mon,  7 Jan 2013 22:20:28 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id AFB1F728004F; Mon,  7 Jan 2013 22:20:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon,  7 Jan 2013 22:20:27 +0100
Message-Id: <1357593627-25648-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] savevm: Remove MinGW specific code which is
	no longer needed
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
X-List-Received-Date: Mon, 07 Jan 2013 21:20:42 -0000

QEMU provides a portable function qemu_gettimeofday instead of
gettimeofday and also an implementation of localtime_r for MinGW.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 savevm.c |   30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/savevm.c b/savevm.c
index 529d60e..4e970ca 100644
--- a/savevm.c
+++ b/savevm.c
@@ -23,15 +23,6 @@
  */
 
 #include "config-host.h"
-
-#ifndef _WIN32
-#include <arpa/inet.h>
-#endif
-
-#ifdef _WIN32
-#include <windows.h>
-#endif
-
 #include "qemu-common.h"
 #include "hw/hw.h"
 #include "hw/qdev.h"
@@ -2093,13 +2084,8 @@ void do_savevm(Monitor *mon, const QDict *qdict)
     QEMUFile *f;
     int saved_vm_running;
     uint64_t vm_state_size;
-#ifdef _WIN32
-    struct _timeb tb;
-    struct tm *ptm;
-#else
-    struct timeval tv;
+    qemu_timeval tv;
     struct tm tm;
-#endif
     const char *name = qdict_get_try_str(qdict, "name");
 
     /* Verify if there is a device that doesn't support snapshots and is writable */
@@ -2129,15 +2115,9 @@ void do_savevm(Monitor *mon, const QDict *qdict)
     memset(sn, 0, sizeof(*sn));
 
     /* fill auxiliary fields */
-#ifdef _WIN32
-    _ftime(&tb);
-    sn->date_sec = tb.time;
-    sn->date_nsec = tb.millitm * 1000000;
-#else
-    gettimeofday(&tv, NULL);
+    qemu_gettimeofday(&tv);
     sn->date_sec = tv.tv_sec;
     sn->date_nsec = tv.tv_usec * 1000;
-#endif
     sn->vm_clock_nsec = qemu_get_clock_ns(vm_clock);
 
     if (name) {
@@ -2149,15 +2129,9 @@ void do_savevm(Monitor *mon, const QDict *qdict)
             pstrcpy(sn->name, sizeof(sn->name), name);
         }
     } else {
-#ifdef _WIN32
-        time_t t = tb.time;
-        ptm = localtime(&t);
-        strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", ptm);
-#else
         /* cast below needed for OpenBSD where tv_sec is still 'long' */
         localtime_r((const time_t *)&tv.tv_sec, &tm);
         strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
-#endif
     }
 
     /* Delete old snapshots of the same name */
-- 
1.7.10.4



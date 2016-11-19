Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8AlY-0003Rb-Tu
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 13:53:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8AlX-0003Qn-4E
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 13:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8AlW-0003QA-CI
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 13:53:31 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:56683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c8AlR-0003PY-UN; Sat, 19 Nov 2016 13:53:26 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 43F9311810A9;
	Sat, 19 Nov 2016 19:53:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fr2mDX6Rn8g7; Sat, 19 Nov 2016 19:53:21 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 04E1511810A8;
	Sat, 19 Nov 2016 19:53:20 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id A2DA34677CA; Sat, 19 Nov 2016 19:53:20 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Sat, 19 Nov 2016 19:53:18 +0100
Message-Id: <20161119185318.10564-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH for-2.8] curses: Fix compiler warnings
 (Mingw-w64 redefinition of macro KEY_EVENT)
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
X-List-Received-Date: Sat, 19 Nov 2016 18:53:32 -0000

For builds with Mingw-w64 as it is included in Cygwin, there are two
header files which define KEY_EVENT with different values.

This results in lots of compiler warnings like this one:

  CC      vl.o
In file included from /qemu/include/ui/console.h:340:0,
                 from /qemu/vl.c:76:
/usr/i686-w64-mingw32/sys-root/mingw/include/curses.h:1522:0: warning: "KEY_EVENT" redefined
 #define KEY_EVENT 0633  /* We were interrupted by an event */

In file included from /usr/share/mingw-w64/include/windows.h:74:0,
                 from /usr/share/mingw-w64/include/winsock2.h:23,
                 from /qemu/include/sysemu/os-win32.h:29,
                 from /qemu/include/qemu/osdep.h:100,
                 from /qemu/vl.c:24:
/usr/share/mingw-w64/include/wincon.h:101:0: note: this is the location of the previous definition
 #define KEY_EVENT 0x1

QEMU only uses the KEY_EVENT macro from wincon.h.
Therefore we can undefine the macro coming from curses.h.

The explicit include statement for curses.h in ui/curses.c is not needed
and was removed.

Those two modifications fix the redefinition warnings.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/ui/console.h | 3 +++
 ui/curses.c          | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index e2589e2..e5ae506 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -337,7 +337,10 @@ static inline pixman_format_code_t surface_format(DisplaySurface *s)
 }
 
 #ifdef CONFIG_CURSES
+/* KEY_EVENT is defined in wincon.h and in curses.h. Avoid redefinition. */
+#undef KEY_EVENT
 #include <curses.h>
+#undef KEY_EVENT
 typedef chtype console_ch_t;
 extern chtype vga_to_curses[];
 #else
diff --git a/ui/curses.c b/ui/curses.c
index 2e132a7..03cefdf 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -22,7 +22,6 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include <curses.h>
 
 #ifndef _WIN32
 #include <sys/ioctl.h>
-- 
2.10.2



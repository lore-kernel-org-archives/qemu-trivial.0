Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfWYr-0005gF-Ur
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 10:04:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWYp-0005cT-8A
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 10:04:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWYo-0003Ej-3M
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 10:04:23 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45402
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfWYl-0003E3-OH; Sun, 10 Nov 2013 10:04:19 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 27FE11802B2; Sun, 10 Nov 2013 16:04:17 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 16:04:16 +0100
Message-Id: <1384095856-15284-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] console: Replace conditional debug messages
	by trace methods
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
X-List-Received-Date: Sun, 10 Nov 2013 15:04:24 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch needs my previous patch which added trace.h, see
http://patchwork.ozlabs.org/patch/290045/.

 trace-events |    2 ++
 ui/console.c |   11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/trace-events b/trace-events
index 8695e9e..d196234 100644
--- a/trace-events
+++ b/trace-events
@@ -1010,6 +1010,8 @@ dma_map_wait(void *dbs) "dbs=%p"
 
 # ui/console.c
 console_gfx_new(void) ""
+console_putchar_csi(int esc_param0, int esc_param1, int ch, int nb_esc_params) "escape sequence CSI%d;%d%c, %d parameters"
+console_putchar_unhandled(int ch) "unhandled escape character '%c'"
 console_txt_new(int w, int h) "%dx%d"
 console_select(int nr) "%d"
 console_refresh(int interval) "interval %d ms"
diff --git a/ui/console.c b/ui/console.c
index 61ed219..586fc6d 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -29,7 +29,6 @@
 #include "sysemu/char.h"
 #include "trace.h"
 
-//#define DEBUG_CONSOLE
 #define DEFAULT_BACKSCROLL 512
 #define MAX_CONSOLES 12
 #define CONSOLE_CURSOR_PERIOD 500
@@ -867,10 +866,8 @@ static void console_putchar(QemuConsole *s, int ch)
                 s->nb_esc_params++;
             if (ch == ';')
                 break;
-#ifdef DEBUG_CONSOLE
-            fprintf(stderr, "escape sequence CSI%d;%d%c, %d parameters\n",
-                    s->esc_params[0], s->esc_params[1], ch, s->nb_esc_params);
-#endif
+            trace_console_putchar_csi(s->esc_params[0], s->esc_params[1],
+                                      ch, s->nb_esc_params);
             s->state = TTY_STATE_NORM;
             switch(ch) {
             case 'A':
@@ -984,9 +981,7 @@ static void console_putchar(QemuConsole *s, int ch)
                 s->y = s->y_saved;
                 break;
             default:
-#ifdef DEBUG_CONSOLE
-                fprintf(stderr, "unhandled escape character '%c'\n", ch);
-#endif
+                trace_console_putchar_unhandled(ch);
                 break;
             }
             break;
-- 
1.7.10.4



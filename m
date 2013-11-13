Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaNk-0001QN-B8
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:21:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNc-0001BR-Me
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaNY-0005Pn-9R
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:21:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaNL-0005NT-Fw; Wed, 13 Nov 2013 08:20:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1146F4175D;
	Wed, 13 Nov 2013 17:20:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4E14F53D;
	Wed, 13 Nov 2013 17:01:26 +0400 (MSK)
Received: (nullmailer pid 16063 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:18 +0400
Message-Id: <1384347680-15976-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/16] console: Replace conditional debug
	messages by trace methods
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
X-List-Received-Date: Wed, 13 Nov 2013 13:21:17 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
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



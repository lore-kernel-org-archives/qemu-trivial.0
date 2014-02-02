Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zpP-0002ut-6k
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:23:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zo7-0002pG-KI
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:23:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zmc-0000NM-K8
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:22:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zlU-00083W-98; Sun, 02 Feb 2014 11:19:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6319B4022B;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4650B615;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: (nullmailer pid 1649 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:41 +0400
Message-Id: <1391357563-1592-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 5/7] readline: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Sun, 02 Feb 2014 16:23:26 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a compiler warning with -Werror=missing-format-attribute
and allows improved compiler checks for variable argument lists.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/readline.h |    3 ++-
 monitor.c               |    3 ++-
 qemu-io.c               |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/qemu/readline.h b/include/qemu/readline.h
index a89fe4a..49efe4e 100644
--- a/include/qemu/readline.h
+++ b/include/qemu/readline.h
@@ -5,7 +5,8 @@
 #define READLINE_MAX_CMDS 64
 #define READLINE_MAX_COMPLETIONS 256
 
-typedef void ReadLinePrintfFunc(void *opaque, const char *fmt, ...);
+typedef void GCC_FMT_ATTR(2, 3) ReadLinePrintfFunc(void *opaque,
+                                                   const char *fmt, ...);
 typedef void ReadLineFlushFunc(void *opaque);
 typedef void ReadLineFunc(void *opaque, const char *str,
                           void *readline_opaque);
diff --git a/monitor.c b/monitor.c
index 80456fb..5ba541d 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4888,7 +4888,8 @@ static void sortcmdlist(void)
 /* These functions just adapt the readline interface in a typesafe way.  We
  * could cast function pointers but that discards compiler checks.
  */
-static void monitor_readline_printf(void *opaque, const char *fmt, ...)
+static void GCC_FMT_ATTR(2, 3) monitor_readline_printf(void *opaque,
+                                                       const char *fmt, ...)
 {
     va_list ap;
     va_start(ap, fmt);
diff --git a/qemu-io.c b/qemu-io.c
index d669028..7f459d8 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -219,7 +219,8 @@ static char *get_prompt(void)
     return prompt;
 }
 
-static void readline_printf_func(void *opaque, const char *fmt, ...)
+static void GCC_FMT_ATTR(2, 3) readline_printf_func(void *opaque,
+                                                    const char *fmt, ...)
 {
     va_list ap;
     va_start(ap, fmt);
-- 
1.7.10.4



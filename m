Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W76sS-00007o-RR
	for mharc-qemu-trivial@gnu.org; Sat, 25 Jan 2014 12:18:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W76sQ-0008UX-7x
	for qemu-trivial@nongnu.org; Sat, 25 Jan 2014 12:18:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W76sP-00049L-Au
	for qemu-trivial@nongnu.org; Sat, 25 Jan 2014 12:18:38 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:33634
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1W76sH-00046y-AO; Sat, 25 Jan 2014 12:18:29 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id CD8D017F661; Sat, 25 Jan 2014 18:18:24 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat, 25 Jan 2014 18:18:23 +0100
Message-Id: <1390670304-381-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] readline: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Sat, 25 Jan 2014 17:18:39 -0000

This fixes a compiler warning with -Werror=missing-format-attribute
and allows improved compiler checks for variable argument lists.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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



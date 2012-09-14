Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCYYp-00045h-AD
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 12:16:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYYj-00043t-4g
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYYe-0008Rd-SO
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:16:01 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:45936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYYe-0008RX-Ls
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:15:56 -0400
Received: by pbbrp12 with SMTP id rp12so6119678pbb.4
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3cVxgAAXhFEMcdPMC8KiaXpufUhhv2sb2NIBJde0mBg=;
	b=0ZUWtSK5nEaRB6koe230z5HferCONgAXd/AJwjmoDCLL4T/DgkjUtIJEJKNr4H/smk
	jlBZNO4tlwvFjRfdSvzYUKn/WGWkMlfRujCVOdcF0MJVrZKxdXWqeS4/XRJAXZget+OW
	Sko92RT0vofFtLVTP+sQ1BpAljD447QkWpTsgP5CWL6BmtNqkpA0851WPz7dQWJyP0l9
	s00iYzRS9YomybNP/QiXmUQ73OKQ+XwVWuqsNTje1NKV+vrK3gYF5NE6tdDoq9ubh363
	wpYb98Y//5PMMB5kMyGDuWOrH++lg8r2/U0gQvaOvjCkTQEQjaTpQyQWXlcRqrSicY6y
	5Uuw==
Received: by 10.68.218.166 with SMTP id ph6mr5570403pbc.132.1347639355717;
	Fri, 14 Sep 2012 09:15:55 -0700 (PDT)
Received: from localhost.localdomain
	(i114-181-221-120.s04.a013.ap.plala.or.jp. [114.181.221.120])
	by mx.google.com with ESMTPS id gf3sm1191028pbc.74.2012.09.14.09.15.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 09:15:54 -0700 (PDT)
From: Hitoshi Mitake <h.mitake@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sat, 15 Sep 2012 01:15:41 +0900
Message-Id: <1347639341-4970-1-git-send-email-h.mitake@gmail.com>
X-Mailer: git-send-email 1.7.5.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>, h.mitake@gmail.com
Subject: [Qemu-trivial] [PATCH v2] curses: don't initialize curses when qemu
	is daemonized
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
X-List-Received-Date: Fri, 14 Sep 2012 16:16:05 -0000

Current qemu initializes curses even if -daemonize option is
passed. This cause problem because shell prompt appears without
calling endwin().

This patch adds new function, is_daemonized(), to OS dependent
code. With this function, curses_display_init() can check that qemu is
daemonized or not. If daemonized, curses_display_init() isn't called
and the problem is avoided.

Of course, -daemonize && -curses doesn't make sense. Users shouldn't
pass the arguments at the same time. But the problem is very painful
because Ctrl-C cannot be delivered to the terminal.

Cc: Andrzej Zaborowski  <balrog@zabor.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Anthony Liguori <aliguori@us.ibm.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Hitoshi Mitake <h.mitake@gmail.com>
---

v2: is_daemonized() is now called in main(), not in curses_display_init()

8<---
 os-posix.c      |    5 +++++
 qemu-os-posix.h |    2 ++
 qemu-os-win32.h |    5 +++++
 vl.c            |    3 ++-
 4 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 79fa228..99c5343 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -360,3 +360,8 @@ int qemu_create_pidfile(const char *filename)
     /* keep pidfile open & locked forever */
     return 0;
 }
+
+int is_daemonized(void)
+{
+    return daemonize;
+}
diff --git a/qemu-os-posix.h b/qemu-os-posix.h
index 8e1149d..0b2b60a 100644
--- a/qemu-os-posix.h
+++ b/qemu-os-posix.h
@@ -46,4 +46,6 @@ typedef struct timeval qemu_timeval;
 typedef struct timespec qemu_timespec;
 int qemu_utimens(const char *path, const qemu_timespec *times);
 
+int is_daemonized(void);
+
 #endif
diff --git a/qemu-os-win32.h b/qemu-os-win32.h
index 753679b..08a6fa8 100644
--- a/qemu-os-win32.h
+++ b/qemu-os-win32.h
@@ -86,4 +86,9 @@ typedef struct {
 } qemu_timeval;
 int qemu_gettimeofday(qemu_timeval *tp);
 
+static inline int is_daemonized(void)
+{
+    return 0;
+}
+
 #endif
diff --git a/vl.c b/vl.c
index 7c577fa..463f39e 100644
--- a/vl.c
+++ b/vl.c
@@ -3657,7 +3657,8 @@ int main(int argc, char **argv, char **envp)
         break;
 #if defined(CONFIG_CURSES)
     case DT_CURSES:
-        curses_display_init(ds, full_screen);
+        if (!is_daemonized())
+	    curses_display_init(ds, full_screen);
         break;
 #endif
 #if defined(CONFIG_SDL)
-- 
1.7.5.1



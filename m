Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TBmDe-0005Ls-FN
	for mharc-qemu-trivial@gnu.org; Wed, 12 Sep 2012 08:39:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TBmDc-0005Lf-Pu
	for qemu-trivial@nongnu.org; Wed, 12 Sep 2012 08:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TBmDa-0004gQ-I2
	for qemu-trivial@nongnu.org; Wed, 12 Sep 2012 08:39:00 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:35280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TBmDa-0004gA-BP
	for qemu-trivial@nongnu.org; Wed, 12 Sep 2012 08:38:58 -0400
Received: by dadn15 with SMTP id n15so1034283dad.4
	for <qemu-trivial@nongnu.org>; Wed, 12 Sep 2012 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=npcd0LiUHlfynZL34pZSmHipiuYZwmY82e4l5fsWbAY=;
	b=QZGt/t+Axyf9PJr0oFyShfyJoWKt/dUQLxeYRGprJvtVjRL2HMZgnZVoy/9IVAbH+6
	3Ui4fCZi28WRtWDxpCowGSpYzzPZIxf3RBPfmTjEk5XRle5Mb78wJ13d+7HkRrbe9lo/
	ZTg9qdx9T0+WKLXybXXlhsXROicZYCLDPdsO5hcN2j0Y7OcuE9mrUNbpUlh6BP+ae2Ur
	y/zAB2vJanUE4lTwuOTEuJ00NPiIUotXOVZtohmjIiIvgeA6IlEAqj0Ibfk/bjTAvi5O
	KD8dhCGdrhiZPzAer7hAmye9BuxffY3RNAD5VroHpUpZ8e6fflwAdf34/k1AFWGqdLNy
	QbRQ==
Received: by 10.68.213.5 with SMTP id no5mr915185pbc.24.1347453535950;
	Wed, 12 Sep 2012 05:38:55 -0700 (PDT)
Received: from localhost.localdomain
	(i114-181-221-120.s04.a013.ap.plala.or.jp. [114.181.221.120])
	by mx.google.com with ESMTPS id hx9sm11339414pbc.68.2012.09.12.05.38.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 05:38:54 -0700 (PDT)
From: Hitoshi Mitake <h.mitake@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 12 Sep 2012 21:38:30 +0900
Message-Id: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
X-Mailer: git-send-email 1.7.5.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>, h.mitake@gmail.com
Subject: [Qemu-trivial] [PATCH] curses: don't initialize curses when qemu is
	daemonized
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
X-List-Received-Date: Wed, 12 Sep 2012 12:39:02 -0000

Current qemu initializes curses even if -daemonize option is
passed. This cause problem because shell prompt appears without
calling endwin().

This patch adds new function, is_daemonized(), to OS dependent
code. With this function, curses_display_init() can check that qemu is
daemonized or not. If daemonized, curses_display_init() returns
immediately.

Of course, -daemonize && -curses doesn't make sense. Users shouldn't
pass the arguments at the same time. But the problem is very painful
because Ctrl-C cannot be delivered to the terminal. So if this
approach isn't acceptable, -daemonize && -curses combination should be
treated as error.


BTW, I didn't build and test on windows environment because I don't
have it which is capable of qemu build. Could someone build and test
it on windows?

Cc: Andrzej Zaborowski  <balrog@zabor.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Anthony Liguori <aliguori@us.ibm.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Hitoshi Mitake <h.mitake@gmail.com>
---
 os-posix.c      |    5 +++++
 qemu-os-posix.h |    2 ++
 qemu-os-win32.h |    5 +++++
 ui/curses.c     |    4 ++++
 4 files changed, 16 insertions(+), 0 deletions(-)

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
diff --git a/ui/curses.c b/ui/curses.c
index c2be2c6..fc6ae8c 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -335,6 +335,10 @@ static void curses_keyboard_setup(void)
 void curses_display_init(DisplayState *ds, int full_screen)
 {
     DisplayChangeListener *dcl;
+
+    if (is_daemonized())
+        return;
+
 #ifndef _WIN32
     if (!isatty(1)) {
         fprintf(stderr, "We need a terminal output\n");
-- 
1.7.5.1



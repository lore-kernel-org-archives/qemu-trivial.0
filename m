Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8Z-0002dO-Kr
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomvX-0004ud-2j
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomvV-00018C-I6
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:49:50 -0400
Received: from [222.73.24.84] (port=54261 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UomvU-00017P-S2; Mon, 17 Jun 2013 23:49:49 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584456"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 11:46:53 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I3nlxM016580;
	Tue, 18 Jun 2013 11:49:47 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061811474501-2222953 ;
	Tue, 18 Jun 2013 11:47:45 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 18 Jun 2013 11:45:37 +0800
Message-Id: <1371527137-16949-5-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 11:47:45,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 11:47:45,
	Serialize complete at 2013/06/18 11:47:45
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:29 -0400
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH v2 5/5] ui: boolize 'full_screen'
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
X-List-Received-Date: Tue, 18 Jun 2013 03:49:52 -0000

full_screen parameter for functions sdl_display_init,
cocoa_display_init, curses_display_init should be
boolized by actual usage.
also boolize 'full_screen' in vl.c

it may be bold for cocoa, so if it hurts,
these changes can be dropped.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 include/ui/console.h |    6 +++---
 ui/curses.c          |    2 +-
 ui/sdl.c             |    2 +-
 vl.c                 |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 98edf41..e927229 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -306,10 +306,10 @@ CharDriverState *vc_init(ChardevVC *vc);
 void register_vc_handler(VcHandler *handler);
 
 /* sdl.c */
-void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
+void sdl_display_init(DisplayState *ds, bool full_screen, int no_frame);
 
 /* cocoa.m */
-void cocoa_display_init(DisplayState *ds, int full_screen);
+void cocoa_display_init(DisplayState *ds, bool full_screen);
 
 /* vnc.c */
 void vnc_display_init(DisplayState *ds);
@@ -331,7 +331,7 @@ static inline int vnc_display_pw_expire(DisplayState *ds, time_t expires)
 #endif
 
 /* curses.c */
-void curses_display_init(DisplayState *ds, int full_screen);
+void curses_display_init(DisplayState *ds, bool full_screen);
 
 /* input.c */
 int index_from_key(const char *key);
diff --git a/ui/curses.c b/ui/curses.c
index 289a955..aaee070 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -336,7 +336,7 @@ static const DisplayChangeListenerOps dcl_ops = {
     .dpy_text_cursor = curses_cursor_position,
 };
 
-void curses_display_init(DisplayState *ds, int full_screen)
+void curses_display_init(DisplayState *ds, bool full_screen)
 {
 #ifndef _WIN32
     if (!isatty(1)) {
diff --git a/ui/sdl.c b/ui/sdl.c
index 39a42d6..643e095 100644
--- a/ui/sdl.c
+++ b/ui/sdl.c
@@ -868,7 +868,7 @@ static const DisplayChangeListenerOps dcl_ops = {
     .dpy_cursor_define = sdl_mouse_define,
 };
 
-void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
+void sdl_display_init(DisplayState *ds, bool full_screen, int no_frame)
 {
     int flags;
     uint8_t data = 0;
diff --git a/vl.c b/vl.c
index f94ec9c..d474f76 100644
--- a/vl.c
+++ b/vl.c
@@ -198,7 +198,7 @@ static int rtc_utc = 1;
 static int rtc_date_offset = -1; /* -1 means no change */
 QEMUClock *rtc_clock;
 int vga_interface_type = VGA_NONE;
-static int full_screen = 0;
+static bool full_screen = false;
 static int no_frame = 0;
 int no_quit = 0;
 CharDriverState *serial_hds[MAX_SERIAL_PORTS];
@@ -3520,7 +3520,7 @@ int main(int argc, char **argv, char **envp)
 		loadvm = optarg;
 		break;
             case QEMU_OPTION_full_screen:
-                full_screen = 1;
+                full_screen = true;
                 break;
             case QEMU_OPTION_no_frame:
                 no_frame = 1;
-- 
1.7.2.5



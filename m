Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlXIb-0004Wv-MR
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 22:23:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlXIY-0004Kk-6Q
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:23:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlXIX-0007ey-AB
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 22:23:06 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:56160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QlXIU-0007eY-RY; Mon, 25 Jul 2011 22:23:03 -0400
Received: by pzk1 with SMTP id 1so9821068pzk.30
	for <multiple recipients>; Mon, 25 Jul 2011 19:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HxiKlBuRVXXm/yxDLZZH5PbN/dvKd1gljcve8qMMQHE=;
	b=Wnos9qDHFplVO64WJzkT3wCXDRrRCXi1Uczy7t6FZ9yaRGnhPP7lctkt5aiBlX3k96
	kl2YWNDk9JyzseaJRFxivW775KbpDifvlpd5Cgd/lGzoP7nWwcMWcq7FKfqfGYwvm/cD
	5bCgAQefC0krkcvXzey5a0yfQwYfvyjFcg/3E=
Received: by 10.68.66.3 with SMTP id b3mr8636463pbt.196.1311646981460;
	Mon, 25 Jul 2011 19:23:01 -0700 (PDT)
Received: from localhost.localdomain ([211.101.48.70])
	by mx.google.com with ESMTPS id q2sm22407pbj.19.2011.07.25.19.22.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 19:23:00 -0700 (PDT)
From: TeLeMan <geleman@gmail.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Tue, 26 Jul 2011 10:24:09 +0800
Message-Id: <1311647049-1896-1-git-send-email-geleman@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] console: Don't expose the the ui module's
	functions when the module is not available.
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
X-List-Received-Date: Tue, 26 Jul 2011 02:23:07 -0000

If there is no sdl support, the implement of sdl_display_init() is missing and its declaration should not be exposed.
vnc, cocoa, curses and other ui modules are the same as sdl.

Signed-off-by: TeLeMan <geleman@gmail.com>
---
 console.h |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/console.h b/console.h
index 67d1373..ede8bea 100644
--- a/console.h
+++ b/console.h
@@ -363,19 +363,24 @@ void qemu_console_copy(DisplayState *ds, int src_x, int src_y,
                        int dst_x, int dst_y, int w, int h);
 
 /* sdl.c */
+#ifdef CONFIG_SDL
 void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
+#endif
 
 /* cocoa.m */
+#ifdef CONFIG_COCOA
 void cocoa_display_init(DisplayState *ds, int full_screen);
+#endif
 
 /* vnc.c */
+#ifdef CONFIG_VNC
 void vnc_display_init(DisplayState *ds);
 void vnc_display_close(DisplayState *ds);
 int vnc_display_open(DisplayState *ds, const char *display);
 void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
 int vnc_display_disable_login(DisplayState *ds);
 char *vnc_display_local_addr(DisplayState *ds);
-#ifdef CONFIG_VNC
+
 int vnc_display_password(DisplayState *ds, const char *password);
 int vnc_display_pw_expire(DisplayState *ds, time_t expires);
 void do_info_vnc_print(Monitor *mon, const QObject *data);
@@ -401,6 +406,8 @@ static inline void do_info_vnc_print(Monitor *mon, const QObject *data)
 #endif
 
 /* curses.c */
+#ifdef CONFIG_CURSES
 void curses_display_init(DisplayState *ds, int full_screen);
+#endif
 
 #endif
-- 
1.7.3.1.msysgit.0



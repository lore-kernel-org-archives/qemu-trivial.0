Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDvO-0008Lz-Nj
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:39:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDvM-0008Is-I5
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:39:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDvL-0000sF-6P
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:39:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpDvI-0000rP-Bs; Wed, 19 Jun 2013 04:39:24 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B232041974;
	Wed, 19 Jun 2013 12:39:23 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id ACE0251E; Wed, 19 Jun 2013 12:39:21 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: liguang <lig.fnst@cn.fujitsu.com>
Date: Wed, 19 Jun 2013 12:39:17 +0400
Message-Id: <1371631157-18096-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial] vnc: use booleans for vnc_connect,
	vnc_listen_read and vnc_display_add_client
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
X-List-Received-Date: Wed, 19 Jun 2013 08:39:29 -0000

Some arguments to these functions are booleans - either by declaration,
or by actual usage, but sometimes value of 0 or 1 is passed for a bool,
and sometimes it is declared as int but a bool value, or true/false,
is passed to it instead.  Clean it up a bit.

Cc: liguang <lig.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/ui/console.h |    2 +-
 ui/vnc.c             |   15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index f1d79f9..98edf41 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -314,7 +314,7 @@ void cocoa_display_init(DisplayState *ds, int full_screen);
 /* vnc.c */
 void vnc_display_init(DisplayState *ds);
 void vnc_display_open(DisplayState *ds, const char *display, Error **errp);
-void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
+void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth);
 char *vnc_display_local_addr(DisplayState *ds);
 #ifdef CONFIG_VNC
 int vnc_display_password(DisplayState *ds, const char *password);
diff --git a/ui/vnc.c b/ui/vnc.c
index dfc7459..5601cc3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2771,7 +2771,8 @@ static void vnc_refresh(DisplayChangeListener *dcl)
     }
 }
 
-static void vnc_connect(VncDisplay *vd, int csock, int skipauth, bool websocket)
+static void vnc_connect(VncDisplay *vd, int csock,
+                        bool skipauth, bool websocket)
 {
     VncState *vs = g_malloc0(sizeof(VncState));
     int i;
@@ -2883,19 +2884,19 @@ static void vnc_listen_read(void *opaque, bool websocket)
     }
 
     if (csock != -1) {
-        vnc_connect(vs, csock, 0, websocket);
+        vnc_connect(vs, csock, false, websocket);
     }
 }
 
 static void vnc_listen_regular_read(void *opaque)
 {
-    vnc_listen_read(opaque, 0);
+    vnc_listen_read(opaque, false);
 }
 
 #ifdef CONFIG_VNC_WS
 static void vnc_listen_websocket_read(void *opaque)
 {
-    vnc_listen_read(opaque, 1);
+    vnc_listen_read(opaque, true);
 }
 #endif /* CONFIG_VNC_WS */
 
@@ -3283,7 +3284,7 @@ void vnc_display_open(DisplayState *ds, const char *display, Error **errp)
         if (csock < 0) {
             goto fail;
         }
-        vnc_connect(vs, csock, 0, 0);
+        vnc_connect(vs, csock, false, false);
     } else {
         /* listen for connects */
         char *dpy;
@@ -3341,9 +3342,9 @@ fail:
 #endif /* CONFIG_VNC_WS */
 }
 
-void vnc_display_add_client(DisplayState *ds, int csock, int skipauth)
+void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth)
 {
     VncDisplay *vs = vnc_display;
 
-    vnc_connect(vs, csock, skipauth, 0);
+    vnc_connect(vs, csock, skipauth, false);
 }
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmN6F-0004Bu-2K
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:50:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmN6B-00047d-UK
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:50:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmN69-0006ja-LK
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:50:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmN65-0006ie-Cl; Tue, 11 Jun 2013 07:50:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A63684123A;
	Tue, 11 Jun 2013 15:50:43 +0400 (MSK)
Message-ID: <51B70F11.7090101@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 15:50:41 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/5] vnc: pass bool pararmeter for
	vnc_connect
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
X-List-Received-Date: Tue, 11 Jun 2013 11:50:53 -0000

11.06.2013 09:15, liguang wrote:
> type last parameter of vnc_connect if bool,
> so pass 'false' instead of '0' for it.

There's another parameter in here, `skipauth', which should be
bool in vnc_connect(), and should be bool in vnc_display_add_client()
too.

Also, there's no big point in splitting 1/5 and 2/5 (vnc_listen_read),
I think.

Does something like the below look ok? (not even compile-tested)
(and I'd really rename `skipauth' to `doauth' everywhere, to mean
exactly the opposite so that we don't have double negatives, but
it is too late already)

From: Michael Tokarev <mjt@tls.msk.ru>
Date:   Tue Jun 11 15:42:44 2013 +0400

    vnc: use booleans for vnc_connect, vnc_listen_read and vnc_display_add_client

    Some arguments to these functions are booleans - either by declaration,
    or by actual usage, but sometimes value of 0 or 1 is passed for a bool,
    and sometimes it is declared as int but a bool value, or true/false,
    is passed to it instead.  Clean it up a bit.

    Cc: liguang <lig.fnst@cn.fujitsu.com>
    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

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



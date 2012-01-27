Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RquUd-0007vV-Gm
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 17:42:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RquUa-0007mM-Kl
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 17:42:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RquUZ-0002Me-Lr
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 17:42:00 -0500
Received: from fmmailgate02.web.de ([217.72.192.227]:46944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1RquUW-0002M2-Ff; Fri, 27 Jan 2012 17:41:57 -0500
Received: from moweb001.kundenserver.de (moweb001.kundenserver.de
	[172.19.20.114])
	by fmmailgate02.web.de (Postfix) with ESMTP id D08CF1C07A022;
	Fri, 27 Jan 2012 23:41:54 +0100 (CET)
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb002) with ESMTPA (Nemesis) id 0LmuMO-1SXxTa2V92-00hZdZ;
	Fri, 27 Jan 2012 23:41:54 +0100
Message-ID: <4F232832.8060907@web.de>
Date: Fri, 27 Jan 2012 23:41:54 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:NB5Pgyyh76fK9xO8DUdqz2KqqV8BkioRlaNlvFswdZr
	6bFlUThBoCcxT01MISfabZoBYCoqj+Z7yh8jKumpwZBXWD96Sg
	/d8ekodU6H6CpWfaCr9uvkjM1WOuJCMkjGKbkcb2AW9TL2PElo
	35byhCfqcDWKTjdCqwMvy49vpMRxZh5McnK7fo/D0i3RfrS1kw
	6vibsYkCR2UoO8XBtV7MQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: Erik Rull <erik.rull@rdsoftware.de>
Subject: [Qemu-trivial] [PATCH] sdl: Do not grab mouse on mode switch while
	in background
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
X-List-Received-Date: Fri, 27 Jan 2012 22:42:02 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

When the mouse mode changes to absolute while the SDL windows is not in
focus, refrain from grabbing the input. It would steal from some other
window.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

I bet this makes no difference for your problem, Erik, but I came
across this while trying to reproduce the issue.

 ui/sdl.c |   30 ++++++++++++++++--------------
 1 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/ui/sdl.c b/ui/sdl.c
index 8cafc44..384276d 100644
--- a/ui/sdl.c
+++ b/ui/sdl.c
@@ -483,12 +483,27 @@ static void sdl_grab_end(void)
     sdl_update_caption();
 }
 
+static void absolute_mouse_grab(void)
+{
+    int mouse_x, mouse_y;
+
+    if (SDL_GetAppState() & SDL_APPINPUTFOCUS) {
+        SDL_GetMouseState(&mouse_x, &mouse_y);
+        if (mouse_x > 0 && mouse_x < real_screen->w - 1 &&
+            mouse_y > 0 && mouse_y < real_screen->h - 1) {
+            sdl_grab_start();
+        }
+    }
+}
+
 static void sdl_mouse_mode_change(Notifier *notify, void *data)
 {
     if (kbd_mouse_is_absolute()) {
         if (!absolute_enabled) {
-            sdl_grab_start();
             absolute_enabled = 1;
+            if (is_graphic_console()) {
+                absolute_mouse_grab();
+            }
         }
     } else if (absolute_enabled) {
         if (!gui_fullscreen) {
@@ -571,19 +586,6 @@ static void toggle_full_screen(DisplayState *ds)
     vga_hw_update();
 }
 
-static void absolute_mouse_grab(void)
-{
-    int mouse_x, mouse_y;
-
-    if (SDL_GetAppState() & SDL_APPINPUTFOCUS) {
-        SDL_GetMouseState(&mouse_x, &mouse_y);
-        if (mouse_x > 0 && mouse_x < real_screen->w - 1 &&
-            mouse_y > 0 && mouse_y < real_screen->h - 1) {
-            sdl_grab_start();
-        }
-    }
-}
-
 static void handle_keydown(DisplayState *ds, SDL_Event *ev)
 {
     int mod_state;
-- 
1.7.3.4


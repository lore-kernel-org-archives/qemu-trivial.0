Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnZNc-0002MU-JB
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 15:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnZNa-0002Ih-1U
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 15:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnZNY-0004Jg-Oy
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 15:09:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnZNW-0004IS-CR; Fri, 14 Jun 2013 15:09:42 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D3BFE41664;
	Fri, 14 Jun 2013 23:09:39 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id C162150A; Fri, 14 Jun 2013 23:09:37 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 23:09:35 +0400
Message-Id: <1371236976-22500-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Wu <lekensteyn@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	=?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [Qemu-trivial] [PATCH] Revert "Unbreak -no-quit for GTK,
	validate SDL options"
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
X-List-Received-Date: Fri, 14 Jun 2013 19:09:47 -0000

This reverts commit 047d4e151dd462915786a4fddc12f774d0028af5.

The commit in question introduced old/legacy options (-no-quit
and some more) for the new interface type (gtk), -- on the
second thought I think we shouldn't do that, instead, we should
use the display-specific options (like -display sdl,frame=no),
and should not extend the legacy interface further which makes
messy quite fast.

And more, that change broke build without sdl, by referring to
`no_frame' variable which were guarded by #if SDL.

So reverting it for now I thinks is the best option.  Further
plan, I think, is to make the documentation more clear that
these options are legacy.

Cc: Peter Wu <lekensteyn@gmail.com>
Cc: qemu-trivial@nongnu.org
Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/vl.c b/vl.c
index 9f8fd6e..169c807 100644
--- a/vl.c
+++ b/vl.c
@@ -3524,6 +3524,7 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_full_screen:
                 full_screen = 1;
                 break;
+#ifdef CONFIG_SDL
             case QEMU_OPTION_no_frame:
                 no_frame = 1;
                 break;
@@ -3536,11 +3537,14 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 no_quit = 1;
                 break;
-#ifdef CONFIG_SDL
             case QEMU_OPTION_sdl:
                 display_type = DT_SDL;
                 break;
 #else
+            case QEMU_OPTION_no_frame:
+            case QEMU_OPTION_alt_grab:
+            case QEMU_OPTION_ctrl_grab:
+            case QEMU_OPTION_no_quit:
             case QEMU_OPTION_sdl:
                 fprintf(stderr, "SDL support is disabled\n");
                 exit(1);
@@ -4081,15 +4085,6 @@ int main(int argc, char **argv, char **envp)
 #endif
     }
 
-    if ((no_frame || alt_grab || ctrl_grab) && display_type != DT_SDL) {
-        fprintf(stderr, "-no-frame, -alt-grab and -ctrl-grab are only valid "
-                        "for SDL, ignoring option\n");
-    }
-    if (no_quit && (display_type != DT_GTK && display_type != DT_SDL)) {
-        fprintf(stderr, "-no-quit is only valid for GTK and SDL, "
-                        "ignoring option\n");
-    }
-
 #if defined(CONFIG_GTK)
     if (display_type == DT_GTK) {
         early_gtk_display_init();
-- 
1.7.10.4



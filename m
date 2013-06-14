Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRfN-0001mM-OV
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfH-0001Yz-5h
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRfF-0005rb-LH
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:55:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRfA-0005pe-IB; Fri, 14 Jun 2013 06:55:24 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BD0EA41664;
	Fri, 14 Jun 2013 14:55:23 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 89EDF51C; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:27 +0400
Message-Id: <1371207042-17980-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Wu <lekensteyn@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/26] Unbreak -no-quit for GTK,
	validate SDL options
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
X-List-Received-Date: Fri, 14 Jun 2013 10:55:33 -0000

From: Peter Wu <lekensteyn@gmail.com>

Certain options (-no-frame, -alt-grab, -ctrl-grab) only make sense with SDL.
When compiling without SDL, these options (and -no-quit) print an error message
and exit qemu.

In case QEMU is compiled with SDL support, the three aforementioned options
still do not make sense with other display types. This patch addresses that
issue by printing a warning. I have chosen not to exit QEMU afterwards because
having the option is not harmful and before this patch it would be ignored
anyway.

By delaying the sanity check from compile-time with some ifdefs to run-time,
-no-quit is now also properly supported when compiling without SDL.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index 169c807..9f8fd6e 100644
--- a/vl.c
+++ b/vl.c
@@ -3524,7 +3524,6 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_full_screen:
                 full_screen = 1;
                 break;
-#ifdef CONFIG_SDL
             case QEMU_OPTION_no_frame:
                 no_frame = 1;
                 break;
@@ -3537,14 +3536,11 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 no_quit = 1;
                 break;
+#ifdef CONFIG_SDL
             case QEMU_OPTION_sdl:
                 display_type = DT_SDL;
                 break;
 #else
-            case QEMU_OPTION_no_frame:
-            case QEMU_OPTION_alt_grab:
-            case QEMU_OPTION_ctrl_grab:
-            case QEMU_OPTION_no_quit:
             case QEMU_OPTION_sdl:
                 fprintf(stderr, "SDL support is disabled\n");
                 exit(1);
@@ -4085,6 +4081,15 @@ int main(int argc, char **argv, char **envp)
 #endif
     }
 
+    if ((no_frame || alt_grab || ctrl_grab) && display_type != DT_SDL) {
+        fprintf(stderr, "-no-frame, -alt-grab and -ctrl-grab are only valid "
+                        "for SDL, ignoring option\n");
+    }
+    if (no_quit && (display_type != DT_GTK && display_type != DT_SDL)) {
+        fprintf(stderr, "-no-quit is only valid for GTK and SDL, "
+                        "ignoring option\n");
+    }
+
 #if defined(CONFIG_GTK)
     if (display_type == DT_GTK) {
         early_gtk_display_init();
-- 
1.7.10.4



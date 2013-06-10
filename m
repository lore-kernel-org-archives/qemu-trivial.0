Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um9kK-0002aE-26
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 17:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um9kC-0002P0-Dy
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>) id 1Um9k5-0005wX-Kd
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:35:16 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:64589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lekensteyn@gmail.com>)
	id 1Um9js-0005bI-5o; Mon, 10 Jun 2013 17:34:56 -0400
Received: by mail-wi0-f180.google.com with SMTP id c10so1820864wiw.13
	for <multiple recipients>; Mon, 10 Jun 2013 14:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=Q2WcTbGdLWuDRJoLtd/efPddqoQtklGBEAievMvmc9E=;
	b=uyCgFcf7EhDmaz63fZ/tbZY8JvmRZAHl4mTBp/X4LHLl2BtIk34ttmIoua+Yt84sBi
	yStndhN4QX28XGeLuiez0wG3iirDHOnLpdwVrQ7TGmJRmPLtBUxglmUYF+ASY1ccu0dU
	Ywvj1xF5eGtX7pMM/wAN61cFTvfw5Ba9ZvI3E1TTjaUHKhq1ngb2MOIadKo8n3cQOV6U
	cgC0xV5w3KkAxIlAlq518lgcWEGQaXiORRXNEzaf+zFsVQ74/x3pC5VNVIULN3CoINko
	lnsiQaP3a+152i5wd7W+2aBCXYriE/kX83xp7vzNafA3t6wACLJPXCNlwmu8nRJEH+O+
	Ldeg==
X-Received: by 10.180.78.35 with SMTP id y3mr5647705wiw.65.1370900095248;
	Mon, 10 Jun 2013 14:34:55 -0700 (PDT)
Received: from al.localnet (al.lekensteyn.nl. [2001:470:1f15:b83::c0d1:f1ed])
	by mx.google.com with ESMTPSA id
	b11sm13995323wiv.10.2013.06.10.14.34.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 14:34:54 -0700 (PDT)
From: Peter Wu <lekensteyn@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 10 Jun 2013 23:34:52 +0200
Message-ID: <8922048.8EFbqlEaG9@al>
User-Agent: KMail/4.10.4 (Linux/3.9.1-1-custom; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Subject: [Qemu-trivial] [PATCH] Unbreak -no-quit for GTK when SDL is disabled
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
X-List-Received-Date: Mon, 10 Jun 2013 21:35:22 -0000

When QEMU is built without SDL support, -no-quit would print an error message
that SDL is disabled. Since GTK also supports -no-quit, enable the option when
GTK or SDL is enabled at compile time.

While at it, do not create the no_quit variable when it is not used.

Signed-off-by: Peter Wu <lekensteyn@gmail.com>
---
 include/sysemu/sysemu.h |  2 ++
 vl.c                    | 13 +++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 2fb71af..b9b8e52 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -117,7 +117,9 @@ extern int smp_cpus;
 extern int max_cpus;
 extern int cursor_hide;
 extern int graphic_rotate;
+#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
 extern int no_quit;
+#endif
 extern int no_shutdown;
 extern int semihosting_enabled;
 extern int old_param;
diff --git a/vl.c b/vl.c
index cfd2d3e..74ab050 100644
--- a/vl.c
+++ b/vl.c
@@ -202,7 +202,9 @@ static int full_screen = 0;
 #ifdef CONFIG_SDL
 static int no_frame = 0;
 #endif
+#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
 int no_quit = 0;
+#endif
 CharDriverState *serial_hds[MAX_SERIAL_PORTS];
 CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
 CharDriverState *virtcon_hds[MAX_VIRTIO_CONSOLES];
@@ -3523,6 +3525,13 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_full_screen:
                 full_screen = 1;
                 break;
+            case QEMU_OPTION_no_quit:
+#if defined(CONFIG_SDL) || defined(CONFIG_GTK)
+                no_quit = 1;
+#else
+                fprintf(stderr, "SDL and GTK support are disabled\n");
+#endif
+                break;
 #ifdef CONFIG_SDL
             case QEMU_OPTION_no_frame:
                 no_frame = 1;
@@ -3533,9 +3542,6 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_ctrl_grab:
                 ctrl_grab = 1;
                 break;
-            case QEMU_OPTION_no_quit:
-                no_quit = 1;
-                break;
             case QEMU_OPTION_sdl:
                 display_type = DT_SDL;
                 break;
@@ -3543,7 +3549,6 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_frame:
             case QEMU_OPTION_alt_grab:
             case QEMU_OPTION_ctrl_grab:
-            case QEMU_OPTION_no_quit:
             case QEMU_OPTION_sdl:
                 fprintf(stderr, "SDL support is disabled\n");
                 exit(1);
-- 
1.8.3



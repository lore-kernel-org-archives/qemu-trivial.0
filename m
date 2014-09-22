Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyip-00073I-FZ
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:11:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyij-0006tz-O2
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyif-0006Bh-0A
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:11:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVyiS-00062D-Vk; Mon, 22 Sep 2014 04:11:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DF0EA45D0D;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8D36B6FA;
	Mon, 22 Sep 2014 12:11:18 +0400 (MSK)
Received: (nullmailer pid 16988 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:09 +0400
Message-Id: <1411373477-16938-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 1/9] qemu-char: Permit only a single "stdio"
	character device
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
X-List-Received-Date: Mon, 22 Sep 2014 08:11:46 -0000

From: Li Liu <john.liuli@huawei.com>

When more than one is used, the terminal settings aren't restored
correctly on exit.  Fixable.  However, such usage makes no sense,
because the users race for input, so outlaw it instead.

If you want to connect multiple things to stdio, use the mux
chardev.

Signed-off-by: Li Liu <john.liuli@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2a3cb9f..8623c70 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1017,6 +1017,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
 /* init terminal so that we can grab keys */
 static struct termios oldtty;
 static int old_fd0_flags;
+static bool stdio_in_use;
 static bool stdio_allow_signal;
 
 static void term_exit(void)
@@ -1060,8 +1061,15 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
         error_report("cannot use stdio with -daemonize");
         return NULL;
     }
+
+    if (stdio_in_use) {
+        error_report("cannot use stdio by multiple character devices");
+        exit(1);
+    }
+
+    stdio_in_use = true;
     old_fd0_flags = fcntl(0, F_GETFL);
-    tcgetattr (0, &oldtty);
+    tcgetattr(0, &oldtty);
     qemu_set_nonblock(0);
     atexit(term_exit);
 
-- 
1.7.10.4



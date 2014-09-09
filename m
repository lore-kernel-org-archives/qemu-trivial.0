Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRJTK-0003m4-Ao
	for mharc-qemu-trivial@gnu.org; Tue, 09 Sep 2014 07:20:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XRJTC-0003Zh-Fo
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 07:20:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XRJT7-0005aD-Kx
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 07:20:22 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:4515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XRJSx-0005Fh-C8; Tue, 09 Sep 2014 07:20:07 -0400
Received: from 172.24.2.119 (EHLO szxeml401-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBL18670; Tue, 09 Sep 2014 19:19:59 +0800 (CST)
Received: from localhost (10.142.143.9) by szxeml401-hub.china.huawei.com
	(10.82.67.31) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Sep 2014
	19:19:51 +0800
From: "john.liuli" <john.liuli@huawei.com>
To: <armbru@redhat.com>
Date: Tue, 9 Sep 2014 19:19:48 +0800
Message-ID: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] qemu-char: fix terminal crash when using
	"-monitor stdio -nographic"
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
X-List-Received-Date: Tue, 09 Sep 2014 11:20:28 -0000

From: Li Liu <john.liuli@huawei.com>

Eeay to reproduce, just try "qemu -monitor stdio -nographic"
and type "quit", then the terminal will be crashed.

There are two pathes try to call tcgetattr of stdio in vl.c:

1) Monitor_parse(optarg, "readline");
   .....
   qemu_opts_foreach(qemu_find_opts("chardev"),
                     chardev_init_func, NULL, 1) != 0)

2) if (default_serial)
   add_device_config(DEV_SERIAL, "stdio");
   ....
   if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)

Both of them will trigger qemu_chr_open_stdio which will disable
ECHO attributes. First one has updated the attributes of stdio
by calling qemu_chr_fe_set_echo(chr, false). And the tty
attributes has been saved in oldtty. Then the second path will
redo such actions, and the oldtty is overlapped. So till "quit",
term_exit can't recove the correct attributes.

Signed-off-by: Li Liu <john.liuli@huawei.com>
---
changes v1 -> v2:
1) as Markus Armbruster and Gerd Hoffmann suggested :
   Multiple character devices can't use the same terminal.
   So catch and reject the attempt if stdio is opened already.

---
 qemu-char.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index d4f327a..f8f0c48 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1017,6 +1017,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
 /* init terminal so that we can grab keys */
 static struct termios oldtty;
 static int old_fd0_flags;
+static bool stdio_is_ready;
 static bool stdio_allow_signal;
 
 static void term_exit(void)
@@ -1060,8 +1061,15 @@ static CharDriverState *qemu_chr_open_stdio(ChardevStdio *opts)
         error_report("cannot use stdio with -daemonize");
         return NULL;
     }
+
+    if (stdio_is_ready) {
+        error_report("cannot use stdio by multiple character devices");
+        exit(1);
+    }
+
+    stdio_is_ready = true;
     old_fd0_flags = fcntl(0, F_GETFL);
-    tcgetattr (0, &oldtty);
+    tcgetattr(0, &oldtty);
     qemu_set_nonblock(0);
     atexit(term_exit);
 
-- 
1.7.9.5




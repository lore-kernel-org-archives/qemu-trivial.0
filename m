Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoZt-0001At-Sh
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZq-00018m-G1
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZp-0005bH-Ee
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZj-0005VH-86; Mon, 27 Jul 2015 16:00:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CBC09425A7;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A3B5FA71;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9536 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:13 +0300
Message-Id: <226d007dbd75ec8d0f12d0f9e1ce66caf55d49e4.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/10] gdbstub: Set current CPU on
	interruptions
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:47 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

gdb expects that the thread ID for c and g-class operations is set to
the CPU we provide when reporting VM stop conditions. If the stub is
still tuned to a different CPU, the wrong information is delivered to
the gdb frontend.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub.c b/gdbstub.c
index 92b2f81..ffe7e6e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1285,6 +1285,7 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
         ret = GDB_SIGNAL_UNKNOWN;
         break;
     }
+    gdb_set_stop_cpu(cpu);
     snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_index(cpu));
 
 send_packet:
-- 
2.1.4



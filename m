Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIgDB-0001FN-88
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2015 12:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1ZIgD8-0001AO-RO
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 12:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1ZIgD7-0006bH-UM
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 12:52:38 -0400
Received: from david.siemens.de ([192.35.17.14]:45261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1ZIgD3-0006ZS-HU; Fri, 24 Jul 2015 12:52:33 -0400
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.1/8.15.1) with ESMTPS id t6OGqVgu012909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 24 Jul 2015 18:52:31 +0200
Received: from md1f2u6c.ww002.siemens.net ([139.25.68.37])
	by mail2.siemens.de (8.15.1/8.15.1) with ESMTP id t6OGqVYf024833;
	Fri, 24 Jul 2015 18:52:31 +0200
To: qemu-trivial <qemu-trivial@nongnu.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <55B26D4F.3040108@siemens.com>
Date: Fri, 24 Jul 2015 18:52:31 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.14
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] gdbstub: Set current CPU on interruptions
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
X-List-Received-Date: Fri, 24 Jul 2015 16:52:39 -0000

gdb expects that the thread ID for c and g-class operations is set to
the CPU we provide when reporting VM stop conditions. If the stub is
still tuned to a different CPU, the wrong information is delivered to
the gdb frontend.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
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


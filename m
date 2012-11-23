Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tbxjv-0002a5-MT
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2012 13:12:35 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjm-00026z-LD
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1Tbxjl-0001XP-R7
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2012 13:12:26 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:53001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1Tbxjj-0001Wa-3g; Fri, 23 Nov 2012 13:12:23 -0500
Received: from blackfin.pond.sub.org (p57B0F971.dip.t-dialin.net
	[87.176.249.113])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 8D1D69FE68;
	Fri, 23 Nov 2012 19:12:19 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D94292009C; Fri, 23 Nov 2012 19:12:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2012 19:12:18 +0100
Message-Id: <1353694338-13162-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353694338-13162-1-git-send-email-armbru@redhat.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com
Subject: [Qemu-trivial] [PATCH 2/2] pc_sysfw: Plug memory leak on
	pc_fw_add_pflash_drv() error path
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
X-List-Received-Date: Fri, 23 Nov 2012 18:12:28 -0000

Harmless, because we the error inevitably leads to another, fatal one
in pc_system_flash_init(): PC system firmware (pflash) not available.
Fix it anyway.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pc_sysfw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pc_sysfw.c b/hw/pc_sysfw.c
index 066c4fe..67fe87b 100644
--- a/hw/pc_sysfw.c
+++ b/hw/pc_sysfw.c
@@ -103,7 +103,9 @@ static void pc_fw_add_pflash_drv(void)
       return;
     }
 
-    drive_init(opts, machine->use_scsi);
+    if (!drive_init(opts, machine->use_scsi)) {
+        qemu_opts_del(opts);
+    }
 }
 
 static void pc_system_flash_init(MemoryRegion *rom_memory,
-- 
1.7.11.7



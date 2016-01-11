Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYHt-0001wm-M1
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:57:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHq-0001qk-9U
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYHp-0004QL-Fo
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:57:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYHk-0004Ox-Mh; Mon, 11 Jan 2016 03:57:08 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C638403F8;
	Mon, 11 Jan 2016 11:57:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 41BB2ADD;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28800 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:56 +0300
Message-Id: <ff433bbb82d2c1b4c0146ccb0ce78f58fb382fda.1452501578.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PULL 17/19] hw/acpi: Remove superfluous return
	statement
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
X-List-Received-Date: Mon, 11 Jan 2016 08:57:15 -0000

From: Thomas Huth <thuth@redhat.com>

The "return;" statement at the end of acpi_memory_plug_cb()
does not make much sense, so let's remove it.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/memory_hotplug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 298e868..65cbc80 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -250,7 +250,6 @@ void acpi_memory_plug_cb(ACPIREGS *ar, qemu_irq irq, MemHotplugState *mem_st,
         /* do ACPI magic */
         acpi_send_gpe_event(ar, irq, ACPI_MEMORY_HOTPLUG_STATUS);
     }
-    return;
 }
 
 void acpi_memory_unplug_request_cb(ACPIREGS *ar, qemu_irq irq,
-- 
2.1.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk6rl-0005GI-87
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 03:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rb-0004vT-NA
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rS-0003LH-Vi
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:10:59 -0400
Received: from g2t2352.austin.hp.com ([15.217.128.51]:15666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1Wk6qu-0002sx-D2; Tue, 13 May 2014 03:10:16 -0400
Received: from g2t2360.austin.hp.com (g2t2360.austin.hp.com [16.197.8.247])
	by g2t2352.austin.hp.com (Postfix) with ESMTP id 8BE6D197;
	Tue, 13 May 2014 07:10:10 +0000 (UTC)
Received: from piepie.asiapacific.hpqcorp.net (piepie.asiapacific.hpqcorp.net
	[16.187.245.80])
	by g2t2360.austin.hp.com (Postfix) with ESMTP id 2E8AB46;
	Tue, 13 May 2014 07:10:08 +0000 (UTC)
From: "Li, Zhen-Hua" <zhen-hual@hp.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<qemu-stable@nongnu.org>
Date: Tue, 13 May 2014 15:09:11 +0800
Message-Id: <1399964954-10842-2-git-send-email-zhen-hual@hp.com>
X-Mailer: git-send-email 2.0.0-rc0
In-Reply-To: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.217.128.51
Cc: "Li, ZhenHua" <zhen-hual@hp.com>
Subject: [Qemu-trivial] [PATCH 1/4] Support more than 255 cpus: ACPI and
	APIC defines
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
X-List-Received-Date: Tue, 13 May 2014 07:11:08 -0000

From: "Li, ZhenHua" <zhen-hual@hp.com>

Change ACPI_CPU_HOTPLUG_ID_LIMIT from 256 to 4096;
Change MAX_APICS from 256 to 4096;

Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
---
 include/hw/acpi/cpu_hotplug_defs.h | 4 ++--
 include/hw/i386/apic_internal.h    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/cpu_hotplug_defs.h b/include/hw/acpi/cpu_hotplug_defs.h
index 9f33663..17381e6 100644
--- a/include/hw/acpi/cpu_hotplug_defs.h
+++ b/include/hw/acpi/cpu_hotplug_defs.h
@@ -21,10 +21,10 @@
 /* Limit for CPU arch IDs for CPU hotplug. All hotpluggable CPUs should
  * have CPUClass.get_arch_id() < ACPI_CPU_HOTPLUG_ID_LIMIT.
  */
-#define ACPI_CPU_HOTPLUG_ID_LIMIT 256
+#define ACPI_CPU_HOTPLUG_ID_LIMIT 4096
 
 /* 256 CPU IDs, 8 bits per entry: */
-#define ACPI_GPE_PROC_LEN 32
+#define ACPI_GPE_PROC_LEN ((ACPI_CPU_HOTPLUG_ID_LIMIT)/8)
 
 #define ICH9_CPU_HOTPLUG_IO_BASE 0x0CD8
 #define PIIX4_CPU_HOTPLUG_IO_BASE 0xaf00
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 70542a6..e21f30e 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -64,7 +64,7 @@
 #define VAPIC_ENABLE_BIT                0
 #define VAPIC_ENABLE_MASK               (1 << VAPIC_ENABLE_BIT)
 
-#define MAX_APICS 255
+#define MAX_APICS 4096
 
 typedef struct APICCommonState APICCommonState;
 
-- 
2.0.0-rc0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnElD-0002eN-3a
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 17:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59B-0001h6-3g
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59A-0007sJ-13
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:53 -0400
Received: from [222.73.24.84] (port=11064 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1Un596-0007o0-PA; Thu, 13 Jun 2013 06:52:49 -0400
X-IronPort-AV: E=Sophos;i="4.87,858,1363104000"; 
   d="scan'208";a="7536754"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 13 Jun 2013 18:49:42 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5DAqZDt009320;
	Thu, 13 Jun 2013 18:52:35 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061318504038-2095058 ;
	Thu, 13 Jun 2013 18:50:40 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 13 Jun 2013 18:51:47 +0800
Message-Id: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.2.3
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/13 18:50:40,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/13 18:50:41,
	Serialize complete at 2013/06/13 18:50:41
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Thu, 13 Jun 2013 17:08:43 -0400
Subject: [Qemu-trivial] [PATCH] fix some printf errors when debug is enabled
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
X-List-Received-Date: Thu, 13 Jun 2013 10:52:54 -0000


Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 cputlb.c        | 4 ++--
 hw/acpi/piix4.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index 86666c8..1230e9e 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong vaddr,
 
 #if defined(DEBUG_TLB)
     printf("tlb_set_page: vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
-           " prot=%x idx=%d pd=0x%08lx\n",
-           vaddr, paddr, prot, mmu_idx, pd);
+           " prot=%x idx=%d\n",
+           vaddr, paddr, prot, mmu_idx);
 #endif
 
     address = vaddr;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index e6525ac..eafa76f 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -518,7 +518,7 @@ static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
     PIIX4PMState *s = opaque;
     uint32_t val = acpi_gpe_ioport_readb(&s->ar, addr);
 
-    PIIX4_DPRINTF("gpe read %x == %x\n", addr, val);
+    PIIX4_DPRINTF("gpe read %lx == %x\n", addr, val);
     return val;
 }
 
@@ -530,7 +530,7 @@ static void gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
     acpi_gpe_ioport_writeb(&s->ar, addr, val);
     pm_update_sci(s);
 
-    PIIX4_DPRINTF("gpe write %x <== %d\n", addr, val);
+    PIIX4_DPRINTF("gpe write %lx <== %lu\n", addr, val);
 }
 
 static const MemoryRegionOps piix4_gpe_ops = {
@@ -579,7 +579,7 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
     switch (addr) {
     case PCI_EJ_BASE - PCI_HOTPLUG_ADDR:
         acpi_piix_eject_slot(opaque, (uint32_t)data);
-        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <== % " PRIu64 "\n",
+        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <== %" PRIu64 "\n",
                       addr, data);
         break;
     default:
-- 
1.8.2.3



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnElD-0002fi-Ui
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 17:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59D-0001np-Jp
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1Un59C-0007tH-OD
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 06:52:55 -0400
Received: from [222.73.24.84] (port=11064 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1Un598-0007o0-16; Thu, 13 Jun 2013 06:52:50 -0400
X-IronPort-AV: E=Sophos;i="4.87,858,1363104000"; 
   d="scan'208";a="7536755"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 13 Jun 2013 18:49:42 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5DAqZnn009321;
	Thu, 13 Jun 2013 18:52:35 +0800
Received: from G08FNSTD100614.fnst.cn.fujitsu.com ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061318504084-2095059 ;
	Thu, 13 Jun 2013 18:50:40 +0800 
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 13 Jun 2013 18:51:48 +0800
Message-Id: <1371120709-18923-2-git-send-email-hutao@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/13 18:50:40,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/13 18:50:41,
	Serialize complete at 2013/06/13 18:50:41
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Thu, 13 Jun 2013 17:08:43 -0400
Subject: [Qemu-trivial] [PATCH] fix typo: apci -> acpi
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
X-List-Received-Date: Thu, 13 Jun 2013 10:52:56 -0000


Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
---
 hw/acpi/ich9.c  | 4 ++--
 hw/acpi/piix4.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 4a17f32..100b01f 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -215,11 +215,11 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, 2);
 
     acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
-    memory_region_init_io(&pm->io_gpe, &ich9_gpe_ops, pm, "apci-gpe0",
+    memory_region_init_io(&pm->io_gpe, &ich9_gpe_ops, pm, "acpi-gpe0",
                           ICH9_PMIO_GPE0_LEN);
     memory_region_add_subregion(&pm->io, ICH9_PMIO_GPE0_STS, &pm->io_gpe);
 
-    memory_region_init_io(&pm->io_smi, &ich9_smi_ops, pm, "apci-smi",
+    memory_region_init_io(&pm->io_smi, &ich9_smi_ops, pm, "acpi-smi",
                           8);
     memory_region_add_subregion(&pm->io, ICH9_PMIO_SMI_EN, &pm->io_smi);
 
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index eafa76f..ad4a364 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -670,18 +670,18 @@ static int piix4_device_hotplug(DeviceState *qdev, PCIDevice *dev,
 static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                                            PCIBus *bus, PIIX4PMState *s)
 {
-    memory_region_init_io(&s->io_gpe, &piix4_gpe_ops, s, "apci-gpe0",
+    memory_region_init_io(&s->io_gpe, &piix4_gpe_ops, s, "acpi-gpe0",
                           GPE_LEN);
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
-    memory_region_init_io(&s->io_pci, &piix4_pci_ops, s, "apci-pci-hotplug",
+    memory_region_init_io(&s->io_pci, &piix4_pci_ops, s, "acpi-pci-hotplug",
                           PCI_HOTPLUG_SIZE);
     memory_region_add_subregion(parent, PCI_HOTPLUG_ADDR,
                                 &s->io_pci);
     pci_bus_hotplug(bus, piix4_device_hotplug, &s->dev.qdev);
 
     qemu_for_each_cpu(piix4_init_cpu_status, &s->gpe_cpu);
-    memory_region_init_io(&s->io_cpu, &cpu_hotplug_ops, s, "apci-cpu-hotplug",
+    memory_region_init_io(&s->io_cpu, &cpu_hotplug_ops, s, "acpi-cpu-hotplug",
                           PIIX4_PROC_LEN);
     memory_region_add_subregion(parent, PIIX4_PROC_BASE, &s->io_cpu);
     s->cpu_added_notifier.notify = piix4_cpu_added_req;
-- 
1.8.2.3



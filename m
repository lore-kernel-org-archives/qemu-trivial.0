Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbXaZ-0003Gh-CZ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2012 09:17:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TbXaV-00034X-Et
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TbXaP-0004St-Fu
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:17:07 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:44982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TbXa6-0004OG-10; Thu, 22 Nov 2012 09:16:42 -0500
Received: from blackfin.pond.sub.org (p5B32A88D.dip.t-dialin.net
	[91.50.168.141])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 3ED409FE48;
	Thu, 22 Nov 2012 15:16:37 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5F4BD2009B; Thu, 22 Nov 2012 15:16:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Nov 2012 15:16:36 +0100
Message-Id: <1353593796-26823-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH] Clean up pci_drive_hot_add()'s use of
	BlockInterfaceType
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
X-List-Received-Date: Thu, 22 Nov 2012 14:17:08 -0000

pci_drive_hot_add() parameter type has the wrong type: int instead of
BlockInterfaceType.  It's actually redundant, so we can just drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/device-hotplug.c | 11 ++++-------
 hw/pci-hotplug.c    |  7 +++----
 sysemu.h            |  3 +--
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/hw/device-hotplug.c b/hw/device-hotplug.c
index eec0fe3..6d9c080 100644
--- a/hw/device-hotplug.c
+++ b/hw/device-hotplug.c
@@ -49,18 +49,16 @@ DriveInfo *add_init_drive(const char *optstr)
 }
 
 #if !defined(TARGET_I386)
-int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
-                      DriveInfo *dinfo, int type)
+int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo *dinfo)
 {
     /* On non-x86 we don't do PCI hotplug */
-    monitor_printf(mon, "Can't hot-add drive to type %d\n", type);
+    monitor_printf(mon, "Can't hot-add drive to type %d\n", dinfo->type);
     return -1;
 }
 #endif
 
 void drive_hot_add(Monitor *mon, const QDict *qdict)
 {
-    int type;
     DriveInfo *dinfo = NULL;
     const char *opts = qdict_get_str(qdict, "opts");
 
@@ -72,14 +70,13 @@ void drive_hot_add(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "Parameter addr not supported\n");
         goto err;
     }
-    type = dinfo->type;
 
-    switch (type) {
+    switch (dinfo->type) {
     case IF_NONE:
         monitor_printf(mon, "OK\n");
         break;
     default:
-        if (pci_drive_hot_add(mon, qdict, dinfo, type)) {
+        if (pci_drive_hot_add(mon, qdict, dinfo)) {
             goto err;
         }
     }
diff --git a/hw/pci-hotplug.c b/hw/pci-hotplug.c
index e7fb780..d2121ee 100644
--- a/hw/pci-hotplug.c
+++ b/hw/pci-hotplug.c
@@ -105,15 +105,14 @@ static int scsi_hot_add(Monitor *mon, DeviceState *adapter,
     return 0;
 }
 
-int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
-                      DriveInfo *dinfo, int type)
+int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo *dinfo)
 {
     int dom, pci_bus;
     unsigned slot;
     PCIDevice *dev;
     const char *pci_addr = qdict_get_str(qdict, "pci_addr");
 
-    switch (type) {
+    switch (dinfo->type) {
     case IF_SCSI:
         if (pci_read_devaddr(mon, pci_addr, &dom, &pci_bus, &slot)) {
             goto err;
@@ -129,7 +128,7 @@ int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
         }
         break;
     default:
-        monitor_printf(mon, "Can't hot-add drive to type %d\n", type);
+        monitor_printf(mon, "Can't hot-add drive to type %d\n", dinfo->type);
         goto err;
     }
 
diff --git a/sysemu.h b/sysemu.h
index f5ac664..c1b370b 100644
--- a/sysemu.h
+++ b/sysemu.h
@@ -145,8 +145,7 @@ extern unsigned int nb_prom_envs;
 
 /* pci-hotplug */
 void pci_device_hot_add(Monitor *mon, const QDict *qdict);
-int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
-                      DriveInfo *dinfo, int type);
+int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo *dinfo);
 void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict);
 
 /* generic hotplug */
-- 
1.7.11.7



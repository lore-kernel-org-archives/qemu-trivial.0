Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfsFL-0000Aa-R0
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2015 12:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF4-00089G-NB
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZfsF1-0006Vm-RT
	for qemu-trivial@nongnu.org; Sat, 26 Sep 2015 12:22:30 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:28791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZfsEu-0006Mq-Eb; Sat, 26 Sep 2015 12:22:20 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 968564C8062;
	Sat, 26 Sep 2015 18:22:19 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-trivial@nongnu.org
Date: Sat, 26 Sep 2015 18:22:09 +0200
Message-Id: <1443284532-8634-8-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.4
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [Qemu-trivial] [PATCH 07/10][TRIVIAL] uninorth: add to bridge
	category
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
X-List-Received-Date: Sat, 26 Sep 2015 16:22:32 -0000

Uninorth is the mac99 PCI host controller, so add
it to the bridge category.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci-host/uninorth.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index f0144eb..215b64f 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -446,8 +446,10 @@ static const TypeInfo unin_internal_pci_host_info = {
 static void pci_unin_main_class_init(ObjectClass *klass, void *data)
 {
     SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbc->init = pci_unin_main_init_device;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_unin_main_info = {
@@ -460,8 +462,10 @@ static const TypeInfo pci_unin_main_info = {
 static void pci_u3_agp_class_init(ObjectClass *klass, void *data)
 {
     SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbc->init = pci_u3_agp_init_device;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_u3_agp_info = {
@@ -474,8 +478,10 @@ static const TypeInfo pci_u3_agp_info = {
 static void pci_unin_agp_class_init(ObjectClass *klass, void *data)
 {
     SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbc->init = pci_unin_agp_init_device;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_unin_agp_info = {
@@ -488,8 +494,10 @@ static const TypeInfo pci_unin_agp_info = {
 static void pci_unin_internal_class_init(ObjectClass *klass, void *data)
 {
     SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbc->init = pci_unin_internal_init_device;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pci_unin_internal_info = {
-- 
2.4.3



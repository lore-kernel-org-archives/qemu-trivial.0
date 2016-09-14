Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5LC-0000wF-8P
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:14:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L9-0000ry-AY
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L8-0000zI-8K
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5L1-0000vo-Gi; Wed, 14 Sep 2016 04:14:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 03D5F41849;
	Wed, 14 Sep 2016 11:14:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9273EB17;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17366 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:53 +0300
Message-Id: <f3f1ef84774aef77d344b196dea2a09b244b87a1.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 27/27] mptsas: change .realize function name
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:14:44 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

All the other devices` .realize function name are xxx_realize, except this one.

cc: Michael S. Tsirkin <mst@redhat.com>
cc: Marcel Apfelbaum <marcel@redhat.com>
cc: Paolo Bonzini <pbonzini@redhat.com>
cc: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/scsi/mptsas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 0e0a22f..8a3dee1 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1269,7 +1269,7 @@ static const struct SCSIBusInfo mptsas_scsi_info = {
     .load_request = mptsas_load_request,
 };
 
-static void mptsas_scsi_init(PCIDevice *dev, Error **errp)
+static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
 {
     DeviceState *d = DEVICE(dev);
     MPTSASState *s = MPT_SAS(dev);
@@ -1426,7 +1426,7 @@ static void mptsas1068_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
 
-    pc->realize = mptsas_scsi_init;
+    pc->realize = mptsas_scsi_realize;
     pc->exit = mptsas_scsi_uninit;
     pc->romfile = 0;
     pc->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
-- 
2.1.4



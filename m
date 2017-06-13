Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dKroJ-0001Ns-Hj
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jun 2017 15:49:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dKroG-0001LS-SY
	for qemu-trivial@nongnu.org; Tue, 13 Jun 2017 15:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dKroG-0000dx-5c
	for qemu-trivial@nongnu.org; Tue, 13 Jun 2017 15:49:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dKroA-0000bx-3I; Tue, 13 Jun 2017 15:48:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58F45145F88;
	Tue, 13 Jun 2017 19:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 58F45145F88
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 58F45145F88
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C635B8B7C7;
	Tue, 13 Jun 2017 19:48:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-trivial@nongnu.org
Date: Tue, 13 Jun 2017 21:48:49 +0200
Message-Id: <1497383329-10393-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 13 Jun 2017 19:48:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/pci-bridge/dec: Classify the DEC PCI
 bridge as bridge device
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
X-List-Received-Date: Tue, 13 Jun 2017 19:49:05 -0000

This way the bridge shows up in the correct section of the
"-device help" text.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-bridge/dec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index cca9362..eb275e1 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -62,6 +62,7 @@ static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     k->realize = dec_pci_bridge_realize;
     k->exit = pci_bridge_exitfn;
     k->vendor_id = PCI_VENDOR_ID_DEC;
@@ -118,6 +119,7 @@ static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     k->realize = dec_21154_pci_host_realize;
     k->vendor_id = PCI_VENDOR_ID_DEC;
     k->device_id = PCI_DEVICE_ID_DEC_21154;
-- 
1.8.3.1



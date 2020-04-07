Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLpYp-0001P4-RT
	for mharc-qemu-trivial@gnu.org; Tue, 07 Apr 2020 10:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1jLpYn-0001OK-Jm
 for qemu-trivial@nongnu.org; Tue, 07 Apr 2020 10:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1jLpYm-0005QJ-Ig
 for qemu-trivial@nongnu.org; Tue, 07 Apr 2020 10:50:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48978
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1jLpYm-0005Q2-Fo
 for qemu-trivial@nongnu.org; Tue, 07 Apr 2020 10:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586271039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5CasNZIfI3c/KVs7MUxC5qa1AEtTwGvtfAKsC4W3rXE=;
 b=fLL74rVEoxZIdgg3NYDaTte9S6kP237Tiiyi5fbqeCiKXsCOh9ahFD3dIW/VA4guUcFtAB
 VFoIoVTCyxhALKwgSgVLdH7AwwVGKqWxBXLVE+p/ZxttDhEhhvnq9hZpULNLICxG1SR9LG
 TSFbJ2ORFH57W1JLKjiZzuV9WLw6edc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-YnM3xCfnNoe6j6wgXZJE3A-1; Tue, 07 Apr 2020 10:50:36 -0400
X-MC-Unique: YnM3xCfnNoe6j6wgXZJE3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2048DB62;
 Tue,  7 Apr 2020 14:50:34 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0135C57A;
 Tue,  7 Apr 2020 14:50:23 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laine Stump <laine@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Julia Suvorova <jusual@redhat.com>
Subject: [PATCH] hw/pci/pcie: Forbid hot-plug via QMP if it's disabled on the
 slot
Date: Tue,  7 Apr 2020 16:50:17 +0200
Message-Id: <20200407145017.1041256-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2020 14:50:42 -0000

Raise an error when trying to hot-plug/unplug a device through QMP to a dev=
ice
with disabled hot-plug capability. This makes the device behaviour more
consistent and provides an explanation of the failure in the case of
asynchronous unplug.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/pci/pcie.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 0eb3a2a5d2..e9798caa8a 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -415,6 +415,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev,=
 DeviceState *dev,
 {
     PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev);
     uint8_t *exp_cap =3D hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
     PCIDevice *pci_dev =3D PCI_DEVICE(dev);
=20
     /* Don't send event when device is enabled during qemu machine creatio=
n:
@@ -430,6 +431,13 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev=
, DeviceState *dev,
         return;
     }
=20
+    /* Hot-plug is disabled on the slot */
+    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
+        error_setg(errp, "Device '%s' does not support hot-plug",
+                         DEVICE(hotplug_dev)->id);
+        return;
+    }
+
     /* To enable multifunction hot-plug, we just ensure the function
      * 0 added last. When function 0 is added, we set the sltsta and
      * inform OS via event notification.
@@ -464,14 +472,24 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice=
 *dev, void *opaque)
     object_unparent(OBJECT(dev));
 }
=20
-void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
+void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_handler,
                                      DeviceState *dev, Error **errp)
 {
     Error *local_err =3D NULL;
     PCIDevice *pci_dev =3D PCI_DEVICE(dev);
     PCIBus *bus =3D pci_get_bus(pci_dev);
+    PCIDevice *hotplug_dev =3D PCI_DEVICE(hotplug_handler);
+    uint8_t *exp_cap =3D hotplug_dev->config + hotplug_dev->exp.exp_cap;
+    uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP_SLTCAP);
+
+    /* Hot-unplug is disabled on the slot */
+    if ((sltcap & PCI_EXP_SLTCAP_HPC) =3D=3D 0) {
+        error_setg(errp, "Device '%s' does not support hot-unplug",
+                         DEVICE(hotplug_dev)->id);
+        return;
+    }
=20
-    pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, &local_err);
+    pcie_cap_slot_plug_common(hotplug_dev, dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -490,7 +508,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *ho=
tplug_dev,
         return;
     }
=20
-    pcie_cap_slot_push_attention_button(PCI_DEVICE(hotplug_dev));
+    pcie_cap_slot_push_attention_button(hotplug_dev);
 }
=20
 /* pci express slot for pci express root/downstream port
--=20
2.24.1



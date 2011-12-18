Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RcKNe-0003QO-9n
	for mharc-qemu-trivial@gnu.org; Sun, 18 Dec 2011 12:18:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RcKNc-0003Po-34
	for qemu-trivial@nongnu.org; Sun, 18 Dec 2011 12:18:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RcKNb-0007v2-5m
	for qemu-trivial@nongnu.org; Sun, 18 Dec 2011 12:18:32 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:44414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julian.pidancet@gmail.com>) id 1RcKNa-0007ux-UH
	for qemu-trivial@nongnu.org; Sun, 18 Dec 2011 12:18:31 -0500
Received: by werb10 with SMTP id b10so1076588wer.4
	for <qemu-trivial@nongnu.org>; Sun, 18 Dec 2011 09:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Sc+J2tDgrxznVJSRcy6K3xBf8c+zZ+2Zk8JuQZSFKxc=;
	b=yB0BegMhuyNlnZlab+iJPloox0S6rGB6iVrJAk1dWh1n5qC+ZSYmvz+UVw6JxOZNUi
	NFIQpSHXF2pQtBPqZRdRnUD8Qr4O0Us/03aAkeiPmqQ4j4NwZmIUdPF9191e+dj60pFx
	GFtPsc+quEv1GbXeiej4PBljrF0GOsTx+1mP8=
Received: by 10.216.136.152 with SMTP id w24mr5712484wei.43.1324228709473;
	Sun, 18 Dec 2011 09:18:29 -0800 (PST)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id ff10sm1867604wbb.6.2011.12.18.09.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 09:18:28 -0800 (PST)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sun, 18 Dec 2011 18:08:44 +0000
Message-Id: <f6c6b01e6bb9a48a80db3eabc38df974bba2d132.1324231597.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: aliguori@us.ibm.com, Julian Pidancet <julian.pidancet@gmail.com>
Subject: [Qemu-trivial] [PATCH] Also create piix3 property when Xen is
	enabled
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
X-List-Received-Date: Sun, 18 Dec 2011 17:18:33 -0000

This recently added line in hw/pc_piix.c is causing a SEGV on a Xen
setup because the piix3 property is never created:

qdev_property_add_child(qdev_resolve_path("/i440fx/piix3", NULL),
                            "rtc", (DeviceState *)rtc_state, NULL);

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 hw/piix_pci.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/hw/piix_pci.c b/hw/piix_pci.c
index d785d4b..ea156a9 100644
--- a/hw/piix_pci.c
+++ b/hw/piix_pci.c
@@ -324,9 +324,8 @@ static PCIBus *i440fx_common_init(const char *device_name,
                 pci_create_simple_multifunction(b, -1, true, "PIIX3"));
         pci_bus_irqs(b, piix3_set_irq, pci_slot_get_pirq, piix3,
                 PIIX_NUM_PIRQS);
-
-        qdev_property_add_child(dev, "piix3", &piix3->dev.qdev, NULL);
     }
+    qdev_property_add_child(dev, "piix3", &piix3->dev.qdev, NULL);
     piix3->pic = pic;
 
     (*pi440fx_state)->piix3 = piix3;
-- 
Julian Pidancet



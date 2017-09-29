Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxvva-0003g7-PC
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 10:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dxvvW-0003dA-KN
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 10:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dxvvQ-0001Bx-Km
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 10:06:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dxvvJ-00010r-OT; Fri, 29 Sep 2017 10:05:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC4D281DF7;
	Fri, 29 Sep 2017 14:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BC4D281DF7
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-152.ams2.redhat.com [10.36.117.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0FF60600;
	Fri, 29 Sep 2017 14:05:44 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	ehabkost@redhat.com, Alexander Graf <agraf@suse.de>,
	Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com
Date: Fri, 29 Sep 2017 16:05:40 +0200
Message-Id: <20170929140540.13766-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 29 Sep 2017 14:05:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCHv2] dma/i82374: avoid double creation of
 i82374 device
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 14:06:05 -0000

v2:
    Removed user_creatable=false and replaced by error handling using
    Error **errp and error_propagate();

QEMU fails when used with the following command line:

    ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
    qemu-system-ppc64: hw/isa/isa-bus.c:110: isa_bus_dma: Assertion `!bus->dma[0] && !bus->dma[1]' failed.
    Aborted (core dumped)

The 40p machine type already creates the device i82374. If specified in the
command line, it will try to create it again, hence generating the error. The
function isa_bus_dma() isn't supposed to be called twice for the same bus. One
way to avoid this problem is to set user_creatable=false.

A possible fix in a near future would be making
isa_bus_dma()/DMA_init()/i82374_realize() return an error instead of asserting
as well.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 hw/dma/i82374.c      | 7 +++++--
 hw/dma/i8257.c       | 7 +++++--
 hw/isa/isa-bus.c     | 9 +++++++--
 include/hw/isa/isa.h | 4 ++--
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6c0f975df0..385a42cb57 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
+#include "qapi/error.h"
 
 #define TYPE_I82374 "i82374"
 #define I82374(obj) OBJECT_CHECK(I82374State, (obj), TYPE_I82374)
@@ -117,14 +118,16 @@ static const MemoryRegionPortio i82374_portio_list[] = {
 static void i82374_realize(DeviceState *dev, Error **errp)
 {
     I82374State *s = I82374(dev);
+    Error *local_err = NULL;
 
     portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
                      "i82374");
     portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
                     s->iobase);
 
-    DMA_init(isa_bus_from_device(ISA_DEVICE(dev)), 1);
+    DMA_init(isa_bus_from_device(ISA_DEVICE(dev)), 1, &local_err);
     memset(s->commands, 0, sizeof(s->commands));
+    error_propagate(errp, local_err);
 }
 
 static Property i82374_properties[] = {
@@ -135,7 +138,7 @@ static Property i82374_properties[] = {
 static void i82374_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    
+
     dc->realize = i82374_realize;
     dc->vmsd = &vmstate_i82374;
     dc->props = i82374_properties;
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index bd23e893bf..94b1ae7533 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -27,6 +27,7 @@
 #include "hw/isa/i8257.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
+#include "qapi/error.h"
 
 #define I8257(obj) \
     OBJECT_CHECK(I8257State, (obj), TYPE_I8257)
@@ -622,10 +623,11 @@ static void i8257_register_types(void)
 
 type_init(i8257_register_types)
 
-void DMA_init(ISABus *bus, int high_page_enable)
+void DMA_init(ISABus *bus, int high_page_enable, Error **errp)
 {
     ISADevice *isa1, *isa2;
     DeviceState *d;
+    Error *local_err = NULL;
 
     isa1 = isa_create(bus, TYPE_I8257);
     d = DEVICE(isa1);
@@ -643,5 +645,6 @@ void DMA_init(ISABus *bus, int high_page_enable)
     qdev_prop_set_int32(d, "dshift", 1);
     qdev_init_nofail(d);
 
-    isa_bus_dma(bus, ISADMA(isa1), ISADMA(isa2));
+    isa_bus_dma(bus, ISADMA(isa1), ISADMA(isa2), &local_err);
+    error_propagate(errp, local_err);
 }
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 348e0eab9d..aa7d8de856 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -104,12 +104,17 @@ void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, int isairq)
     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
 }
 
-void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
+void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16, Error **errp)
 {
+    Error *local_err = NULL;
     assert(bus && dma8 && dma16);
-    assert(!bus->dma[0] && !bus->dma[1]);
+    if (bus->dma[0] && bus->dma[1]) {
+        error_setg(errp, "isa dma device i82374 already created");
+        return;
+    }
     bus->dma[0] = dma8;
     bus->dma[1] = dma16;
+    error_propagate(errp, local_err);
 }
 
 IsaDma *isa_get_dma(ISABus *bus, int nchan)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 95593408ef..5cf4ceaf39 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -103,7 +103,7 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, int isairq);
 void isa_init_irq(ISADevice *dev, qemu_irq *p, int isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, int isairq);
-void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
+void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16, Error **errp);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
@@ -152,5 +152,5 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
 }
 
 /* i8257.c */
-void DMA_init(ISABus *bus, int high_page_enable);
+void DMA_init(ISABus *bus, int high_page_enable, Error **errp);
 #endif
-- 
2.13.5



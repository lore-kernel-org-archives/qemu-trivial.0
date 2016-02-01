Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQLPw-0006aa-Jk
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 15:49:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQLPt-0006Vp-U8
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 15:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQLPs-00068t-VZ
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 15:49:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQLPm-00064s-RF; Mon, 01 Feb 2016 15:49:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id AAC2BC0B0228;
	Mon,  1 Feb 2016 20:49:37 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11KnaVB007606; Mon, 1 Feb 2016 15:49:36 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Feb 2016 15:49:34 -0500
Message-Id: <1454359775-25959-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH V2 1/2] ARM: PL061: Clear PL061 device state
	after reset
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
X-List-Received-Date: Mon, 01 Feb 2016 20:49:47 -0000

Current QEMU doesn't clear PL061 state after reset. This causes a
weird issue with guest reboot via GPIO. Here is the device state
description with two reboot requests:

  (PL061State fields)           data   old_in_data   istate
VM boot                         0      0             0
After 1st ACPI reboot request   8      8             8
After VM PL061 driver ACK       8      8             0
After VM reboot                 8      8             0
------------------------------------------------------------
2nd ACPI reboot request         8

In the second reboot request above, because old_in_data field is 8,
QEMU decides that there is a pending edge IRQ already (see
pl061_update()) in input; so it doesn't raise up IRQ again. As a result
the second reboot request is lost. The correct way is to clear PL061
device state after reset.

NOTE: The reset state is found from the following documentation:
 - PL061 Technical Reference Manual
 - Stellaris LM3S8962 Microcontroller Data Sheet
 - Stellaris LM3S5P31 Microcontroller Data Sheet

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/gpio/pl061.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index e5a696e..342a70d 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -284,8 +284,35 @@ static void pl061_write(void *opaque, hwaddr offset,
 
 static void pl061_reset(PL061State *s)
 {
-  s->locked = 1;
-  s->cr = 0xff;
+    /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
+    s->data = 0;
+    s->old_out_data = 0;
+    s->old_in_data = 0;
+    s->dir = 0;
+    s->isense = 0;
+    s->ibe = 0;
+    s->iev = 0;
+    s->im = 0;
+    s->istate = 0;
+    s->afsel = 0;
+    s->dr2r = 0xff;
+    s->dr4r = 0;
+    s->dr8r = 0;
+    s->odr = 0;
+    s->pur = 0;
+    s->pdr = 0;
+    s->slr = 0;
+    s->den = 0;
+    s->locked = 1;
+    s->cr = 0xff;
+    s->amsel = 0;
+}
+
+static void pl061_state_reset(DeviceState *dev)
+{
+    PL061State *s = PL061(dev);
+
+    pl061_reset(s);
 }
 
 static void pl061_set_irq(void * opaque, int irq, int level)
@@ -343,6 +370,7 @@ static void pl061_class_init(ObjectClass *klass, void *data)
 
     k->init = pl061_initfn;
     dc->vmsd = &vmstate_pl061;
+    dc->reset = &pl061_state_reset;
 }
 
 static const TypeInfo pl061_info = {
-- 
1.8.3.1



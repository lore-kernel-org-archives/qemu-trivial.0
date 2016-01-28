Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aOrDG-0003yU-Mf
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2016 13:22:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aOrDA-0003q6-Uq
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 13:22:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aOrDA-00065A-2j
	for qemu-trivial@nongnu.org; Thu, 28 Jan 2016 13:22:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39631)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aOrD4-00061f-RH; Thu, 28 Jan 2016 13:22:22 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id CF1877AEBB;
	Thu, 28 Jan 2016 18:22:21 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0SIMK0H021690; Thu, 28 Jan 2016 13:22:21 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 28 Jan 2016 13:22:20 -0500
Message-Id: <1454005340-15682-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, shannon.zhao@linaro.org,
	zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger interrupt
	to pulse
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
X-List-Received-Date: Thu, 28 Jan 2016 18:22:33 -0000

When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
request will succeed; but the following shutdown/reboot requests
fail to trigger VMs to react. Notice that in mach-virt machine
model GPIO is defined as edge-triggered and active-high in ACPI.
This patch changes the behavior of powerdown notifier from PULLUP
to PULSE. It solves the problem described above (i.e. reboot
continues to work).

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 05f9087..b5468a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -546,7 +546,7 @@ static DeviceState *pl061_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
     /* use gpio Pin 3 for power button event */
-    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
+    qemu_irq_pulse(qdev_get_gpio_in(pl061_dev, 3));
 }
 
 static Notifier virt_system_powerdown_notifier = {
-- 
1.8.3.1



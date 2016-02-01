Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQI9B-0004nf-5x
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 12:20:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQI97-0004hY-PH
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 12:20:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQI96-0002oc-Ke
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 12:20:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQI92-0002no-Li; Mon, 01 Feb 2016 12:20:08 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5809E8EA41;
	Mon,  1 Feb 2016 17:20:08 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11HK6Q5013069; Mon, 1 Feb 2016 12:20:07 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Feb 2016 12:20:06 -0500
Message-Id: <1454347206-23717-2-git-send-email-wei@redhat.com>
In-Reply-To: <1454347206-23717-1-git-send-email-wei@redhat.com>
References: <1454347206-23717-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH 2/2] ARM: PL061: Misc cleaning fields for
	PL061 device state
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
X-List-Received-Date: Mon, 01 Feb 2016 17:20:14 -0000

This patch removes float_high field of PL061State, which doesn't seem
to be used anywhere.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/gpio/pl061.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 342a70d..2c08e88 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -56,7 +56,6 @@ typedef struct PL061State {
     uint32_t slr;
     uint32_t den;
     uint32_t cr;
-    uint32_t float_high;
     uint32_t amsel;
     qemu_irq irq;
     qemu_irq out[8];
@@ -88,7 +87,6 @@ static const VMStateDescription vmstate_pl061 = {
         VMSTATE_UINT32(slr, PL061State),
         VMSTATE_UINT32(den, PL061State),
         VMSTATE_UINT32(cr, PL061State),
-        VMSTATE_UINT32(float_high, PL061State),
         VMSTATE_UINT32_V(amsel, PL061State, 2),
         VMSTATE_END_OF_LIST()
     }
-- 
1.8.3.1



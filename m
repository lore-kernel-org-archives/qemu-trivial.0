Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQLPw-0006bQ-WF
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 15:49:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQLPt-0006Vo-Ms
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 15:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQLPs-00068n-St
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 15:49:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQLPn-00065A-0O; Mon, 01 Feb 2016 15:49:39 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7C05EC0C2371;
	Mon,  1 Feb 2016 20:49:38 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11KnaVC007606; Mon, 1 Feb 2016 15:49:37 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Feb 2016 15:49:35 -0500
Message-Id: <1454359775-25959-2-git-send-email-wei@redhat.com>
In-Reply-To: <1454359775-25959-1-git-send-email-wei@redhat.com>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com
Subject: [Qemu-trivial] [PATCH V2 2/2] ARM: PL061: Cleaning field of PL061
	device state
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
X-List-Received-Date: Mon, 01 Feb 2016 20:49:46 -0000

This patch removes the float_high field of PL061State, which doesn't
seem to be used anywhere. Because this changes the device state, the
version ID is also bumped up for the reason of compatiblity.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/gpio/pl061.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 342a70d..5e2abe6 100644
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
@@ -65,8 +64,8 @@ typedef struct PL061State {
 
 static const VMStateDescription vmstate_pl061 = {
     .name = "pl061",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(locked, PL061State),
         VMSTATE_UINT32(data, PL061State),
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



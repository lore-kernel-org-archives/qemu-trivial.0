Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuOHc-00012d-NK
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 12:25:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOHX-0000rM-23
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:25:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOHW-0006v9-74
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:25:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1ZuOHP-0006oL-Gh; Thu, 05 Nov 2015 12:24:55 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 2BA2219F25A;
	Thu,  5 Nov 2015 17:24:55 +0000 (UTC)
Received: from rhlaptop.redhat.com (vpn-57-107.rdu2.redhat.com [10.10.57.107])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id tA5HOriV018632; Thu, 5 Nov 2015 12:24:54 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu,  5 Nov 2015 11:24:53 -0600
Message-Id: <1446744293-32365-1-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, afaerber@suse.de,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH Trivial V2] hw/intc/arm_gic: Remove the
	definition of NUM_CPU
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
X-List-Received-Date: Thu, 05 Nov 2015 17:25:07 -0000

arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
Such mixed-uses make source code inconsistent. This patch removes
NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
favors s->num_cpu. The source is more consistent after this small tweak.

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/intc/arm_gic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 8bad132..d71aeb8 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -35,8 +35,6 @@ static const uint8_t gic_id[] =3D {
     0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
=20
-#define NUM_CPU(s) ((s)->num_cpu)
-
 static inline int gic_get_current_cpu(GICState *s)
 {
     if (s->num_cpu > 1) {
@@ -64,7 +62,7 @@ void gic_update(GICState *s)
     int cpu;
     int cm;
=20
-    for (cpu =3D 0; cpu < NUM_CPU(s); cpu++) {
+    for (cpu =3D 0; cpu < s->num_cpu; cpu++) {
         cm =3D 1 << cpu;
         s->current_pending[cpu] =3D 1023;
         if (!(s->ctlr & (GICD_CTLR_EN_GRP0 | GICD_CTLR_EN_GRP1))
@@ -567,7 +565,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)
         if (offset =3D=3D 4)
             /* Interrupt Controller Type Register */
             return ((s->num_irq / 32) - 1)
-                    | ((NUM_CPU(s) - 1) << 5)
+                    | ((s->num_cpu - 1) << 5)
                     | (s->security_extn << 10);
         if (offset < 0x08)
             return 0;
@@ -1284,7 +1282,7 @@ static void arm_gic_realize(DeviceState *dev, Error=
 **errp)
      * GIC v2 defines a larger memory region (0x1000) so this will need
      * to be extended when we implement A15.
      */
-    for (i =3D 0; i < NUM_CPU(s); i++) {
+    for (i =3D 0; i < s->num_cpu; i++) {
         s->backref[i] =3D s;
         memory_region_init_io(&s->cpuiomem[i+1], OBJECT(s), &gic_cpu_ops=
,
                               &s->backref[i], "gic_cpu", 0x100);
--=20
2.4.3



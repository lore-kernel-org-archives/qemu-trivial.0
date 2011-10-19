Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGWrf-0007Qy-LR
	for mharc-qemu-trivial@gnu.org; Wed, 19 Oct 2011 10:11:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RGWrY-0007C4-Ks
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 10:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RGWrU-0002Wl-0V
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 10:11:20 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:35294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>)
	id 1RGWrC-0002TE-75; Wed, 19 Oct 2011 10:10:58 -0400
Received: by qyk10 with SMTP id 10so4130862qyk.4
	for <multiple recipients>; Wed, 19 Oct 2011 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=zJI6UFG/xiPvnhi2Ky1FnjANkx9KHP2OYTDpT62e+D0=;
	b=KgokR2hiHs9v/wNMkTjVY5svut4jkTBPvYAtcHXquyxWNwPndXi83olLKbF5EoEf9t
	aZLlX8ermgtYi6LOL5taNA2OD2lPf055+LcJJUKg2fzICUo/KEJF17Bax/twTyYyLRyg
	u0utUEZ4XwaHWHMVQKF9DP7Cxh1EEgSUvXbgg=
MIME-Version: 1.0
Received: by 10.229.10.228 with SMTP id q36mr1472574qcq.130.1319033456981;
	Wed, 19 Oct 2011 07:10:56 -0700 (PDT)
Received: by 10.229.42.213 with HTTP; Wed, 19 Oct 2011 07:10:56 -0700 (PDT)
Date: Wed, 19 Oct 2011 18:10:56 +0400
Message-ID: <CAKUHwZqVz1egRsgTtf_=Voe66EkL8n0kETW5zEFK5f=JHq_K6w@mail.gmail.com>
From: Dmitry Koshelev <karaghiozis@gmail.com>
To: qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] [v2] arm gic saving/loading fix
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
X-List-Received-Date: Wed, 19 Oct 2011 14:11:25 -0000

irq_target field saving/loading is in the wrong loop
version bump

Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>
---
 hw/arm_gic.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index 8286a28..d0747cf 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -662,9 +662,6 @@ static void gic_save(QEMUFile *f, void *opaque)
     qemu_put_be32(f, s->enabled);
     for (i = 0; i < NUM_CPU(s); i++) {
         qemu_put_be32(f, s->cpu_enabled[i]);
-#ifndef NVIC
-        qemu_put_be32(f, s->irq_target[i]);
-#endif
         for (j = 0; j < 32; j++)
             qemu_put_be32(f, s->priority1[j][i]);
         for (j = 0; j < GIC_NIRQ; j++)
@@ -678,6 +675,9 @@ static void gic_save(QEMUFile *f, void *opaque)
         qemu_put_be32(f, s->priority2[i]);
     }
     for (i = 0; i < GIC_NIRQ; i++) {
+#ifndef NVIC
+        qemu_put_be32(f, s->irq_target[i]);
+#endif
         qemu_put_byte(f, s->irq_state[i].enabled);
         qemu_put_byte(f, s->irq_state[i].pending);
         qemu_put_byte(f, s->irq_state[i].active);
@@ -693,15 +693,12 @@ static int gic_load(QEMUFile *f, void *opaque,
int version_id)
     int i;
     int j;

-    if (version_id != 1)
+    if (version_id != 2)
         return -EINVAL;

     s->enabled = qemu_get_be32(f);
     for (i = 0; i < NUM_CPU(s); i++) {
         s->cpu_enabled[i] = qemu_get_be32(f);
-#ifndef NVIC
-        s->irq_target[i] = qemu_get_be32(f);
-#endif
         for (j = 0; j < 32; j++)
             s->priority1[j][i] = qemu_get_be32(f);
         for (j = 0; j < GIC_NIRQ; j++)
@@ -715,6 +712,9 @@ static int gic_load(QEMUFile *f, void *opaque, int
version_id)
         s->priority2[i] = qemu_get_be32(f);
     }
     for (i = 0; i < GIC_NIRQ; i++) {
+#ifndef NVIC
+        s->irq_target[i] = qemu_get_be32(f);
+#endif
         s->irq_state[i].enabled = qemu_get_byte(f);
         s->irq_state[i].pending = qemu_get_byte(f);
         s->irq_state[i].active = qemu_get_byte(f);
@@ -744,5 +744,5 @@ static void gic_init(gic_state *s)
     s->iomemtype = cpu_register_io_memory(gic_dist_readfn,
                                           gic_dist_writefn, s);
     gic_reset(s);
-    register_savevm(NULL, "arm_gic", -1, 1, gic_save, gic_load, s);
+    register_savevm(NULL, "arm_gic", -1, 2, gic_save, gic_load, s);
 }


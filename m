Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REhlg-0003If-Uj
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 09:25:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1REhld-00038M-K6
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 09:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1REhlc-0005Is-33
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 09:25:41 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:39773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>)
	id 1REhlT-0005Hr-9Z; Fri, 14 Oct 2011 09:25:31 -0400
Received: by qadb10 with SMTP id b10so1056530qad.4
	for <multiple recipients>; Fri, 14 Oct 2011 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=aAifw6U8CGJCGBUnU3PBMdok1nkNDD1zzZs2EplFHJQ=;
	b=REUSZmfoQAb1TQZFfRgUNqe7t/8p5TCGMs6pXlAJDU1atwRDeRJbdZknZ9lis5vUqS
	JwULXQ8vlNGOCoSYxV0vgZ9szQxO4P+kb21SHzLKdnmgTl7/rLqV5AY+gi6XQQ4qsvTM
	zStgLsgH3VFG+2UZhnDLqndgVOeqYn1l3AJ0E=
MIME-Version: 1.0
Received: by 10.229.69.130 with SMTP id z2mr1850142qci.16.1318598729928; Fri,
	14 Oct 2011 06:25:29 -0700 (PDT)
Received: by 10.229.89.145 with HTTP; Fri, 14 Oct 2011 06:25:29 -0700 (PDT)
Date: Fri, 14 Oct 2011 17:25:29 +0400
Message-ID: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
From: Dmitry Koshelev <karaghiozis@gmail.com>
To: qemu-devel@nongnu.org, paul@codesourcery.com
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] ARM GIC and CPU state
	saving/loading fix
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
X-List-Received-Date: Fri, 14 Oct 2011 13:25:42 -0000

Fixes two trivial indices errors.

Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
---
 hw/arm_gic.c         |   12 ++++++------
 target-arm/machine.c |    4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index 8286a28..ba05131 100644
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
@@ -699,9 +699,6 @@ static int gic_load(QEMUFile *f, void *opaque, int
version_id)
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
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 3925d3a..1b1b3ec 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -53,7 +53,7 @@ void cpu_save(QEMUFile *f, void *opaque)
     qemu_put_be32(f, env->features);

     if (arm_feature(env, ARM_FEATURE_VFP)) {
-        for (i = 0;  i < 16; i++) {
+        for (i = 16;  i < 32; i++) {
             CPU_DoubleU u;
             u.d = env->vfp.regs[i];
             qemu_put_be32(f, u.l.upper);
@@ -175,7 +175,7 @@ int cpu_load(QEMUFile *f, void *opaque, int version_id)
         env->vfp.vec_stride = qemu_get_be32(f);

         if (arm_feature(env, ARM_FEATURE_VFP3)) {
-            for (i = 0;  i < 16; i++) {
+            for (i = 16;  i < 32; i++) {
                 CPU_DoubleU u;
                 u.l.upper = qemu_get_be32(f);
                 u.l.lower = qemu_get_be32(f);


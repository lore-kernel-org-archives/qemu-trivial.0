Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFkk2-0006x6-N8
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 06:48:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RFkjz-0006lD-G2
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RFkjy-00048Z-Dd
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:48:19 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:44911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>)
	id 1RFkjs-00046Q-2D; Mon, 17 Oct 2011 06:48:12 -0400
Received: by qyk10 with SMTP id 10so983481qyk.4
	for <multiple recipients>; Mon, 17 Oct 2011 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=rXZO0THXDF1bnmIvOKkjUHnIuOP3TC1q3warq8JUrJ8=;
	b=u4rnpl/sL/K5XiX1OFcChM3pP1BtZYclJm2NEz6Vc/T4bUTLG9f5PcayJdB/mfRaz2
	Q7qsrdPb88EEeifCEPv6BpKRteMSsIn+m8cy+2lgc5PFnsENhY/+NcAVsZI2jdkDvdx4
	+qzezxvBQ3yDoG4FJQ4f8RIMMl0bT2JIikm6g=
MIME-Version: 1.0
Received: by 10.229.66.8 with SMTP id l8mr3890679qci.168.1318848490801; Mon,
	17 Oct 2011 03:48:10 -0700 (PDT)
Received: by 10.229.42.213 with HTTP; Mon, 17 Oct 2011 03:48:10 -0700 (PDT)
Date: Mon, 17 Oct 2011 14:48:10 +0400
Message-ID: <CAKUHwZqQa8BQGWEKgysuJmP2mHv-nS6k9+gNb6w3TsSNWSc_GQ@mail.gmail.com>
From: Dmitry Koshelev <karaghiozis@gmail.com>
To: qemu-devel@nongnu.org, paul@codesourcery.com
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] arm gic saving/loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 10:48:21 -0000

irq_target field saving/loading is in the wrong loop

Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>
---
 hw/arm_gic.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

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


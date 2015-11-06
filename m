Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugcT-0007bh-7c
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:59:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcM-0007M2-Io
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcL-0004qF-AD
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugcF-0004hI-QI; Fri, 06 Nov 2015 07:59:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 25E6840DD6;
	Fri,  6 Nov 2015 15:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7AD68ABB;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31678 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:40 +0300
Message-Id: <b21de19992cefdfef68217e50a8365ee5e535e10.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/24] hw/display/tcx: Remove superfluous
	OBJECT() typecasts
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
X-List-Received-Date: Fri, 06 Nov 2015 12:59:48 -0000

From: Thomas Huth <thuth@redhat.com>

The tcx_initfn() function is already supplied with an
Object *obj pointer, so there is no need to cast the
state pointer back to an Object pointer all over the
place. And while we're at it, also remove the superfluous
"return;" statement in this function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/tcx.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index bf119bc..d720ea6 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -944,57 +944,55 @@ static void tcx_initfn(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     TCXState *s = TCX(obj);
 
-    memory_region_init_ram(&s->rom, OBJECT(s), "tcx.prom", FCODE_MAX_ROM_SIZE,
+    memory_region_init_ram(&s->rom, obj, "tcx.prom", FCODE_MAX_ROM_SIZE,
                            &error_fatal);
     memory_region_set_readonly(&s->rom, true);
     sysbus_init_mmio(sbd, &s->rom);
 
     /* 2/STIP : Stippler */
-    memory_region_init_io(&s->stip, OBJECT(s), &tcx_stip_ops, s, "tcx.stip",
+    memory_region_init_io(&s->stip, obj, &tcx_stip_ops, s, "tcx.stip",
                           TCX_STIP_NREGS);
     sysbus_init_mmio(sbd, &s->stip);
 
     /* 3/BLIT : Blitter */
-    memory_region_init_io(&s->blit, OBJECT(s), &tcx_blit_ops, s, "tcx.blit",
+    memory_region_init_io(&s->blit, obj, &tcx_blit_ops, s, "tcx.blit",
                           TCX_BLIT_NREGS);
     sysbus_init_mmio(sbd, &s->blit);
 
     /* 5/RSTIP : Raw Stippler */
-    memory_region_init_io(&s->rstip, OBJECT(s), &tcx_rstip_ops, s, "tcx.rstip",
+    memory_region_init_io(&s->rstip, obj, &tcx_rstip_ops, s, "tcx.rstip",
                           TCX_RSTIP_NREGS);
     sysbus_init_mmio(sbd, &s->rstip);
 
     /* 6/RBLIT : Raw Blitter */
-    memory_region_init_io(&s->rblit, OBJECT(s), &tcx_rblit_ops, s, "tcx.rblit",
+    memory_region_init_io(&s->rblit, obj, &tcx_rblit_ops, s, "tcx.rblit",
                           TCX_RBLIT_NREGS);
     sysbus_init_mmio(sbd, &s->rblit);
 
     /* 7/TEC : ??? */
-    memory_region_init_io(&s->tec, OBJECT(s), &tcx_dummy_ops, s,
-                          "tcx.tec", TCX_TEC_NREGS);
+    memory_region_init_io(&s->tec, obj, &tcx_dummy_ops, s, "tcx.tec",
+                          TCX_TEC_NREGS);
     sysbus_init_mmio(sbd, &s->tec);
 
     /* 8/CMAP : DAC */
-    memory_region_init_io(&s->dac, OBJECT(s), &tcx_dac_ops, s,
-                          "tcx.dac", TCX_DAC_NREGS);
+    memory_region_init_io(&s->dac, obj, &tcx_dac_ops, s, "tcx.dac",
+                          TCX_DAC_NREGS);
     sysbus_init_mmio(sbd, &s->dac);
 
     /* 9/THC : Cursor */
-    memory_region_init_io(&s->thc, OBJECT(s), &tcx_thc_ops, s, "tcx.thc",
+    memory_region_init_io(&s->thc, obj, &tcx_thc_ops, s, "tcx.thc",
                           TCX_THC_NREGS);
     sysbus_init_mmio(sbd, &s->thc);
 
     /* 11/DHC : ??? */
-    memory_region_init_io(&s->dhc, OBJECT(s), &tcx_dummy_ops, s, "tcx.dhc",
+    memory_region_init_io(&s->dhc, obj, &tcx_dummy_ops, s, "tcx.dhc",
                           TCX_DHC_NREGS);
     sysbus_init_mmio(sbd, &s->dhc);
 
     /* 12/ALT : ??? */
-    memory_region_init_io(&s->alt, OBJECT(s), &tcx_dummy_ops, s, "tcx.alt",
+    memory_region_init_io(&s->alt, obj, &tcx_dummy_ops, s, "tcx.alt",
                           TCX_ALT_NREGS);
     sysbus_init_mmio(sbd, &s->alt);
-
-    return;
 }
 
 static void tcx_realizefn(DeviceState *dev, Error **errp)
-- 
2.1.4



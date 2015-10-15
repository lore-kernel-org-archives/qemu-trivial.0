Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmeJh-0002x8-DT
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 04:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZmeIs-0002o7-CH
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 04:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZmeIr-0001OW-BY
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 04:54:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZmeIl-0001O3-Pi; Thu, 15 Oct 2015 04:54:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C9A6841;
	Thu, 15 Oct 2015 08:54:18 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-90.ams2.redhat.com [10.36.4.90])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9F8sFmc031901; Thu, 15 Oct 2015 04:54:16 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 15 Oct 2015 10:54:15 +0200
Message-Id: <1444899255-16300-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: blauwirbel@gmail.com, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] hw/display/tcx: Remove superfluous OBJECT()
	typecasts
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
X-List-Received-Date: Thu, 15 Oct 2015 08:54:27 -0000

The tcx_initfn() function is already supplied with an
Object *obj pointer, so there is no need to cast the
state pointer back to an Object pointer all over the
place. And while we're at it, also remove the superfluous
"return;" statement in this function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
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
1.8.3.1



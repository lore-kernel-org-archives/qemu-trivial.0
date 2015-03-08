Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfxx-0000I7-JH
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfxu-0000Ep-LL
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfxt-0001L1-4K
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:30:14 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:46134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfxj-00018u-Sa; Sun, 08 Mar 2015 14:30:04 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 4417B17F9E9; Sun,  8 Mar 2015 19:30:01 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:30:01 +0100
Message-Id: <1425839401-28971-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_7/7=5D_Fix_remaining_warnings_f?=
	=?utf-8?q?rom_Sparse_=28void_return=29?=
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
X-List-Received-Date: Sun, 08 Mar 2015 18:30:16 -0000

Sparse report:

hw/display/vga.c:2000:5: warning: returning void-valued expression
hw/intc/arm_gic.c:707:9: warning: returning void-valued expression
hw/intc/etraxfs_pic.c:138:9: warning: returning void-valued expression
hw/nvram/fw_cfg.c:475:5: warning: returning void-valued expression
hw/timer/a9gtimer.c:124:5: warning: returning void-valued expression
hw/tpm/tpm_tis.c:794:5: warning: returning void-valued expression
hw/usb/hcd-musb.c:558:9: warning: returning void-valued expression
hw/usb/hcd-musb.c:776:13: warning: returning void-valued expression
hw/usb/hcd-musb.c:867:5: warning: returning void-valued expression
hw/usb/hcd-musb.c:932:5: warning: returning void-valued expression
include/qom/cpu.h:584:5: warning: returning void-valued expression
monitor.c:4686:13: warning: returning void-valued expression
monitor.c:4690:13: warning: returning void-valued expression

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Andreas F=C3=A4rber <afaerber@suse.de>
Cc: Luiz Capitulino <lcapitulino@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I hope that it is fine to include quite different files in one patch -
I just did not want to send too many trivial patches with only a few line=
s.

Stefan

 hw/display/vga.c      |  2 +-
 hw/intc/arm_gic.c     |  3 ++-
 hw/intc/etraxfs_pic.c | 16 +++++++++-------
 hw/nvram/fw_cfg.c     |  2 +-
 hw/timer/a9gtimer.c   |  2 +-
 hw/tpm/tpm_tis.c      |  2 +-
 hw/usb/hcd-musb.c     | 30 ++++++++++++++++--------------
 include/qom/cpu.h     |  2 +-
 monitor.c             | 22 ++++++++++++----------
 9 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index c0f7b34..d1d296c 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1997,7 +1997,7 @@ static void vga_mem_write(void *opaque, hwaddr addr=
,
 {
     VGACommonState *s =3D opaque;
=20
-    return vga_mem_writeb(s, addr, data);
+    vga_mem_writeb(s, addr, data);
 }
=20
 const MemoryRegionOps vga_mem_ops =3D {
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 270ce05..a04c822 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -704,7 +704,8 @@ static void gic_cpu_write(GICState *s, int cpu, int o=
ffset, uint32_t value)
         s->bpr[cpu] =3D (value & 0x7);
         break;
     case 0x10: /* End Of Interrupt */
-        return gic_complete_irq(s, cpu, value & 0x3ff);
+        gic_complete_irq(s, cpu, value & 0x3ff);
+        return;
     case 0x1c: /* Aliased Binary Point */
         if (s->revision >=3D 2) {
             s->abpr[cpu] =3D (value & 0x7);
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index 636262b..896b54b 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -131,11 +131,13 @@ static void nmi_handler(void *opaque, int irq, int =
level)
 }
=20
 static void irq_handler(void *opaque, int irq, int level)
-{  =20
+{
     struct etrax_pic *fs =3D (void *)opaque;
=20
-    if (irq >=3D 30)
-        return nmi_handler(opaque, irq, level);
+    if (irq >=3D 30) {
+        nmi_handler(opaque, irq, level);
+        return;
+    }
=20
     irq -=3D 1;
     fs->regs[R_R_VECT] &=3D ~(1 << irq);
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 78a37be..4caf536 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -472,7 +472,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, c=
onst char *value)
 {
     size_t sz =3D strlen(value) + 1;
=20
-    return fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
+    fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
 }
=20
 void fw_cfg_add_i16(FWCfgState *s, uint16_t key, uint16_t value)
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 435142a..63654e7 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -121,7 +121,7 @@ static void a9_gtimer_update_no_sync(void *opaque)
 {
     A9GTimerState *s =3D A9_GTIMER(opaque);
=20
-    return a9_gtimer_update(s, false);
+    a9_gtimer_update(s, false);
 }
=20
 static uint64_t a9_gtimer_read(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index c0e7cd7..b7fede1 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -791,7 +791,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, h=
waddr addr,
 static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
                                uint64_t val, unsigned size)
 {
-    return tpm_tis_mmio_write_intern(opaque, addr, val, size, false);
+    tpm_tis_mmio_write_intern(opaque, addr, val, size, false);
 }
=20
 static const MemoryRegionOps tpm_tis_memory_ops =3D {
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 40809f6..5042114 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -554,8 +554,10 @@ static void musb_schedule_cb(USBPort *port, USBPacke=
t *packey)
         timeout =3D ep->timeout[dir];
     else if (ep->interrupt[dir])
         timeout =3D 8;
-    else
-        return musb_cb_tick(ep);
+    else {
+        musb_cb_tick(ep);
+        return;
+    }
=20
     if (!ep->intv_timer[dir])
         ep->intv_timer[dir] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, musb_cb=
_tick, ep);
@@ -772,9 +774,11 @@ static void musb_rx_packet_complete(USBPacket *packe=
y, void *opaque)
=20
         /* NAK timeouts are only generated in Bulk transfers and
          * Data-errors in Isochronous.  */
-        if (ep->interrupt[1])
-            return musb_packet(s, ep, epnum, USB_TOKEN_IN,
-                            packey->iov.size, musb_rx_packet_complete, 1=
);
+        if (ep->interrupt[1]) {
+            musb_packet(s, ep, epnum, USB_TOKEN_IN,
+                        packey->iov.size, musb_rx_packet_complete, 1);
+            return;
+        }
=20
         ep->csr[1] |=3D MGC_M_RXCSR_DATAERROR;
         if (!epnum)
@@ -864,8 +868,7 @@ static void musb_tx_rdy(MUSBState *s, int epnum)
          * but it doesn't make sense for us to do that.  */
     }
=20
-    return musb_packet(s, ep, epnum, pid,
-                    total, musb_tx_packet_complete, 0);
+    musb_packet(s, ep, epnum, pid, total, musb_tx_packet_complete, 0);
 }
=20
 static void musb_rx_req(MUSBState *s, int epnum)
@@ -929,8 +932,7 @@ static void musb_rx_req(MUSBState *s, int epnum)
     }
 #endif
=20
-    return musb_packet(s, ep, epnum, USB_TOKEN_IN,
-                    total, musb_rx_packet_complete, 1);
+    musb_packet(s, ep, epnum, USB_TOKEN_IN, total, musb_rx_packet_comple=
te, 1);
 }
=20
 static uint8_t musb_read_fifo(MUSBEndPoint *ep)
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 48fd6fb..03a803e 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -581,7 +581,7 @@ static inline void cpu_unaligned_access(CPUState *cpu=
, vaddr addr,
 {
     CPUClass *cc =3D CPU_GET_CLASS(cpu);
=20
-    return cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr=
);
+    cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr);
 }
 #endif
=20
diff --git a/monitor.c b/monitor.c
index c86a89e..175ad99 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4683,11 +4683,13 @@ static void monitor_find_completion_by_table(Moni=
tor *mon,
=20
         if (cmd->sub_table) {
             /* do the job again */
-            return monitor_find_completion_by_table(mon, cmd->sub_table,
-                                                    &args[1], nb_args - =
1);
+            monitor_find_completion_by_table(mon, cmd->sub_table,
+                                             &args[1], nb_args - 1);
+            return;
         }
         if (cmd->command_completion) {
-            return cmd->command_completion(mon->rs, nb_args, args[nb_arg=
s - 1]);
+            cmd->command_completion(mon->rs, nb_args, args[nb_args - 1])=
;
+            return;
         }
=20
         ptype =3D next_arg_type(cmd->args_type);
--=20
2.1.4



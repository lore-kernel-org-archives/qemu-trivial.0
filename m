Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWmDU-0004rZ-Mo
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 11:11:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bWmDO-0004mn-9L
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 11:11:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bWmDM-0006m1-0q
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 11:11:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bWmDG-0006l8-4a; Mon, 08 Aug 2016 11:11:34 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3D5661E53;
	Mon,  8 Aug 2016 15:11:33 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u78FBSTL029471; Mon, 8 Aug 2016 11:11:30 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, stefanha@gmail.com, berrange@redhat.com,
	Laurent Vivier <lvivier@redhat.com>
Date: Mon,  8 Aug 2016 17:11:21 +0200
Message-Id: <1470669081-17860-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 08 Aug 2016 15:11:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] trace-events: fix first line comment in
 trace-events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 15:11:45 -0000

Documentation is docs/tracing.txt instead of docs/trace-events.txt.

find . -name trace-events -exec \
     sed -i "s?See docs/trace-events.txt for syntax documentation.?See docs/tracing.txt for syntax documentation.?" \
     {} \;

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 audio/trace-events        | 2 +-
 block/trace-events        | 2 +-
 crypto/trace-events       | 2 +-
 hw/9pfs/trace-events      | 2 +-
 hw/acpi/trace-events      | 2 +-
 hw/alpha/trace-events     | 2 +-
 hw/arm/trace-events       | 2 +-
 hw/audio/trace-events     | 2 +-
 hw/block/trace-events     | 2 +-
 hw/char/trace-events      | 2 +-
 hw/display/trace-events   | 2 +-
 hw/dma/trace-events       | 2 +-
 hw/i386/trace-events      | 2 +-
 hw/input/trace-events     | 2 +-
 hw/intc/trace-events      | 2 +-
 hw/isa/trace-events       | 2 +-
 hw/misc/trace-events      | 2 +-
 hw/net/trace-events       | 2 +-
 hw/nvram/trace-events     | 2 +-
 hw/pci/trace-events       | 2 +-
 hw/ppc/trace-events       | 2 +-
 hw/s390x/trace-events     | 2 +-
 hw/scsi/trace-events      | 2 +-
 hw/sd/trace-events        | 2 +-
 hw/sparc/trace-events     | 2 +-
 hw/timer/trace-events     | 2 +-
 hw/usb/trace-events       | 2 +-
 hw/vfio/trace-events      | 2 +-
 hw/virtio/trace-events    | 2 +-
 io/trace-events           | 2 +-
 linux-user/trace-events   | 2 +-
 migration/trace-events    | 2 +-
 net/trace-events          | 2 +-
 qom/trace-events          | 2 +-
 target-i386/trace-events  | 2 +-
 target-ppc/trace-events   | 2 +-
 target-s390x/trace-events | 2 +-
 target-sparc/trace-events | 2 +-
 ui/trace-events           | 2 +-
 util/trace-events         | 2 +-
 40 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/audio/trace-events b/audio/trace-events
index 5638ea1..5173590 100644
--- a/audio/trace-events
+++ b/audio/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # audio/alsaaudio.c
 alsa_revents(int revents) "revents = %d"
diff --git a/block/trace-events b/block/trace-events
index 978ef4f..05fa13c 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # block.c
 bdrv_open_common(void *bs, const char *filename, int flags, const char *format_name) "bs %p filename \"%s\" flags %#x format_name \"%s\""
diff --git a/crypto/trace-events b/crypto/trace-events
index 71f1d99..8181843 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # crypto/tlscreds.c
 qcrypto_tls_creds_load_dh(void *creds, const char *filename) "TLS creds load DH creds=%p filename=%s"
diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 63efa27..48d3d8a 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/9pfs/virtio-9p.c
 v9fs_rerror(uint16_t tag, uint8_t id, int err) "tag %d id %d err %d"
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 5aa3ba6..c379607 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/acpi/memory_hotplug.c
 mhp_acpi_invalid_slot_selected(uint32_t slot) "0x%"PRIx32
diff --git a/hw/alpha/trace-events b/hw/alpha/trace-events
index 7d52b5d..e44ff01 100644
--- a/hw/alpha/trace-events
+++ b/hw/alpha/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/alpha/pci.c
 alpha_pci_iack_write(void) ""
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index d0dad16..d5f33a2 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/arm/virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index 796f4a1..3210386 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/audio/cs4231.c
 cs4231_mem_readl_dreg(uint32_t reg, uint32_t ret) "read dreg %d: 0x%02x"
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 31df44b..d0dd94f 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/block/virtio-blk.c
 virtio_blk_req_complete(void *req, int status) "req %p status %d"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 005fcd8..d53577c 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/char/virtio-serial-bus.c
 virtio_serial_send_control_event(unsigned int port, uint16_t event, uint16_t value) "port %u, event %u, value %u"
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 78f0465..332abab 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/display/jazz_led.c
 jazz_led_read(uint64_t addr, uint8_t val) "read addr=0x%"PRIx64": 0x%x"
diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index d8a5674..22878df 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/dma/rc4030.c
 jazzio_read(uint64_t addr, uint32_t ret) "read reg[0x%"PRIx64"] = 0x%x"
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index b4882c1..7735e46 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/i386/xen/xen_platform.c
 xen_platform_log(char *s) "xen platform: %s"
diff --git a/hw/input/trace-events b/hw/input/trace-events
index f24dff2..8c4003f 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/input/ps2.c
 ps2_put_keycode(void *opaque, int keycode) "%p keycode %d"
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 376dd18..f12192c 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/intc/apic_common.c
 cpu_set_apic_base(uint64_t val) "%016"PRIx64
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 686282f..9faca41 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/isa/pc87312.c
 pc87312_io_read(uint32_t addr, uint32_t val) "read addr=%x val=%x"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index ea52a14..0cc556c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/misc/eccmemctl.c
 ecc_mem_writel_mer(uint32_t val) "Write memory enable %08x"
diff --git a/hw/net/trace-events b/hw/net/trace-events
index aaa905f..8d38d77 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/net/lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=%"PRIx64"val=0x%04x"
diff --git a/hw/nvram/trace-events b/hw/nvram/trace-events
index 325447d..1f1e05a 100644
--- a/hw/nvram/trace-events
+++ b/hw/nvram/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/nvram/ds1225y.c
 nvram_read(uint32_t addr, uint32_t ret) "read addr %d: 0x%02x"
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index 285338a..2b9cf24 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/pci/pci.c
 pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,%#"PRIx64"+%#"PRIx64
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 900679b..dfeab93 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/ppc/spapr_pci.c
 spapr_pci_msi(const char *msg, uint32_t ca) "%s (cfg=%x)"
diff --git a/hw/s390x/trace-events b/hw/s390x/trace-events
index 72c4549..84ea964 100644
--- a/hw/s390x/trace-events
+++ b/hw/s390x/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/s390x/css.c
 css_enable_facility(const char *facility) "CSS: enable %s"
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 5f19e32..ed64858 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/scsi/scsi-bus.c
 scsi_req_alloc(int target, int lun, int tag) "target %d lun %d tag %d"
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index b580a0f..b17e7ba 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/sd/milkymist-memcard.c
 milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr %08x value %08x"
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index ab677a3..30fb037 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/sparc/sun4m.c
 sun4m_cpu_interrupt(unsigned int level) "Set CPU IRQ %d"
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 19db4bf..3495c41 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/timer/slavio_timer.c
 slavio_timer_get_out(uint64_t limit, uint32_t counthigh, uint32_t count) "limit %"PRIx64" count %x%08x"
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index ac2d951..2d42fd4 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/usb/core.c
 usb_packet_state_change(int bus, const char *port, int ep, void *p, const char *o, const char *n) "bus %d, port %s, ep %d, packet %p, state %s -> %s"
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 4bb7690..da13322 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/vfio/pci.c
 vfio_intx_interrupt(const char *name, char line) " (%s) Pin %c"
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2853053..55184d3 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # hw/virtio/virtio.c
 virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned int idx) "vq %p elem %p len %u idx %u"
diff --git a/io/trace-events b/io/trace-events
index 1108c16..d064665 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # io/buffer.c
 buffer_resize(const char *buf, size_t olen, size_t len) "%s: old %zd, new %zd"
diff --git a/linux-user/trace-events b/linux-user/trace-events
index 80a2e07..fc71f91 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # linux-user/signal.c
 user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64
diff --git a/migration/trace-events b/migration/trace-events
index 8568dab..dfee75a 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # migration/savevm.c
 qemu_loadvm_state_section(unsigned int section_type) "%d"
diff --git a/net/trace-events b/net/trace-events
index 32a0a8a..65c46a4 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # net/vhost-user.c
 vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
diff --git a/qom/trace-events b/qom/trace-events
index 350fc1f..97db357 100644
--- a/qom/trace-events
+++ b/qom/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # qom/object.c
 object_dynamic_cast_assert(const char *type, const char *target, const char *file, int line, const char *func) "%s->%s (%s:%d:%s)"
diff --git a/target-i386/trace-events b/target-i386/trace-events
index ccc49e3..05c5453 100644
--- a/target-i386/trace-events
+++ b/target-i386/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # target-i386/kvm.c
 kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %" PRIu32
diff --git a/target-ppc/trace-events b/target-ppc/trace-events
index d37da2b..8fcc3ce 100644
--- a/target-ppc/trace-events
+++ b/target-ppc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # target-ppc/kvm.c
 kvm_failed_spr_set(int str, const char *msg) "Warning: Unable to set SPR %d to KVM: %s"
diff --git a/target-s390x/trace-events b/target-s390x/trace-events
index 9589b16..df59f5f 100644
--- a/target-s390x/trace-events
+++ b/target-s390x/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # target-s390x/mmu_helper.c
 get_skeys_nonzero(int rc) "SKEY: Call to get_skeys unexpectedly returned %d"
diff --git a/target-sparc/trace-events b/target-sparc/trace-events
index c75faf9..bf52d97 100644
--- a/target-sparc/trace-events
+++ b/target-sparc/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # target-sparc/mmu_helper.c
 mmu_helper_dfault(uint64_t address, uint64_t context, int mmu_idx, uint32_t tl) "DFAULT at %"PRIx64" context %"PRIx64" mmu_idx=%d tl=%d"
diff --git a/ui/trace-events b/ui/trace-events
index d36dbbb..93fe548 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # ui/console.c
 console_gfx_new(void) ""
diff --git a/util/trace-events b/util/trace-events
index 3ce5f1e..747e6ba 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -1,4 +1,4 @@
-# See docs/trace-events.txt for syntax documentation.
+# See docs/tracing.txt for syntax documentation.
 
 # util/oslib-win32.c
 # util/oslib-posix.c
-- 
2.5.5



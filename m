Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLrNw-0002NF-Ch
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 05:52:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNr-0002Ec-Dp
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNp-0006XI-22
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLrNa-0006Tj-FK; Thu, 12 Feb 2015 05:52:18 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CAqHIF005984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Feb 2015 05:52:17 -0500
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1CAqEmD031921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Feb 2015 05:52:16 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5173B3008AD6; Thu, 12 Feb 2015 11:52:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Feb 2015 11:52:14 +0100
Message-Id: <1423738334-13545-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1423738334-13545-1-git-send-email-armbru@redhat.com>
References: <1423738334-13545-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/3] hmp: Name HMP info handler functions
	hmp_info_SUBCOMMAND()
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
X-List-Received-Date: Thu, 12 Feb 2015 10:52:39 -0000

Some are called do_info_SUBCOMMAND() (old ones, usually), some
hmp_info_SUBCOMMAND(), some SUBCOMMAND_info(), sometimes SUBCOMMAND
pointlessly differs in spelling.

Normalize to hmp_info_SUBCOMMAND(), where SUBCOMMAND is exactly the
subcommand name with '-' replaced by '_'.

Exceptions:

* sun4m_irq_info(), sun4m_pic_info() renamed to sun4m_hmp_info_irq(),
  sun4m_hmp_info_pic().

* lm32_irq_info(), lm32_pic_info() renamed to lm32_hmp_info_irq(),
  lm32_hmp_info_pic().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/loader.c           |  2 +-
 hw/intc/i8259.c            |  4 +--
 hw/intc/lm32_pic.c         |  4 +--
 hw/sparc/sun4m.c           |  4 +--
 hw/usb/bus.c               |  2 +-
 hw/usb/host-libusb.c       |  2 +-
 hw/usb/host-stub.c         |  2 +-
 include/hw/i386/pc.h       |  4 +--
 include/hw/lm32/lm32_pic.h |  4 +--
 include/hw/loader.h        |  2 +-
 include/hw/sparc/sun4m.h   |  4 +--
 include/hw/usb.h           |  2 +-
 include/monitor/qdev.h     |  4 +--
 include/net/net.h          |  2 +-
 include/net/slirp.h        |  2 +-
 include/sysemu/sysemu.h    |  4 +--
 monitor.c                  | 84 +++++++++++++++++++++++-----------------------
 net/net.c                  |  2 +-
 net/slirp.c                |  2 +-
 qdev-monitor.c             |  4 +--
 savevm.c                   |  2 +-
 21 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index fcd4705..e45dc0b 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1062,7 +1062,7 @@ void *rom_ptr(hwaddr addr)
     return rom->data + (addr - rom->addr);
 }
 
-void do_info_roms(Monitor *mon, const QDict *qdict)
+void hmp_info_roms(Monitor *mon, const QDict *qdict)
 {
     Rom *rom;
 
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index c51901b..0f5c025 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -429,7 +429,7 @@ static void pic_realize(DeviceState *dev, Error **errp)
     pc->parent_realize(dev, errp);
 }
 
-void pic_info(Monitor *mon, const QDict *qdict)
+void hmp_info_pic(Monitor *mon, const QDict *qdict)
 {
     int i;
     PICCommonState *s;
@@ -447,7 +447,7 @@ void pic_info(Monitor *mon, const QDict *qdict)
     }
 }
 
-void irq_info(Monitor *mon, const QDict *qdict)
+void hmp_info_irq(Monitor *mon, const QDict *qdict)
 {
 #ifndef DEBUG_IRQ_COUNT
     monitor_printf(mon, "irq statistic code not compiled.\n");
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 72fc9ef..641ee47 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -43,7 +43,7 @@ struct LM32PicState {
 typedef struct LM32PicState LM32PicState;
 
 static LM32PicState *pic;
-void lm32_do_pic_info(Monitor *mon, const QDict *qdict)
+void lm32_hmp_info_pic(Monitor *mon, const QDict *qdict)
 {
     if (pic == NULL) {
         return;
@@ -53,7 +53,7 @@ void lm32_do_pic_info(Monitor *mon, const QDict *qdict)
             pic->im, pic->ip, pic->irq_state);
 }
 
-void lm32_irq_info(Monitor *mon, const QDict *qdict)
+void lm32_hmp_info_irq(Monitor *mon, const QDict *qdict)
 {
     int i;
     uint32_t count;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index ecd9dc1..09afccf 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -176,13 +176,13 @@ static void nvram_init(M48t59State *nvram, uint8_t *macaddr,
 
 static DeviceState *slavio_intctl;
 
-void sun4m_pic_info(Monitor *mon, const QDict *qdict)
+void sun4m_hmp_info_pic(Monitor *mon, const QDict *qdict)
 {
     if (slavio_intctl)
         slavio_pic_info(mon, slavio_intctl);
 }
 
-void sun4m_irq_info(Monitor *mon, const QDict *qdict)
+void sun4m_hmp_info_irq(Monitor *mon, const QDict *qdict)
 {
     if (slavio_intctl)
         slavio_irq_info(mon, slavio_intctl);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 986b2d8..677122e 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -627,7 +627,7 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
     return fw_path;
 }
 
-void usb_info(Monitor *mon, const QDict *qdict)
+void hmp_info_usb(Monitor *mon, const QDict *qdict)
 {
     USBBus *bus;
     USBDevice *dev;
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index cff4f7c..625aec8 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1637,7 +1637,7 @@ static void usb_host_auto_check(void *unused)
     timer_mod(usb_auto_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 2000);
 }
 
-void usb_host_info(Monitor *mon, const QDict *qdict)
+void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
 {
     libusb_device **devs = NULL;
     struct libusb_device_descriptor ddesc;
diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
index 28d8032..2eaaa83 100644
--- a/hw/usb/host-stub.c
+++ b/hw/usb/host-stub.c
@@ -35,7 +35,7 @@
 #include "hw/usb.h"
 #include "monitor/monitor.h"
 
-void usb_host_info(Monitor *mon, const QDict *qdict)
+void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "USB host devices not supported\n");
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 69d9cf8..dddd255 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -136,8 +136,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
 qemu_irq *kvm_i8259_init(ISABus *bus);
 int pic_read_irq(DeviceState *d);
 int pic_get_output(DeviceState *d);
-void pic_info(Monitor *mon, const QDict *qdict);
-void irq_info(Monitor *mon, const QDict *qdict);
+void hmp_info_pic(Monitor *mon, const QDict *qdict);
+void hmp_info_irq(Monitor *mon, const QDict *qdict);
 
 /* Global System Interrupts */
 
diff --git a/include/hw/lm32/lm32_pic.h b/include/hw/lm32/lm32_pic.h
index 5556803..189fa38 100644
--- a/include/hw/lm32/lm32_pic.h
+++ b/include/hw/lm32/lm32_pic.h
@@ -8,7 +8,7 @@ uint32_t lm32_pic_get_im(DeviceState *d);
 void lm32_pic_set_ip(DeviceState *d, uint32_t ip);
 void lm32_pic_set_im(DeviceState *d, uint32_t im);
 
-void lm32_do_pic_info(Monitor *mon, const QDict *qdict);
-void lm32_irq_info(Monitor *mon, const QDict *qdict);
+void lm32_hmp_info_pic(Monitor *mon, const QDict *qdict);
+void lm32_hmp_info_irq(Monitor *mon, const QDict *qdict);
 
 #endif /* QEMU_HW_LM32_PIC_H */
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8593045..4f0681b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -78,7 +78,7 @@ void rom_load_done(void);
 void rom_set_fw(FWCfgState *f);
 int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
 void *rom_ptr(hwaddr addr);
-void do_info_roms(Monitor *mon, const QDict *qdict);
+void hmp_info_roms(Monitor *mon, const QDict *qdict);
 
 #define rom_add_file_fixed(_f, _a, _i)          \
     rom_add_file(_f, NULL, _a, _i, false)
diff --git a/include/hw/sparc/sun4m.h b/include/hw/sparc/sun4m.h
index a587700..9c17425 100644
--- a/include/hw/sparc/sun4m.h
+++ b/include/hw/sparc/sun4m.h
@@ -29,8 +29,8 @@ void slavio_pic_info(Monitor *mon, DeviceState *dev);
 void slavio_irq_info(Monitor *mon, DeviceState *dev);
 
 /* sun4m.c */
-void sun4m_pic_info(Monitor *mon, const QDict *qdict);
-void sun4m_irq_info(Monitor *mon, const QDict *qdict);
+void sun4m_hmp_info_pic(Monitor *mon, const QDict *qdict);
+void sun4m_hmp_info_irq(Monitor *mon, const QDict *qdict);
 
 /* sparc32_dma.c */
 #include "hw/sparc/sparc32_dma.h"
diff --git a/include/hw/usb.h b/include/hw/usb.h
index b20b959..e6dfb87 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -473,7 +473,7 @@ int set_usb_string(uint8_t *buf, const char *str);
 
 /* usb-linux.c */
 USBDevice *usb_host_device_open(USBBus *bus, const char *devname);
-void usb_host_info(Monitor *mon, const QDict *qdict);
+void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
 
 /* usb ports of the VM */
 
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 8d16e11..5eb4a11 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -6,8 +6,8 @@
 
 /*** monitor commands ***/
 
-void do_info_qtree(Monitor *mon, const QDict *qdict);
-void do_info_qdm(Monitor *mon, const QDict *qdict);
+void hmp_info_qtree(Monitor *mon, const QDict *qdict);
+void hmp_info_qdm(Monitor *mon, const QDict *qdict);
 int do_device_add(Monitor *mon, const QDict *qdict, QObject **ret_data);
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts);
diff --git a/include/net/net.h b/include/net/net.h
index ac43a8e..50ffcb9 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -156,7 +156,7 @@ ssize_t qemu_deliver_packet_iov(NetClientState *sender,
                             void *opaque);
 
 void print_net_client(Monitor *mon, NetClientState *nc);
-void do_info_network(Monitor *mon, const QDict *qdict);
+void hmp_info_network(Monitor *mon, const QDict *qdict);
 
 /* NIC info */
 
diff --git a/include/net/slirp.h b/include/net/slirp.h
index d3b64f6..64b795c 100644
--- a/include/net/slirp.h
+++ b/include/net/slirp.h
@@ -40,7 +40,7 @@ int net_slirp_parse_legacy(QemuOptsList *opts_list, const char *optarg, int *ret
 
 int net_slirp_smb(const char *exported_dir);
 
-void do_info_usernet(Monitor *mon, const QDict *qdict);
+void hmp_info_usernet(Monitor *mon, const QDict *qdict);
 
 #endif
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index d132430..1ab7063 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -77,7 +77,7 @@ void qemu_add_machine_init_done_notifier(Notifier *notify);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 int load_vmstate(const char *name);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
-void do_info_snapshots(Monitor *mon, const QDict *qdict);
+void hmp_info_snapshots(Monitor *mon, const QDict *qdict);
 
 void qemu_announce_self(void);
 
@@ -201,7 +201,7 @@ extern CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
 
 void hmp_usb_add(Monitor *mon, const QDict *qdict);
 void hmp_usb_del(Monitor *mon, const QDict *qdict);
-void usb_info(Monitor *mon, const QDict *qdict);
+void hmp_info_usb(Monitor *mon, const QDict *qdict);
 
 void add_boot_device_path(int32_t bootindex, DeviceState *dev,
                           const char *suffix);
diff --git a/monitor.c b/monitor.c
index 75dbc53..24a9af4 100644
--- a/monitor.c
+++ b/monitor.c
@@ -73,7 +73,7 @@
 #include "qapi/qmp-event.h"
 #include "qapi-event.h"
 
-/* for pic/irq_info */
+/* for hmp_info_irq/pic */
 #if defined(TARGET_SPARC)
 #include "hw/sparc/sun4m.h"
 #endif
@@ -1027,7 +1027,7 @@ int monitor_get_cpu_index(void)
     return cpu->cpu_index;
 }
 
-static void do_info_registers(Monitor *mon, const QDict *qdict)
+static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     CPUState *cpu;
     CPUArchState *env;
@@ -1036,18 +1036,18 @@ static void do_info_registers(Monitor *mon, const QDict *qdict)
     cpu_dump_state(cpu, (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
 }
 
-static void do_info_jit(Monitor *mon, const QDict *qdict)
+static void hmp_info_jit(Monitor *mon, const QDict *qdict)
 {
     dump_exec_info((FILE *)mon, monitor_fprintf);
     dump_drift_info((FILE *)mon, monitor_fprintf);
 }
 
-static void do_info_opcount(Monitor *mon, const QDict *qdict)
+static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
 {
     dump_opcount_info((FILE *)mon, monitor_fprintf);
 }
 
-static void do_info_history(Monitor *mon, const QDict *qdict)
+static void hmp_info_history(Monitor *mon, const QDict *qdict)
 {
     int i;
     const char *str;
@@ -1064,7 +1064,7 @@ static void do_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_info_cpu_stats(Monitor *mon, const QDict *qdict)
+static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
 {
     CPUState *cpu;
     CPUArchState *env;
@@ -1074,7 +1074,7 @@ static void do_info_cpu_stats(Monitor *mon, const QDict *qdict)
     cpu_dump_statistics(cpu, (FILE *)mon, &monitor_fprintf, 0);
 }
 
-static void do_trace_print_events(Monitor *mon, const QDict *qdict)
+static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     TraceEventInfoList *events = qmp_trace_event_get_state("*", NULL);
     TraceEventInfoList *elem;
@@ -1657,7 +1657,7 @@ static void tlb_info_64(Monitor *mon, CPUArchState *env)
 }
 #endif
 
-static void tlb_info(Monitor *mon, const QDict *qdict)
+static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
 
@@ -1880,7 +1880,7 @@ static void mem_info_64(Monitor *mon, CPUArchState *env)
 }
 #endif
 
-static void mem_info(Monitor *mon, const QDict *qdict)
+static void hmp_info_mem(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
 
@@ -1919,7 +1919,7 @@ static void print_tlb(Monitor *mon, int idx, tlb_t *tlb)
                    tlb->d, tlb->wt);
 }
 
-static void tlb_info(Monitor *mon, const QDict *qdict)
+static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env = mon_get_cpu();
     int i;
@@ -1935,7 +1935,7 @@ static void tlb_info(Monitor *mon, const QDict *qdict)
 #endif
 
 #if defined(TARGET_SPARC) || defined(TARGET_PPC) || defined(TARGET_XTENSA)
-static void tlb_info(Monitor *mon, const QDict *qdict)
+static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env1 = mon_get_cpu();
 
@@ -1943,12 +1943,12 @@ static void tlb_info(Monitor *mon, const QDict *qdict)
 }
 #endif
 
-static void do_info_mtree(Monitor *mon, const QDict *qdict)
+static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
 {
     mtree_info((fprintf_function)monitor_printf, mon);
 }
 
-static void do_info_numa(Monitor *mon, const QDict *qdict)
+static void hmp_info_numa(Monitor *mon, const QDict *qdict)
 {
     int i;
     CPUState *cpu;
@@ -1976,7 +1976,7 @@ static void do_info_numa(Monitor *mon, const QDict *qdict)
 int64_t qemu_time;
 int64_t dev_time;
 
-static void do_info_profile(Monitor *mon, const QDict *qdict)
+static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
                    dev_time, dev_time / (double)get_ticks_per_sec());
@@ -1986,7 +1986,7 @@ static void do_info_profile(Monitor *mon, const QDict *qdict)
     dev_time = 0;
 }
 #else
-static void do_info_profile(Monitor *mon, const QDict *qdict)
+static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "Internal profiler not compiled\n");
 }
@@ -1995,7 +1995,7 @@ static void do_info_profile(Monitor *mon, const QDict *qdict)
 /* Capture support */
 static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
 
-static void do_info_capture(Monitor *mon, const QDict *qdict)
+static void hmp_info_capture(Monitor *mon, const QDict *qdict)
 {
     int i;
     CaptureState *s;
@@ -2621,7 +2621,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show the network state",
-        .mhandler.cmd = do_info_network,
+        .mhandler.cmd = hmp_info_network,
     },
     {
         .name       = "chardev",
@@ -2657,7 +2657,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show the cpu registers",
-        .mhandler.cmd = do_info_registers,
+        .mhandler.cmd = hmp_info_registers,
     },
     {
         .name       = "cpus",
@@ -2671,7 +2671,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show the command line history",
-        .mhandler.cmd = do_info_history,
+        .mhandler.cmd = hmp_info_history,
     },
 #if defined(TARGET_I386) || defined(TARGET_PPC) || defined(TARGET_MIPS) || \
     defined(TARGET_LM32) || (defined(TARGET_SPARC) && !defined(TARGET_SPARC64))
@@ -2681,11 +2681,11 @@ static mon_cmd_t info_cmds[] = {
         .params     = "",
         .help       = "show the interrupts statistics (if available)",
 #ifdef TARGET_SPARC
-        .mhandler.cmd = sun4m_irq_info,
+        .mhandler.cmd = sun4m_hmp_info_irq,
 #elif defined(TARGET_LM32)
-        .mhandler.cmd = lm32_irq_info,
+        .mhandler.cmd = lm32_hmp_info_irq,
 #else
-        .mhandler.cmd = irq_info,
+        .mhandler.cmd = hmp_info_irq,
 #endif
     },
     {
@@ -2694,11 +2694,11 @@ static mon_cmd_t info_cmds[] = {
         .params     = "",
         .help       = "show i8259 (PIC) state",
 #ifdef TARGET_SPARC
-        .mhandler.cmd = sun4m_pic_info,
+        .mhandler.cmd = sun4m_hmp_info_pic,
 #elif defined(TARGET_LM32)
-        .mhandler.cmd = lm32_do_pic_info,
+        .mhandler.cmd = lm32_hmp_info_pic,
 #else
-        .mhandler.cmd = pic_info,
+        .mhandler.cmd = hmp_info_pic,
 #endif
     },
 #endif
@@ -2716,7 +2716,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show virtual to physical memory mappings",
-        .mhandler.cmd = tlb_info,
+        .mhandler.cmd = hmp_info_tlb,
     },
 #endif
 #if defined(TARGET_I386)
@@ -2725,7 +2725,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show the active virtual memory mappings",
-        .mhandler.cmd = mem_info,
+        .mhandler.cmd = hmp_info_mem,
     },
 #endif
     {
@@ -2733,21 +2733,21 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show memory tree",
-        .mhandler.cmd = do_info_mtree,
+        .mhandler.cmd = hmp_info_mtree,
     },
     {
         .name       = "jit",
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler info",
-        .mhandler.cmd = do_info_jit,
+        .mhandler.cmd = hmp_info_jit,
     },
     {
         .name       = "opcount",
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler opcode counters",
-        .mhandler.cmd = do_info_opcount,
+        .mhandler.cmd = hmp_info_opcount,
     },
     {
         .name       = "kvm",
@@ -2761,42 +2761,42 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show NUMA information",
-        .mhandler.cmd = do_info_numa,
+        .mhandler.cmd = hmp_info_numa,
     },
     {
         .name       = "usb",
         .args_type  = "",
         .params     = "",
         .help       = "show guest USB devices",
-        .mhandler.cmd = usb_info,
+        .mhandler.cmd = hmp_info_usb,
     },
     {
         .name       = "usbhost",
         .args_type  = "",
         .params     = "",
         .help       = "show host USB devices",
-        .mhandler.cmd = usb_host_info,
+        .mhandler.cmd = hmp_info_usbhost,
     },
     {
         .name       = "profile",
         .args_type  = "",
         .params     = "",
         .help       = "show profiling information",
-        .mhandler.cmd = do_info_profile,
+        .mhandler.cmd = hmp_info_profile,
     },
     {
         .name       = "capture",
         .args_type  = "",
         .params     = "",
         .help       = "show capture information",
-        .mhandler.cmd = do_info_capture,
+        .mhandler.cmd = hmp_info_capture,
     },
     {
         .name       = "snapshots",
         .args_type  = "",
         .params     = "",
         .help       = "show the currently saved VM snapshots",
-        .mhandler.cmd = do_info_snapshots,
+        .mhandler.cmd = hmp_info_snapshots,
     },
     {
         .name       = "status",
@@ -2847,7 +2847,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show CPU statistics",
-        .mhandler.cmd = do_info_cpu_stats,
+        .mhandler.cmd = hmp_info_cpustats,
     },
 #if defined(CONFIG_SLIRP)
     {
@@ -2855,7 +2855,7 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show user network stack connection states",
-        .mhandler.cmd = do_info_usernet,
+        .mhandler.cmd = hmp_info_usernet,
     },
 #endif
     {
@@ -2891,28 +2891,28 @@ static mon_cmd_t info_cmds[] = {
         .args_type  = "",
         .params     = "",
         .help       = "show device tree",
-        .mhandler.cmd = do_info_qtree,
+        .mhandler.cmd = hmp_info_qtree,
     },
     {
         .name       = "qdm",
         .args_type  = "",
         .params     = "",
         .help       = "show qdev device model list",
-        .mhandler.cmd = do_info_qdm,
+        .mhandler.cmd = hmp_info_qdm,
     },
     {
         .name       = "roms",
         .args_type  = "",
         .params     = "",
         .help       = "show roms",
-        .mhandler.cmd = do_info_roms,
+        .mhandler.cmd = hmp_info_roms,
     },
     {
         .name       = "trace-events",
         .args_type  = "",
         .params     = "",
         .help       = "show available trace-events & their state",
-        .mhandler.cmd = do_trace_print_events,
+        .mhandler.cmd = hmp_info_trace_events,
     },
     {
         .name       = "tpm",
diff --git a/net/net.c b/net/net.c
index 506dab9..73d8ee9 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1117,7 +1117,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
     return filter_list;
 }
 
-void do_info_network(Monitor *mon, const QDict *qdict)
+void hmp_info_network(Monitor *mon, const QDict *qdict)
 {
     NetClientState *nc, *peer;
     NetClientOptionsKind type;
diff --git a/net/slirp.c b/net/slirp.c
index 9f1047c..9bbed74 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -681,7 +681,7 @@ static int slirp_guestfwd(SlirpState *s, const char *config_str,
     return -1;
 }
 
-void do_info_usernet(Monitor *mon, const QDict *qdict)
+void hmp_info_usernet(Monitor *mon, const QDict *qdict)
 {
     SlirpState *s;
 
diff --git a/qdev-monitor.c b/qdev-monitor.c
index ebfa701..0c25b82 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -667,13 +667,13 @@ static void qbus_print(Monitor *mon, BusState *bus, int indent)
 }
 #undef qdev_printf
 
-void do_info_qtree(Monitor *mon, const QDict *qdict)
+void hmp_info_qtree(Monitor *mon, const QDict *qdict)
 {
     if (sysbus_get_default())
         qbus_print(mon, sysbus_get_default(), 0);
 }
 
-void do_info_qdm(Monitor *mon, const QDict *qdict)
+void hmp_info_qdm(Monitor *mon, const QDict *qdict)
 {
     qdev_print_devinfos(true);
 }
diff --git a/savevm.c b/savevm.c
index ed9608c..2a5ebfb 100644
--- a/savevm.c
+++ b/savevm.c
@@ -1323,7 +1323,7 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     }
 }
 
-void do_info_snapshots(Monitor *mon, const QDict *qdict)
+void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
 {
     BlockDriverState *bs, *bs1;
     QEMUSnapshotInfo *sn_tab, *sn, s, *sn_info = &s;
-- 
1.9.3



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktl9-0001BJ-F3
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:04:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktl3-000173-BO
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktkx-0006Ea-IB
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:04:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktkm-00062h-G6; Fri, 16 Sep 2016 10:04:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 747C66408F;
	Fri, 16 Sep 2016 13:57:01 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkM024127; Fri, 16 Sep 2016 09:56:59 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 16 Sep 2016 15:56:11 +0200
Message-Id: <1474034177-17663-21-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Sep 2016 13:57:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 20/26] common: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:04:54 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
---
 accel.c                       |   2 +-
 arch_init.c                   |   6 +-
 bootdevice.c                  |   2 +-
 contrib/ivshmem-server/main.c |  12 +-
 gdbstub.c                     |   2 +-
 hw/watchdog/watchdog.c        |   2 +-
 kvm-all.c                     |   8 +-
 qemu-char.c                   |   6 +-
 qemu-nbd.c                    |   6 +-
 util/qemu-timer-common.c      |   2 +-
 vl.c                          | 270 +++++++++++++++++++++---------------------
 11 files changed, 159 insertions(+), 159 deletions(-)

diff --git a/accel.c b/accel.c
index 403eb5e..c1b7fcd 100644
--- a/accel.c
+++ b/accel.c
@@ -122,7 +122,7 @@ void configure_accelerator(MachineState *ms)
         if (!init_failed) {
             fprintf(stderr, "No accelerator found!\n");
         }
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (init_failed) {
diff --git a/arch_init.c b/arch_init.c
index fa05973..c4273fa 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -221,13 +221,13 @@ void audio_init(void)
             if (c->isa) {
                 if (!isa_bus) {
                     error_report("ISA bus not available for %s", c->name);
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 c->init.init_isa(isa_bus);
             } else {
                 if (!pci_bus) {
                     error_report("PCI bus not available for %s", c->name);
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 c->init.init_pci(pci_bus);
             }
@@ -262,7 +262,7 @@ void do_acpitable_option(const QemuOpts *opts)
     acpi_table_add(opts, &err);
     if (err) {
         error_reportf_err(err, "Wrong acpi table provided: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 }
diff --git a/bootdevice.c b/bootdevice.c
index 33e3029..fdd199c 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -173,7 +173,7 @@ void add_boot_device_path(int32_t bootindex, DeviceState *dev,
     QTAILQ_FOREACH(i, &fw_boot_order, link) {
         if (i->bootindex == bootindex) {
             error_report("Two devices with same boot index %d", bootindex);
-            exit(1);
+            exit(EXIT_FAILURE);
         } else if (i->bootindex < bootindex) {
             continue;
         }
diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index 45776d8..63d6d91 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -77,7 +77,7 @@ ivshmem_server_parse_args(IvshmemServerArgs *args, int argc, char *argv[])
         switch (c) {
         case 'h': /* help */
             ivshmem_server_usage(argv[0]);
-            exit(0);
+            exit(EXIT_SUCCESS);
             break;
 
         case 'v': /* verbose */
@@ -107,7 +107,7 @@ ivshmem_server_parse_args(IvshmemServerArgs *args, int argc, char *argv[])
             if (err) {
                 error_report_err(err);
                 ivshmem_server_help(argv[0]);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             break;
 
@@ -115,14 +115,14 @@ ivshmem_server_parse_args(IvshmemServerArgs *args, int argc, char *argv[])
             if (parse_uint_full(optarg, &v, 0) < 0) {
                 fprintf(stderr, "cannot parse n_vectors\n");
                 ivshmem_server_help(argv[0]);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             args->n_vectors = v;
             break;
 
         default:
             ivshmem_server_usage(argv[0]);
-            exit(1);
+            exit(EXIT_FAILURE);
             break;
         }
     }
@@ -131,13 +131,13 @@ ivshmem_server_parse_args(IvshmemServerArgs *args, int argc, char *argv[])
         fprintf(stderr, "too many requested vectors (max is %d)\n",
                 IVSHMEM_SERVER_MAX_VECTORS);
         ivshmem_server_help(argv[0]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (args->verbose == 1 && args->foreground == 0) {
         fprintf(stderr, "cannot use verbose in daemon mode\n");
         ivshmem_server_help(argv[0]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/gdbstub.c b/gdbstub.c
index ecea8c4..fd7405c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -891,7 +891,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     case 'k':
         /* Kill the target */
         fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
-        exit(0);
+        exit(EXIT_SUCCESS);
     case 'D':
         /* Detach packet */
         gdb_breakpoint_remove_all();
diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 2aeaf1f..97e0772 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -120,7 +120,7 @@ void watchdog_perform_action(void)
 
     case WDT_POWEROFF:          /* same as 'quit' command in monitor */
         qapi_event_send_watchdog(WATCHDOG_EXPIRATION_ACTION_POWEROFF, &error_abort);
-        exit(0);
+        exit(EXIT_SUCCESS);
 
     case WDT_PAUSE:             /* same as 'stop' command in monitor */
         /* In a timer callback, when vm_stop calls qemu_clock_enable
diff --git a/kvm-all.c b/kvm-all.c
index 8a4382e..ad9aa8e 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1488,7 +1488,7 @@ static void kvm_irqchip_create(MachineState *machine, KVMState *s)
         ret = kvm_vm_enable_cap(s, KVM_CAP_S390_IRQCHIP, 0);
         if (ret < 0) {
             fprintf(stderr, "Enable kernel irqchip failed: %s\n", strerror(-ret));
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         return;
@@ -1500,14 +1500,14 @@ static void kvm_irqchip_create(MachineState *machine, KVMState *s)
     if (ret == 0) {
         if (machine_kernel_irqchip_split(machine)) {
             perror("Split IRQ chip mode not supported.");
-            exit(1);
+            exit(EXIT_FAILURE);
         } else {
             ret = kvm_vm_ioctl(s, KVM_CREATE_IRQCHIP);
         }
     }
     if (ret < 0) {
         fprintf(stderr, "Create kernel irqchip failed: %s\n", strerror(-ret));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     kvm_kernel_irqchip = true;
@@ -1632,7 +1632,7 @@ static int kvm_init(MachineState *ms)
                 fprintf(stderr, "Number of %s cpus requested (%d) exceeds "
                         "the maximum cpus supported by KVM (%d)\n",
                         nc->name, nc->num, hard_vcpus_limit);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
         nc++;
diff --git a/qemu-char.c b/qemu-char.c
index 8826419..deab972 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -408,7 +408,7 @@ int qemu_chr_fe_get_msgfd(CharDriverState *s)
     if (s->replay) {
         fprintf(stderr,
                 "Replay: get msgfd is not supported for serial devices yet\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return res;
 }
@@ -633,7 +633,7 @@ static int mux_proc_byte(CharDriverState *chr, MuxDriver *d, int ch)
             {
                  const char *term =  "QEMU: Terminated\n\r";
                  qemu_chr_fe_write_all(chr, (uint8_t *)term, strlen(term));
-                 exit(0);
+                 exit(EXIT_SUCCESS);
                  break;
             }
         case 's':
@@ -4083,7 +4083,7 @@ void qemu_chr_fe_claim_no_fail(CharDriverState *s)
     if (qemu_chr_fe_claim(s) != 0) {
         fprintf(stderr, "%s: error chardev \"%s\" already used\n",
                 __func__, s->label);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 99297a5..f30e3d4 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -687,11 +687,11 @@ int main(int argc, char **argv)
             break;
         case 'V':
             version(argv[0]);
-            exit(0);
+            exit(EXIT_SUCCESS);
             break;
         case 'h':
             usage(argv[0]);
-            exit(0);
+            exit(EXIT_SUCCESS);
             break;
         case '?':
             error_report("Try `%s --help' for more information.", argv[0]);
@@ -730,7 +730,7 @@ int main(int argc, char **argv)
     }
 
     if (!trace_init_backends()) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     trace_init_file(trace_file);
     qemu_set_log(LOG_TRACE);
diff --git a/util/qemu-timer-common.c b/util/qemu-timer-common.c
index 06d084d..5d6df5d 100644
--- a/util/qemu-timer-common.c
+++ b/util/qemu-timer-common.c
@@ -38,7 +38,7 @@ static void __attribute__((constructor)) init_get_clock(void)
     ret = QueryPerformanceFrequency(&freq);
     if (ret == 0) {
         fprintf(stderr, "Could not calibrate ticks\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     clock_freq = freq.QuadPart;
 }
diff --git a/vl.c b/vl.c
index ad2664b..7f7c4d8 100644
--- a/vl.c
+++ b/vl.c
@@ -834,7 +834,7 @@ static void configure_rtc_date_offset(const char *startdate, int legacy)
             error_report("invalid date format");
             error_printf("valid formats: "
                          "'2006-06-17T16:01:21' or '2006-06-17'\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         rtc_date_offset = qemu_time() - rtc_start_date;
     }
@@ -868,7 +868,7 @@ static void configure_rtc(QemuOpts *opts)
             rtc_clock = QEMU_CLOCK_VIRTUAL;
         } else {
             error_report("invalid option value '%s'", value);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
     value = qemu_opt_get(opts, "driftfix");
@@ -885,7 +885,7 @@ static void configure_rtc(QemuOpts *opts)
             /* discard is default */
         } else {
             error_report("invalid option value '%s'", value);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -1164,7 +1164,7 @@ static void default_drive(int enable, int snapshot, BlockInterfaceType type,
 
     dinfo = drive_new(opts, type);
     if (!dinfo) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     dinfo->is_default = true;
 
@@ -1224,19 +1224,19 @@ static void smp_parse(QemuOpts *opts)
                          "sockets (%u) * cores (%u) * threads (%u) < "
                          "smp_cpus (%u)",
                          sockets, cores, threads, cpus);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
 
         if (max_cpus > MAX_CPUMASK_BITS) {
             error_report("unsupported number of maxcpus");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (max_cpus < cpus) {
             error_report("maxcpus must be equal to or greater than smp");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (sockets * cores * threads > max_cpus) {
@@ -1244,7 +1244,7 @@ static void smp_parse(QemuOpts *opts)
                          "sockets (%u) * cores (%u) * threads (%u) > "
                          "maxcpus (%u)",
                          sockets, cores, threads, max_cpus);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         smp_cpus = cpus;
@@ -1264,7 +1264,7 @@ static void realtime_init(void)
     if (enable_mlock) {
         if (os_mlock() < 0) {
             error_report("locking memory failed");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -2028,7 +2028,7 @@ static void select_vgahw(const char *p)
         if (ti->opt_name && strstart(p, ti->opt_name, &opts)) {
             if (!vga_interface_available(t)) {
                 error_report("%s not available", ti->name);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             vga_interface_type = t;
             break;
@@ -2037,7 +2037,7 @@ static void select_vgahw(const char *p)
     if (t == VGA_TYPE_MAX) {
     invalid_vga:
         error_report("unknown vga type: %s", p);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     while (*opts) {
         const char *nextopt;
@@ -2122,27 +2122,27 @@ static DisplayType select_display(const char *p)
             } else {
             invalid_sdl_args:
                 error_report("invalid SDL option string");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             opts = nextopt;
         }
 #else
         error_report("SDL support is disabled");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     } else if (strstart(p, "vnc", &opts)) {
         if (*opts == '=') {
             vnc_parse(opts + 1, &error_fatal);
         } else {
             error_report("VNC requires a display argument vnc=<display>");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else if (strstart(p, "curses", &opts)) {
 #ifdef CONFIG_CURSES
         display = DT_CURSES;
 #else
         error_report("curses support is disabled");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     } else if (strstart(p, "gtk", &opts)) {
 #ifdef CONFIG_GTK
@@ -2171,19 +2171,19 @@ static DisplayType select_display(const char *p)
             } else {
             invalid_gtk_args:
                 error_report("invalid GTK option string");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             opts = nextopt;
         }
 #else
         error_report("GTK support is disabled");
-        exit(1);
+        exit(EXIT_FAILURE);
 #endif
     } else if (strstart(p, "none", &opts)) {
         display = DT_NONE;
     } else {
         error_report("unknown display type");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     return display;
@@ -2358,7 +2358,7 @@ static int mon_init_func(void *opaque, QemuOpts *opts, Error **errp)
         flags = MONITOR_USE_CONTROL;
     } else {
         error_report("unknown monitor mode \"%s\"", mode);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opt_get_bool(opts, "pretty", 0))
@@ -2371,7 +2371,7 @@ static int mon_init_func(void *opaque, QemuOpts *opts, Error **errp)
     chr = qemu_chr_find(chardev);
     if (chr == NULL) {
         error_report("chardev \"%s\" not found", chardev);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     qemu_chr_fe_claim_no_fail(chr);
@@ -2398,7 +2398,7 @@ static void monitor_parse(const char *optarg, const char *mode, bool pretty)
         opts = qemu_chr_parse_compat(label, optarg);
         if (!opts) {
             error_report("parse error: %s", optarg);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -2468,7 +2468,7 @@ static int serial_parse(const char *devname)
         return 0;
     if (index == MAX_SERIAL_PORTS) {
         error_report("too many serial ports");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     snprintf(label, sizeof(label), "serial%d", index);
     serial_hds[index] = qemu_chr_new(label, devname, NULL);
@@ -2490,7 +2490,7 @@ static int parallel_parse(const char *devname)
         return 0;
     if (index == MAX_PARALLEL_PORTS) {
         error_report("too many parallel ports");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     snprintf(label, sizeof(label), "parallel%d", index);
     parallel_hds[index] = qemu_chr_new(label, devname, NULL);
@@ -2514,7 +2514,7 @@ static int virtcon_parse(const char *devname)
         return 0;
     if (index == MAX_VIRTIO_CONSOLES) {
         error_report("too many virtio consoles");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     bus_opts = qemu_opts_create(device, NULL, 0, &error_abort);
@@ -2548,7 +2548,7 @@ static int sclp_parse(const char *devname)
     }
     if (index == MAX_SCLP_CONSOLES) {
         error_report("too many sclp consoles");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     assert(arch_type == QEMU_ARCH_S390X);
@@ -2574,12 +2574,12 @@ static int debugcon_parse(const char *devname)
     QemuOpts *opts;
 
     if (!qemu_chr_new("debugcon", devname, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     opts = qemu_opts_create(qemu_find_opts("device"), "debugcon", 1, NULL);
     if (!opts) {
         error_report("already have a debugcon device");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     qemu_opt_set(opts, "driver", "isa-debugcon", &error_abort);
     qemu_opt_set(opts, "chardev", "debugcon", &error_abort);
@@ -2705,7 +2705,7 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
     for(;;) {
         if (!popt->name) {
             error_report("invalid option");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (!strcmp(popt->name, r + 1))
             break;
@@ -2714,7 +2714,7 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
     if (popt->flags & HAS_ARG) {
         if (optind >= argc) {
             error_report("requires an argument");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         optarg = argv[optind++];
         loc_set_cmdline(argv, optind - 2, 2);
@@ -2748,7 +2748,7 @@ static MachineClass *select_machine(void)
     if (!machine_class) {
         error_report("No machine specified, and there is no default");
         error_printf("Use -machine help to list supported machines\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     loc_pop(&loc);
@@ -3022,7 +3022,7 @@ int main(int argc, char **argv, char **envp)
 
     if (qcrypto_init(&err) < 0) {
         error_reportf_err(err, "cannot initialize crypto: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     rtc_clock = QEMU_CLOCK_HOST;
 
@@ -3065,7 +3065,7 @@ int main(int argc, char **argv, char **envp)
         int ret;
         ret = qemu_read_default_config_files(userconfig);
         if (ret < 0) {
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -3082,7 +3082,7 @@ int main(int argc, char **argv, char **envp)
             popt = lookup_opt(argc, argv, &optarg, &optind);
             if (!(popt->arch_mask & arch_type)) {
                 error_report("Option not supported for this target");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             switch(popt->index) {
             case QEMU_OPTION_no_kvm_irqchip: {
@@ -3118,16 +3118,16 @@ int main(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_drive:
                 if (drive_def(optarg) == NULL) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_set:
                 if (qemu_set_option(optarg) != 0)
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 break;
             case QEMU_OPTION_mtdblock:
                 drive_add(IF_MTD, -1, optarg, MTD_OPTS);
@@ -3178,7 +3178,7 @@ int main(int argc, char **argv, char **envp)
                     } else if (*p != '\0') {
                     chs_fail:
                         error_report("invalid physical CHS format");
-                        exit(1);
+                        exit(EXIT_FAILURE);
                     }
                     if (hda_opts != NULL) {
                         qemu_opt_set_number(hda_opts, "cyls", cyls,
@@ -3207,7 +3207,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("numa"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_display:
@@ -3224,7 +3224,7 @@ int main(int argc, char **argv, char **envp)
                 display_type = DT_CURSES;
 #else
                 error_report("curses support is disabled");
-                exit(1);
+                exit(EXIT_FAILURE);
 #endif
                 break;
             case QEMU_OPTION_portrait:
@@ -3235,7 +3235,7 @@ int main(int argc, char **argv, char **envp)
                 if (graphic_rotate != 0 && graphic_rotate != 90 &&
                     graphic_rotate != 180 && graphic_rotate != 270) {
                     error_report("only 90, 180, 270 deg rotation is available");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_kernel:
@@ -3261,7 +3261,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("boot-opts"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_fda:
@@ -3275,13 +3275,13 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_netdev:
                 default_net = 0;
                 if (net_client_parse(qemu_find_opts("netdev"), optarg) == -1) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_net:
                 default_net = 0;
                 if (net_client_parse(qemu_find_opts("net"), optarg) == -1) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
 #ifdef CONFIG_LIBISCSI
@@ -3289,7 +3289,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("iscsi"),
                                                optarg, false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
 #endif
@@ -3308,7 +3308,7 @@ int main(int argc, char **argv, char **envp)
                 error_report("The -redir option is deprecated. "
                              "Please use '-netdev user,hostfwd=...' instead.");
                 if (net_slirp_redir(optarg) < 0)
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 break;
 #endif
             case QEMU_OPTION_bt:
@@ -3316,7 +3316,7 @@ int main(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_audio_help:
                 AUD_help ();
-                exit (0);
+                exit(EXIT_SUCCESS);
                 break;
             case QEMU_OPTION_soundhw:
                 select_soundhw (optarg);
@@ -3326,7 +3326,7 @@ int main(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_version:
                 version();
-                exit(0);
+                exit(EXIT_SUCCESS);
                 break;
             case QEMU_OPTION_m:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("memory"),
@@ -3338,7 +3338,7 @@ int main(int argc, char **argv, char **envp)
 #ifdef CONFIG_TPM
             case QEMU_OPTION_tpmdev:
                 if (tpm_config_parse(qemu_find_opts("tpmdev"), optarg) < 0) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
 #endif
@@ -3399,7 +3399,7 @@ int main(int argc, char **argv, char **envp)
                     if (w <= 0) {
                     graphic_error:
                         error_report("invalid resolution or depth");
-                        exit(1);
+                        exit(EXIT_FAILURE);
                     }
                     if (*p != 'x')
                         goto graphic_error;
@@ -3450,7 +3450,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("mon"), optarg,
                                                true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 default_monitor = 0;
                 break;
@@ -3458,18 +3458,18 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("chardev"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_fsdev:
                 olist = qemu_find_opts("fsdev");
                 if (!olist) {
                     error_report("fsdev support is disabled");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 opts = qemu_opts_parse_noisily(olist, optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_virtfs: {
@@ -3480,17 +3480,17 @@ int main(int argc, char **argv, char **envp)
                 olist = qemu_find_opts("virtfs");
                 if (!olist) {
                     error_report("virtfs support is disabled");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 opts = qemu_opts_parse_noisily(olist, optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
 
                 if (qemu_opt_get(opts, "fsdriver") == NULL ||
                     qemu_opt_get(opts, "mount_tag") == NULL) {
                     error_report("Usage: -virtfs fsdriver,mount_tag=tag");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 fsdev = qemu_opts_create(qemu_find_opts("fsdev"),
                                          qemu_opt_get(opts, "mount_tag"),
@@ -3498,7 +3498,7 @@ int main(int argc, char **argv, char **envp)
                 if (!fsdev) {
                     error_report("duplicate fsdev id: %s",
                                  qemu_opt_get(opts, "mount_tag"));
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
 
                 writeout = qemu_opt_get(opts, "writeout");
@@ -3508,7 +3508,7 @@ int main(int argc, char **argv, char **envp)
 #else
                     error_report("writeout=immediate not supported "
                                  "on this platform");
-                    exit(1);
+                    exit(EXIT_FAILURE);
 #endif
                 }
                 qemu_opt_set(fsdev, "fsdriver",
@@ -3547,7 +3547,7 @@ int main(int argc, char **argv, char **envp)
                                          1, NULL);
                 if (!fsdev) {
                     error_report("duplicate option: %s", "virtfs_synth");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 qemu_opt_set(fsdev, "fsdriver", "synth", &error_abort);
 
@@ -3575,7 +3575,7 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_watchdog_action:
                 if (select_watchdog_action(optarg) == -1) {
                     error_report("unknown -watchdog-action parameter");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_virtiocon:
@@ -3619,7 +3619,7 @@ int main(int argc, char **argv, char **envp)
                 break;
 #else
                 error_report("SDL support is disabled");
-                exit(1);
+                exit(EXIT_FAILURE);
 #endif
             case QEMU_OPTION_pidfile:
                 pid_file = optarg;
@@ -3641,7 +3641,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("acpi"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 do_acpitable_option(opts);
                 break;
@@ -3649,7 +3649,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("smbios"),
                                                optarg, false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 do_smbios_option(opts);
                 break;
@@ -3657,7 +3657,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("fw_cfg"),
                                                optarg, true);
                 if (opts == NULL) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_enable_kvm:
@@ -3669,7 +3669,7 @@ int main(int argc, char **argv, char **envp)
                 olist = qemu_find_opts("machine");
                 opts = qemu_opts_parse_noisily(olist, optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
              case QEMU_OPTION_no_kvm:
@@ -3704,13 +3704,13 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_device:
                 if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
                                              optarg, true)) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_smp:
                 if (!qemu_opts_parse_noisily(qemu_find_opts("smp-opts"),
                                              optarg, true)) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_vnc:
@@ -3725,7 +3725,7 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_balloon:
                 if (balloon_parse(optarg) < 0) {
                     error_report("unknown -balloon argument %s", optarg);
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_no_reboot:
@@ -3740,26 +3740,26 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_uuid:
                 if(qemu_uuid_parse(optarg, qemu_uuid) < 0) {
                     error_report("failed to parse UUID string: wrong format");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 qemu_uuid_set = true;
                 break;
             case QEMU_OPTION_option_rom:
                 if (nb_option_roms >= MAX_OPTION_ROMS) {
                     error_report("too many option ROMs");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 opts = qemu_opts_parse_noisily(qemu_find_opts("option-rom"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 option_rom[nb_option_roms].name = qemu_opt_get(opts, "romfile");
                 option_rom[nb_option_roms].bootindex =
                     qemu_opt_get_number(opts, "bootindex", -1);
                 if (!option_rom[nb_option_roms].name) {
                     error_report("Option ROM file is not specified");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 nb_option_roms++;
                 break;
@@ -3785,7 +3785,7 @@ int main(int argc, char **argv, char **envp)
                         } else {
                             error_report("unsupported semihosting-config %s",
                                          optarg);
-                            exit(1);
+                            exit(EXIT_FAILURE);
                         }
                     } else {
                         semihosting.target = SEMIHOSTING_TARGET_AUTO;
@@ -3795,7 +3795,7 @@ int main(int argc, char **argv, char **envp)
                                      &semihosting, NULL);
                 } else {
                     error_report("unsupported semihosting-config %s", optarg);
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_tdf:
@@ -3805,13 +3805,13 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("name"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_prom_env:
                 if (nb_prom_envs >= MAX_PROM_ENVS) {
                     error_report("too many prom variables");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 prom_envs[nb_prom_envs] = optarg;
                 nb_prom_envs++;
@@ -3831,7 +3831,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("rtc"), optarg,
                                                false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 configure_rtc(opts);
                 break;
@@ -3845,7 +3845,7 @@ int main(int argc, char **argv, char **envp)
                 icount_opts = qemu_opts_parse_noisily(qemu_find_opts("icount"),
                                                       optarg, true);
                 if (!icount_opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_incoming:
@@ -3860,21 +3860,21 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_xen_domid:
                 if (!(xen_available())) {
                     error_report("Option not supported for this target");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 xen_domid = atoi(optarg);
                 break;
             case QEMU_OPTION_xen_create:
                 if (!(xen_available())) {
                     error_report("Option not supported for this target");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 xen_mode = XEN_CREATE;
                 break;
             case QEMU_OPTION_xen_attach:
                 if (!(xen_available())) {
                     error_report("Option not supported for this target");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 xen_mode = XEN_ATTACH;
                 break;
@@ -3888,7 +3888,7 @@ int main(int argc, char **argv, char **envp)
                     if (ret < 0) {
                         error_report("read config %s: %s", optarg,
                                      strerror(-ret));
-                        exit(1);
+                        exit(EXIT_FAILURE);
                     }
                     break;
                 }
@@ -3896,11 +3896,11 @@ int main(int argc, char **argv, char **envp)
                 olist = qemu_find_opts("spice");
                 if (!olist) {
                     error_report("spice support is disabled");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 opts = qemu_opts_parse_noisily(olist, optarg, false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 display_remote++;
                 break;
@@ -3914,7 +3914,7 @@ int main(int argc, char **argv, char **envp)
                         if (fp == NULL) {
                             error_report("open %s: %s", optarg,
                                          strerror(errno));
-                            exit(1);
+                            exit(EXIT_FAILURE);
                         }
                     }
                     qemu_config_write(fp);
@@ -3933,7 +3933,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("sandbox"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_add_fd:
@@ -3941,26 +3941,26 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("add-fd"),
                                                optarg, false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
 #else
                 error_report("File descriptor passing is disabled on this "
                              "platform");
-                exit(1);
+                exit(EXIT_FAILURE);
 #endif
                 break;
             case QEMU_OPTION_object:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
                                                optarg, true);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             case QEMU_OPTION_realtime:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("realtime"),
                                                optarg, false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 enable_mlock = qemu_opt_get_bool(opts, "mlock", true);
                 break;
@@ -3968,7 +3968,7 @@ int main(int argc, char **argv, char **envp)
                 opts = qemu_opts_parse_noisily(qemu_find_opts("msg"), optarg,
                                                false);
                 if (!opts) {
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 configure_msg(opts);
                 break;
@@ -3976,12 +3976,12 @@ int main(int argc, char **argv, char **envp)
                 if (vmstate_dump_file) {
                     error_report("only one '-dump-vmstate' "
                                  "option may be given");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 vmstate_dump_file = fopen(optarg, "w");
                 if (vmstate_dump_file == NULL) {
                     error_report("open %s: %s", optarg, strerror(errno));
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 break;
             default:
@@ -4005,35 +4005,35 @@ int main(int argc, char **argv, char **envp)
 
     if (qemu_init_main_loop(&main_loop_err)) {
         error_report_err(main_loop_err);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("sandbox"),
                           parse_sandbox, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("name"),
                           parse_name, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
 #ifndef _WIN32
     if (qemu_opts_foreach(qemu_find_opts("add-fd"),
                           parse_add_fd, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("add-fd"),
                           cleanup_add_fd, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 
     current_machine = MACHINE(object_new(object_class_get_name(
                           OBJECT_CLASS(machine_class))));
     if (machine_help_func(qemu_get_machine_opts(), current_machine)) {
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine), &error_abort);
@@ -4045,11 +4045,11 @@ int main(int argc, char **argv, char **envp)
 
     if (cpu_model && is_help_option(cpu_model)) {
         list_cpus(stdout, &fprintf, cpu_model);
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
 
     if (!trace_init_backends()) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     trace_init_file(trace_file);
 
@@ -4064,7 +4064,7 @@ int main(int argc, char **argv, char **envp)
         mask = qemu_str_to_log_mask(log_mask);
         if (!mask) {
             qemu_print_log_usage(stdout);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         qemu_set_log(mask);
     } else {
@@ -4089,7 +4089,7 @@ int main(int argc, char **argv, char **envp)
         for (i = 0; i < data_dir_idx; i++) {
             printf("%s\n", data_dir[i]);
         }
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
@@ -4099,7 +4099,7 @@ int main(int argc, char **argv, char **envp)
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine '%s' (%d)", max_cpus,
                      machine_class->name, machine_class->max_cpus);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /*
@@ -4160,12 +4160,12 @@ int main(int argc, char **argv, char **envp)
             && (default_parallel || default_serial
                 || default_monitor || default_virtcon)) {
             error_report("-nographic cannot be used with -daemonize");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 #ifdef CONFIG_CURSES
         if (display_type == DT_CURSES) {
             error_report("curses display cannot be used with -daemonize");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 #endif
     }
@@ -4246,7 +4246,7 @@ int main(int argc, char **argv, char **envp)
 #else
         error_report("OpenGL support is disabled");
 #endif
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     page_size_init();
@@ -4255,36 +4255,36 @@ int main(int argc, char **argv, char **envp)
     if (qemu_opts_foreach(qemu_find_opts("object"),
                           user_creatable_add_opts_foreach,
                           object_create_initial, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("chardev"),
                           chardev_init_func, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
 #ifdef CONFIG_VIRTFS
     if (qemu_opts_foreach(qemu_find_opts("fsdev"),
                           fsdev_init_func, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 
     if (pid_file && qemu_create_pidfile(pid_file) != 0) {
         error_report("could not acquire pid file: %s", strerror(errno));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("device"),
                           device_help_func, NULL, NULL)) {
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
 
     machine_opts = qemu_get_machine_opts();
     if (qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
                          NULL)) {
         object_unref(OBJECT(current_machine));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     configure_accelerator(current_machine);
@@ -4328,17 +4328,17 @@ int main(int argc, char **argv, char **envp)
 
     if (!linux_boot && *kernel_cmdline != '\0') {
         error_report("-append only allowed with -kernel option");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (!linux_boot && initrd_filename != NULL) {
         error_report("-initrd only allowed with -kernel option");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (!linux_boot && qemu_opt_get(machine_opts, "dtb")) {
         error_report("-dtb only allowed with -kernel option");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (semihosting_enabled() && !semihosting_get_argc() && kernel_filename) {
@@ -4355,7 +4355,7 @@ int main(int argc, char **argv, char **envp)
     if (icount_opts) {
         if (kvm_enabled() || xen_enabled()) {
             error_report("-icount is not allowed with kvm or xen");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         configure_icount(icount_opts, &error_abort);
         qemu_opts_del(icount_opts);
@@ -4370,30 +4370,30 @@ int main(int argc, char **argv, char **envp)
     }
 
     if (net_init_clients() < 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(qemu_find_opts("object"),
                           user_creatable_add_opts_foreach,
                           object_create_delayed, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
 #ifdef CONFIG_TPM
     if (tpm_init() < 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 
     /* init the bluetooth world */
     if (foreach_device_config(DEV_BT, bt_parse))
-        exit(1);
+        exit(EXIT_FAILURE);
 
     if (!xen_enabled()) {
         /* On 32-bit hosts, QEMU is limited by virtual address space */
         if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
             error_report("at most 2047 MB RAM can be simulated");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -4414,7 +4414,7 @@ int main(int argc, char **argv, char **envp)
     }
     if (qemu_opts_foreach(qemu_find_opts("drive"), drive_init_func,
                           &machine_class->block_default_type, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     default_drive(default_cdrom, snapshot, machine_class->block_default_type, 2,
@@ -4426,20 +4426,20 @@ int main(int argc, char **argv, char **envp)
 
     if (qemu_opts_foreach(qemu_find_opts("mon"),
                           mon_init_func, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (foreach_device_config(DEV_SERIAL, serial_parse) < 0)
-        exit(1);
+        exit(EXIT_FAILURE);
     if (foreach_device_config(DEV_PARALLEL, parallel_parse) < 0)
-        exit(1);
+        exit(EXIT_FAILURE);
     if (foreach_device_config(DEV_VIRTCON, virtcon_parse) < 0)
-        exit(1);
+        exit(EXIT_FAILURE);
     if (foreach_device_config(DEV_SCLP, sclp_parse) < 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
-        exit(1);
+        exit(EXIT_FAILURE);
 
     /* If no default VGA is requested, the default is "none".  */
     if (default_vga) {
@@ -4490,13 +4490,13 @@ int main(int argc, char **argv, char **envp)
 
     if (qemu_opts_foreach(qemu_find_opts("fw_cfg"),
                           parse_fw_cfg, fw_cfg_find(), NULL) != 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* init USB devices */
     if (machine_usb(current_machine)) {
         if (foreach_device_config(DEV_USB, usb_parse) < 0)
-            exit(1);
+            exit(EXIT_FAILURE);
     }
 
     /* Check if IGD GFX passthrough. */
@@ -4506,7 +4506,7 @@ int main(int argc, char **argv, char **envp)
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     if (qemu_opts_foreach(qemu_find_opts("device"),
                           device_init_func, NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     rom_reset_order_override();
 
@@ -4565,7 +4565,7 @@ int main(int argc, char **argv, char **envp)
     }
 
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     qdev_machine_creation_done();
@@ -4577,7 +4577,7 @@ int main(int argc, char **argv, char **envp)
 
     if (rom_check_and_register_reset() != 0) {
         error_report("rom check and register reset failed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     replay_start();
@@ -4606,7 +4606,7 @@ int main(int argc, char **argv, char **envp)
         qemu_start_incoming_migration(incoming, &local_err);
         if (local_err) {
             error_reportf_err(local_err, "-incoming %s: ", incoming);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else if (autostart) {
         vm_start();
-- 
2.5.5



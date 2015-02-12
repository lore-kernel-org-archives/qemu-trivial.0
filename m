Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLrNu-0002Iv-6C
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 05:52:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNp-0002As-7c
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNl-0006We-Ha
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLrNa-0006Tp-Ou; Thu, 12 Feb 2015 05:52:19 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CAqIQF004988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Feb 2015 05:52:18 -0500
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1CAqEpl031919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Feb 2015 05:52:16 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 37B7B303F16E; Thu, 12 Feb 2015 11:52:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Feb 2015 11:52:13 +0100
Message-Id: <1423738334-13545-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1423738334-13545-1-git-send-email-armbru@redhat.com>
References: <1423738334-13545-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/3] hmp: Name HMP command handler functions
	hmp_COMMAND()
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
X-List-Received-Date: Thu, 12 Feb 2015 10:52:37 -0000

Some are called do_COMMAND() (old ones, usually), some hmp_COMMAND(),
and sometimes COMMAND pointlessly differs in spelling.

Normalize to hmp_COMMAND(), where COMMAND is exactly the command name
with '-' replaced by '_'.

Exceptions:

* do_device_add() and client_migrate_info() *not* renamed to
  hmp_device_add(), hmp_client_migrate_info(), because they're also
  QMP handlers.  They still need to be converted to QAPI.

* do_memory_dump(), do_physical_memory_dump(), do_ioport_read(),
  do_ioport_write() renamed do hmp_* instead of hmp_x(), hmp_xp(),
  hmp_i(), hmp_o(), because those names are too cryptic for my taste.

* do_info_help() renamed to hmp_info_help() instead of hmp_info(),
  because it only covers help.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/block-backend.c          |  6 +--
 blockdev.c                     |  6 +--
 device-hotplug.c               |  2 +-
 hmp-commands.hx                | 86 +++++++++++++++++++++---------------------
 hmp.c                          |  6 +--
 hmp.h                          |  6 +--
 hw/pci/pci-hotplug-old.c       |  4 +-
 hw/pci/pci-stub.c              |  2 +-
 hw/pci/pcie_aer.c              |  2 +-
 include/net/net.h              |  4 +-
 include/net/slirp.h            |  4 +-
 include/sysemu/block-backend.h |  2 +-
 include/sysemu/blockdev.h      |  4 +-
 include/sysemu/sysemu.h        | 16 ++++----
 include/ui/console.h           |  2 +-
 monitor.c                      | 50 ++++++++++++------------
 net/net.c                      |  4 +-
 net/slirp.c                    |  4 +-
 savevm.c                       |  4 +-
 ui/input.c                     |  2 +-
 vl.c                           |  4 +-
 21 files changed, 110 insertions(+), 110 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c28e240..1988515 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -101,7 +101,7 @@ static void blk_delete(BlockBackend *blk)
         bdrv_unref(blk->bs);
         blk->bs = NULL;
     }
-    /* Avoid double-remove after blk_hide_on_behalf_of_do_drive_del() */
+    /* Avoid double-remove after blk_hide_on_behalf_of_hmp_drive_del() */
     if (blk->name[0]) {
         QTAILQ_REMOVE(&blk_backends, blk, link);
     }
@@ -162,7 +162,7 @@ BlockBackend *blk_next(BlockBackend *blk)
 /*
  * Return @blk's name, a non-null string.
  * Wart: the name is empty iff @blk has been hidden with
- * blk_hide_on_behalf_of_do_drive_del().
+ * blk_hide_on_behalf_of_hmp_drive_del().
  */
 const char *blk_name(BlockBackend *blk)
 {
@@ -238,7 +238,7 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
  * Strictly for use by do_drive_del().
  * TODO get rid of it!
  */
-void blk_hide_on_behalf_of_do_drive_del(BlockBackend *blk)
+void blk_hide_on_behalf_of_hmp_drive_del(BlockBackend *blk)
 {
     QTAILQ_REMOVE(&blk_backends, blk, link);
     blk->name[0] = 0;
diff --git a/blockdev.c b/blockdev.c
index 7d34960..0f1a253 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1025,7 +1025,7 @@ fail:
     return dinfo;
 }
 
-void do_commit(Monitor *mon, const QDict *qdict)
+void hmp_commit(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_str(qdict, "device");
     BlockDriverState *bs;
@@ -1953,7 +1953,7 @@ void qmp_block_set_io_throttle(const char *device, int64_t bps, int64_t bps_rd,
     aio_context_release(aio_context);
 }
 
-int do_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data)
+int hmp_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data)
 {
     const char *id = qdict_get_str(qdict, "id");
     BlockBackend *blk;
@@ -1995,7 +1995,7 @@ int do_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data)
      * then we can just get rid of the block driver state right here.
      */
     if (blk_get_attached_dev(blk)) {
-        blk_hide_on_behalf_of_do_drive_del(blk);
+        blk_hide_on_behalf_of_hmp_drive_del(blk);
         /* Further I/O must not pause the guest */
         bdrv_set_on_error(bs, BLOCKDEV_ON_ERROR_REPORT,
                           BLOCKDEV_ON_ERROR_REPORT);
diff --git a/device-hotplug.c b/device-hotplug.c
index 9e38cc4..833d874 100644
--- a/device-hotplug.c
+++ b/device-hotplug.c
@@ -50,7 +50,7 @@ DriveInfo *add_init_drive(const char *optstr)
     return dinfo;
 }
 
-void drive_hot_add(Monitor *mon, const QDict *qdict)
+void hmp_drive_add(Monitor *mon, const QDict *qdict)
 {
     DriveInfo *dinfo = NULL;
     const char *opts = qdict_get_str(qdict, "opts");
diff --git a/hmp-commands.hx b/hmp-commands.hx
index e37bc8b..81f276b 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -28,7 +28,7 @@ ETEXI
         .args_type  = "device:B",
         .params     = "device|all",
         .help       = "commit changes to the disk images (if -snapshot is used) or backing files",
-        .mhandler.cmd = do_commit,
+        .mhandler.cmd = hmp_commit,
     },
 
 STEXI
@@ -180,7 +180,7 @@ ETEXI
         .params     = "device",
         .help       = "remove host block device",
         .user_print = monitor_user_noop,
-        .mhandler.cmd_new = do_drive_del,
+        .mhandler.cmd_new = hmp_drive_del,
     },
 
 STEXI
@@ -245,7 +245,7 @@ ETEXI
         .args_type  = "filename:F",
         .params     = "filename",
         .help       = "save screen into PPM image 'filename'",
-        .mhandler.cmd = hmp_screen_dump,
+        .mhandler.cmd = hmp_screendump,
     },
 
 STEXI
@@ -259,7 +259,7 @@ ETEXI
         .args_type  = "filename:F",
         .params     = "filename",
         .help       = "output logs to 'filename'",
-        .mhandler.cmd = do_logfile,
+        .mhandler.cmd = hmp_logfile,
     },
 
 STEXI
@@ -273,7 +273,7 @@ ETEXI
         .args_type  = "name:s,option:b",
         .params     = "name on|off",
         .help       = "changes status of a specific trace event",
-        .mhandler.cmd = do_trace_event_set_state,
+        .mhandler.cmd = hmp_trace_event,
     },
 
 STEXI
@@ -288,7 +288,7 @@ ETEXI
         .args_type  = "op:s?,arg:F?",
         .params     = "on|off|flush|set [arg]",
         .help       = "open, close, or flush trace file, or set a new file name",
-        .mhandler.cmd = do_trace_file,
+        .mhandler.cmd = hmp_trace_file,
     },
 
 STEXI
@@ -303,7 +303,7 @@ ETEXI
         .args_type  = "items:s",
         .params     = "item1[,...]",
         .help       = "activate logging of the specified items",
-        .mhandler.cmd = do_log,
+        .mhandler.cmd = hmp_log,
     },
 
 STEXI
@@ -317,7 +317,7 @@ ETEXI
         .args_type  = "name:s?",
         .params     = "[tag|id]",
         .help       = "save a VM snapshot. If no tag or id are provided, a new snapshot is created",
-        .mhandler.cmd = do_savevm,
+        .mhandler.cmd = hmp_savevm,
     },
 
 STEXI
@@ -334,7 +334,7 @@ ETEXI
         .args_type  = "name:s",
         .params     = "tag|id",
         .help       = "restore a VM snapshot from its tag or id",
-        .mhandler.cmd = do_loadvm,
+        .mhandler.cmd = hmp_loadvm,
         .command_completion = loadvm_completion,
     },
 
@@ -350,7 +350,7 @@ ETEXI
         .args_type  = "name:s",
         .params     = "tag|id",
         .help       = "delete a VM snapshot from its tag or id",
-        .mhandler.cmd = do_delvm,
+        .mhandler.cmd = hmp_delvm,
         .command_completion = delvm_completion,
     },
 
@@ -365,7 +365,7 @@ ETEXI
         .args_type  = "option:s?",
         .params     = "[on|off]",
         .help       = "run emulation in singlestep mode or switch to normal mode",
-        .mhandler.cmd = do_singlestep,
+        .mhandler.cmd = hmp_singlestep,
     },
 
 STEXI
@@ -422,7 +422,7 @@ ETEXI
         .args_type  = "device:s?",
         .params     = "[device]",
         .help       = "start gdbserver on given device (default 'tcp::1234'), stop with 'none'",
-        .mhandler.cmd = do_gdbserver,
+        .mhandler.cmd = hmp_gdbserver,
     },
 
 STEXI
@@ -436,7 +436,7 @@ ETEXI
         .args_type  = "fmt:/,addr:l",
         .params     = "/fmt addr",
         .help       = "virtual memory dump starting at 'addr'",
-        .mhandler.cmd = do_memory_dump,
+        .mhandler.cmd = hmp_memory_dump,
     },
 
 STEXI
@@ -450,7 +450,7 @@ ETEXI
         .args_type  = "fmt:/,addr:l",
         .params     = "/fmt addr",
         .help       = "physical memory dump starting at 'addr'",
-        .mhandler.cmd = do_physical_memory_dump,
+        .mhandler.cmd = hmp_physical_memory_dump,
     },
 
 STEXI
@@ -533,7 +533,7 @@ ETEXI
         .args_type  = "fmt:/,addr:i,index:i.",
         .params     = "/fmt addr",
         .help       = "I/O port read",
-        .mhandler.cmd = do_ioport_read,
+        .mhandler.cmd = hmp_ioport_read,
     },
 
 STEXI
@@ -545,7 +545,7 @@ ETEXI
         .args_type  = "fmt:/,addr:i,val:i",
         .params     = "/fmt addr value",
         .help       = "I/O port write",
-        .mhandler.cmd = do_ioport_write,
+        .mhandler.cmd = hmp_ioport_write,
     },
 
 STEXI
@@ -557,7 +557,7 @@ ETEXI
         .args_type  = "keys:s,hold-time:i?",
         .params     = "keys [hold_ms]",
         .help       = "send keys to the VM (e.g. 'sendkey ctrl-alt-f1', default hold time=100 ms)",
-        .mhandler.cmd = hmp_send_key,
+        .mhandler.cmd = hmp_sendkey,
         .command_completion = sendkey_completion,
     },
 
@@ -611,7 +611,7 @@ ETEXI
         .args_type  = "start:i,size:i",
         .params     = "addr size",
         .help       = "compute the checksum of a memory region",
-        .mhandler.cmd = do_sum,
+        .mhandler.cmd = hmp_sum,
     },
 
 STEXI
@@ -626,7 +626,7 @@ ETEXI
         .args_type  = "devname:s",
         .params     = "device",
         .help       = "add USB device (e.g. 'host:bus.addr' or 'host:vendor_id:product_id')",
-        .mhandler.cmd = do_usb_add,
+        .mhandler.cmd = hmp_usb_add,
     },
 
 STEXI
@@ -642,7 +642,7 @@ ETEXI
         .args_type  = "devname:s",
         .params     = "device",
         .help       = "remove USB device 'bus.addr'",
-        .mhandler.cmd = do_usb_del,
+        .mhandler.cmd = hmp_usb_del,
     },
 
 STEXI
@@ -706,7 +706,7 @@ ETEXI
         .args_type  = "dx_str:s,dy_str:s,dz_str:s?",
         .params     = "dx dy [dz]",
         .help       = "send mouse move events",
-        .mhandler.cmd = do_mouse_move,
+        .mhandler.cmd = hmp_mouse_move,
     },
 
 STEXI
@@ -721,7 +721,7 @@ ETEXI
         .args_type  = "button_state:i",
         .params     = "state",
         .help       = "change mouse button state (1=L, 2=M, 4=R)",
-        .mhandler.cmd = do_mouse_button,
+        .mhandler.cmd = hmp_mouse_button,
     },
 
 STEXI
@@ -735,7 +735,7 @@ ETEXI
         .args_type  = "index:i",
         .params     = "index",
         .help       = "set which mouse device receives events",
-        .mhandler.cmd = do_mouse_set,
+        .mhandler.cmd = hmp_mouse_set,
     },
 
 STEXI
@@ -753,7 +753,7 @@ ETEXI
         .args_type  = "path:F,freq:i?,bits:i?,nchannels:i?",
         .params     = "path [frequency [bits [channels]]]",
         .help       = "capture audio to a wave file (default frequency=44100 bits=16 channels=2)",
-        .mhandler.cmd = do_wav_capture,
+        .mhandler.cmd = hmp_wavcapture,
     },
 STEXI
 @item wavcapture @var{filename} [@var{frequency} [@var{bits} [@var{channels}]]]
@@ -774,7 +774,7 @@ ETEXI
         .args_type  = "n:i",
         .params     = "capture index",
         .help       = "stop capture",
-        .mhandler.cmd = do_stop_capture,
+        .mhandler.cmd = hmp_stopcapture,
     },
 STEXI
 @item stopcapture @var{index}
@@ -818,7 +818,7 @@ ETEXI
         .args_type  = "bootdevice:s",
         .params     = "bootdevice",
         .help       = "define new values for the boot device list",
-        .mhandler.cmd = do_boot_set,
+        .mhandler.cmd = hmp_boot_set,
     },
 
 STEXI
@@ -837,7 +837,7 @@ ETEXI
         .args_type  = "",
         .params     = "",
         .help       = "inject an NMI",
-        .mhandler.cmd = hmp_inject_nmi,
+        .mhandler.cmd = hmp_nmi,
     },
 STEXI
 @item nmi @var{cpu}
@@ -1140,7 +1140,7 @@ ETEXI
                       "[,snapshot=on|off][,cache=on|off]\n"
                       "[,readonly=on|off][,copy-on-read=on|off]",
         .help       = "add drive to PCI storage controller",
-        .mhandler.cmd = drive_hot_add,
+        .mhandler.cmd = hmp_drive_add,
     },
 
 STEXI
@@ -1155,7 +1155,7 @@ ETEXI
         .args_type  = "pci_addr:s,type:s,opts:s?",
         .params     = "auto|[[<domain>:]<bus>:]<slot> nic|storage [[vlan=n][,macaddr=addr][,model=type]] [file=file][,if=type][,bus=nr]...",
         .help       = "hot-add PCI device",
-        .mhandler.cmd = pci_device_hot_add,
+        .mhandler.cmd = hmp_pci_add,
     },
 #endif
 
@@ -1171,7 +1171,7 @@ ETEXI
         .args_type  = "pci_addr:s",
         .params     = "[[<domain>:]<bus>:]<slot>",
         .help       = "hot remove PCI device",
-        .mhandler.cmd = do_pci_device_hot_remove,
+        .mhandler.cmd = hmp_pci_del,
     },
 #endif
 
@@ -1197,7 +1197,7 @@ ETEXI
                       "<tlb header> = 32bit x 4\n\t\t\t"
                       "<tlb header prefix> = 32bit x 4",
         .user_print  = pcie_aer_inject_error_print,
-        .mhandler.cmd_new = do_pcie_aer_inject_error,
+        .mhandler.cmd_new = hmp_pcie_aer_inject_error,
     },
 
 STEXI
@@ -1211,7 +1211,7 @@ ETEXI
         .args_type  = "device:s,opts:s?",
         .params     = "tap|user|socket|vde|netmap|bridge|vhost-user|dump [options]",
         .help       = "add host VLAN client",
-        .mhandler.cmd = net_host_device_add,
+        .mhandler.cmd = hmp_host_net_add,
         .command_completion = host_net_add_completion,
     },
 
@@ -1226,7 +1226,7 @@ ETEXI
         .args_type  = "vlan_id:i,device:s",
         .params     = "vlan_id name",
         .help       = "remove host VLAN client",
-        .mhandler.cmd = net_host_device_remove,
+        .mhandler.cmd = hmp_host_net_remove,
         .command_completion = host_net_remove_completion,
     },
 
@@ -1302,7 +1302,7 @@ ETEXI
         .args_type  = "arg1:s,arg2:s?,arg3:s?",
         .params     = "[vlan_id name] [tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport",
         .help       = "redirect TCP or UDP connections from host to guest (requires -net user)",
-        .mhandler.cmd = net_slirp_hostfwd_add,
+        .mhandler.cmd = hmp_hostfwd_add,
     },
 #endif
 STEXI
@@ -1317,7 +1317,7 @@ ETEXI
         .args_type  = "arg1:s,arg2:s?,arg3:s?",
         .params     = "[vlan_id name] [tcp|udp]:[hostaddr]:hostport",
         .help       = "remove host-to-guest TCP or UDP redirection",
-        .mhandler.cmd = net_slirp_hostfwd_remove,
+        .mhandler.cmd = hmp_hostfwd_remove,
     },
 
 #endif
@@ -1361,7 +1361,7 @@ ETEXI
         .args_type  = "action:s",
         .params     = "[reset|shutdown|poweroff|pause|debug|none]",
         .help       = "change watchdog action",
-        .mhandler.cmd = do_watchdog_action,
+        .mhandler.cmd = hmp_watchdog_action,
         .command_completion = watchdog_action_completion,
     },
 
@@ -1376,7 +1376,7 @@ ETEXI
         .args_type  = "aclname:s",
         .params     = "aclname",
         .help       = "list rules in the access control list",
-        .mhandler.cmd = do_acl_show,
+        .mhandler.cmd = hmp_acl_show,
     },
 
 STEXI
@@ -1393,7 +1393,7 @@ ETEXI
         .args_type  = "aclname:s,policy:s",
         .params     = "aclname allow|deny",
         .help       = "set default access control list policy",
-        .mhandler.cmd = do_acl_policy,
+        .mhandler.cmd = hmp_acl_policy,
     },
 
 STEXI
@@ -1409,7 +1409,7 @@ ETEXI
         .args_type  = "aclname:s,match:s,policy:s,index:i?",
         .params     = "aclname match allow|deny [index]",
         .help       = "add a match rule to the access control list",
-        .mhandler.cmd = do_acl_add,
+        .mhandler.cmd = hmp_acl_add,
     },
 
 STEXI
@@ -1428,7 +1428,7 @@ ETEXI
         .args_type  = "aclname:s,match:s",
         .params     = "aclname match",
         .help       = "remove a match rule from the access control list",
-        .mhandler.cmd = do_acl_remove,
+        .mhandler.cmd = hmp_acl_remove,
     },
 
 STEXI
@@ -1442,7 +1442,7 @@ ETEXI
         .args_type  = "aclname:s",
         .params     = "aclname",
         .help       = "reset the access control list",
-        .mhandler.cmd = do_acl_reset,
+        .mhandler.cmd = hmp_acl_reset,
     },
 
 STEXI
@@ -1504,7 +1504,7 @@ ETEXI
         .args_type  = "broadcast:-b,cpu_index:i,bank:i,status:l,mcg_status:l,addr:l,misc:l",
         .params     = "[-b] cpu bank status mcgstatus addr misc",
         .help       = "inject a MCE on the given CPU [and broadcast to other CPUs with -b option]",
-        .mhandler.cmd = do_inject_mce,
+        .mhandler.cmd = hmp_mce,
     },
 
 #endif
@@ -1694,7 +1694,7 @@ ETEXI
         .args_type  = "item:s?",
         .params     = "[subcommand]",
         .help       = "show various information about the system state",
-        .mhandler.cmd = do_info_help,
+        .mhandler.cmd = hmp_info_help,
         .sub_table = info_cmds,
     },
 
diff --git a/hmp.c b/hmp.c
index b47f331..62dae32 100644
--- a/hmp.c
+++ b/hmp.c
@@ -923,7 +923,7 @@ void hmp_system_wakeup(Monitor *mon, const QDict *qdict)
     qmp_system_wakeup(NULL);
 }
 
-void hmp_inject_nmi(Monitor *mon, const QDict *qdict)
+void hmp_nmi(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
@@ -1532,7 +1532,7 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, &err);
 }
 
-void hmp_send_key(Monitor *mon, const QDict *qdict)
+void hmp_sendkey(Monitor *mon, const QDict *qdict)
 {
     const char *keys = qdict_get_str(qdict, "keys");
     KeyValueList *keylist, *head = NULL, *tmp = NULL;
@@ -1601,7 +1601,7 @@ err_out:
     goto out;
 }
 
-void hmp_screen_dump(Monitor *mon, const QDict *qdict)
+void hmp_screendump(Monitor *mon, const QDict *qdict)
 {
     const char *filename = qdict_get_str(qdict, "filename");
     Error *err = NULL;
diff --git a/hmp.h b/hmp.h
index 4bb5dca..81177b2 100644
--- a/hmp.h
+++ b/hmp.h
@@ -49,7 +49,7 @@ void hmp_ringbuf_write(Monitor *mon, const QDict *qdict);
 void hmp_ringbuf_read(Monitor *mon, const QDict *qdict);
 void hmp_cont(Monitor *mon, const QDict *qdict);
 void hmp_system_wakeup(Monitor *mon, const QDict *qdict);
-void hmp_inject_nmi(Monitor *mon, const QDict *qdict);
+void hmp_nmi(Monitor *mon, const QDict *qdict);
 void hmp_set_link(Monitor *mon, const QDict *qdict);
 void hmp_block_passwd(Monitor *mon, const QDict *qdict);
 void hmp_balloon(Monitor *mon, const QDict *qdict);
@@ -82,8 +82,8 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
-void hmp_send_key(Monitor *mon, const QDict *qdict);
-void hmp_screen_dump(Monitor *mon, const QDict *qdict);
+void hmp_sendkey(Monitor *mon, const QDict *qdict);
+void hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_start(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_add(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_stop(Monitor *mon, const QDict *qdict);
diff --git a/hw/pci/pci-hotplug-old.c b/hw/pci/pci-hotplug-old.c
index 0c09c72..a0ef90c 100644
--- a/hw/pci/pci-hotplug-old.c
+++ b/hw/pci/pci-hotplug-old.c
@@ -267,7 +267,7 @@ static PCIDevice *qemu_pci_hot_add_storage(Monitor *mon,
     return dev;
 }
 
-void pci_device_hot_add(Monitor *mon, const QDict *qdict)
+void hmp_pci_add(Monitor *mon, const QDict *qdict)
 {
     PCIDevice *dev = NULL;
     const char *pci_addr = qdict_get_str(qdict, "pci_addr");
@@ -337,7 +337,7 @@ static int pci_device_hot_remove(Monitor *mon, const char *pci_addr)
     return 0;
 }
 
-void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict)
+void hmp_pci_del(Monitor *mon, const QDict *qdict)
 {
     pci_device_hot_remove(mon, qdict_get_str(qdict, "pci_addr"));
 }
diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 1dda89b..5e564c3 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -34,7 +34,7 @@ static void pci_error_message(Monitor *mon)
     monitor_printf(mon, "PCI devices not supported\n");
 }
 
-int do_pcie_aer_inject_error(Monitor *mon,
+int hmp_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data)
 {
     pci_error_message(mon);
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 1f4be16..5a25c32 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -962,7 +962,7 @@ static int pcie_aer_parse_error_string(const char *error_name,
     return -EINVAL;
 }
 
-int do_pcie_aer_inject_error(Monitor *mon,
+int hmp_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data)
 {
     const char *id = qdict_get_str(qdict, "id");
diff --git a/include/net/net.h b/include/net/net.h
index 008d610..ac43a8e 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -187,8 +187,8 @@ int net_client_parse(QemuOptsList *opts_list, const char *str);
 int net_init_clients(void);
 void net_check_clients(void);
 void net_cleanup(void);
-void net_host_device_add(Monitor *mon, const QDict *qdict);
-void net_host_device_remove(Monitor *mon, const QDict *qdict);
+void hmp_host_net_add(Monitor *mon, const QDict *qdict);
+void hmp_host_net_remove(Monitor *mon, const QDict *qdict);
 void netdev_add(QemuOpts *opts, Error **errp);
 int qmp_netdev_add(Monitor *mon, const QDict *qdict, QObject **ret);
 
diff --git a/include/net/slirp.h b/include/net/slirp.h
index 0502389..d3b64f6 100644
--- a/include/net/slirp.h
+++ b/include/net/slirp.h
@@ -31,8 +31,8 @@
 
 #ifdef CONFIG_SLIRP
 
-void net_slirp_hostfwd_add(Monitor *mon, const QDict *qdict);
-void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict);
+void hmp_hostfwd_add(Monitor *mon, const QDict *qdict);
+void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict);
 
 int net_slirp_redir(const char *redir_str);
 
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index aab12b9..33eb400 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -70,7 +70,7 @@ BlockBackend *blk_next(BlockBackend *blk);
 
 BlockDriverState *blk_bs(BlockBackend *blk);
 
-void blk_hide_on_behalf_of_do_drive_del(BlockBackend *blk);
+void blk_hide_on_behalf_of_hmp_drive_del(BlockBackend *blk);
 
 void blk_iostatus_enable(BlockBackend *blk);
 int blk_attach_dev(BlockBackend *blk, void *dev);
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 09d1e30..0c62643 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -67,6 +67,6 @@ DriveInfo *add_init_drive(const char *opts);
 
 void qmp_change_blockdev(const char *device, const char *filename,
                          const char *format, Error **errp);
-void do_commit(Monitor *mon, const QDict *qdict);
-int do_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data);
+void hmp_commit(Monitor *mon, const QDict *qdict);
+int hmp_drive_del(Monitor *mon, const QDict *qdict, QObject **ret_data);
 #endif
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index c42649c..d132430 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -74,9 +74,9 @@ void qemu_remove_exit_notifier(Notifier *notify);
 
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 
-void do_savevm(Monitor *mon, const QDict *qdict);
+void hmp_savevm(Monitor *mon, const QDict *qdict);
 int load_vmstate(const char *name);
-void do_delvm(Monitor *mon, const QDict *qdict);
+void hmp_delvm(Monitor *mon, const QDict *qdict);
 void do_info_snapshots(Monitor *mon, const QDict *qdict);
 
 void qemu_announce_self(void);
@@ -175,16 +175,16 @@ extern const char *prom_envs[MAX_PROM_ENVS];
 extern unsigned int nb_prom_envs;
 
 /* pci-hotplug */
-void pci_device_hot_add(Monitor *mon, const QDict *qdict);
+void hmp_pci_add(Monitor *mon, const QDict *qdict);
 int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo *dinfo);
-void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict);
+void hmp_pci_del(Monitor *mon, const QDict *qdict);
 
 /* generic hotplug */
-void drive_hot_add(Monitor *mon, const QDict *qdict);
+void hmp_drive_add(Monitor *mon, const QDict *qdict);
 
 /* pcie aer error injection */
 void pcie_aer_inject_error_print(Monitor *mon, const QObject *data);
-int do_pcie_aer_inject_error(Monitor *mon,
+int hmp_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data);
 
 /* serial ports */
@@ -199,8 +199,8 @@ extern CharDriverState *serial_hds[MAX_SERIAL_PORTS];
 
 extern CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
 
-void do_usb_add(Monitor *mon, const QDict *qdict);
-void do_usb_del(Monitor *mon, const QDict *qdict);
+void hmp_usb_add(Monitor *mon, const QDict *qdict);
+void hmp_usb_del(Monitor *mon, const QDict *qdict);
 void usb_info(Monitor *mon, const QDict *qdict);
 
 void add_boot_device_path(int32_t bootindex, DeviceState *dev,
diff --git a/include/ui/console.h b/include/ui/console.h
index 8a4d671..de88bba 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -56,7 +56,7 @@ struct MouseTransformInfo {
     int a[7];
 };
 
-void do_mouse_set(Monitor *mon, const QDict *qdict);
+void hmp_mouse_set(Monitor *mon, const QDict *qdict);
 
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
    constants) */
diff --git a/monitor.c b/monitor.c
index c3cc060..75dbc53 100644
--- a/monitor.c
+++ b/monitor.c
@@ -881,7 +881,7 @@ static void do_help_cmd(Monitor *mon, const QDict *qdict)
     help_cmd(mon, qdict_get_try_str(qdict, "name"));
 }
 
-static void do_trace_event_set_state(Monitor *mon, const QDict *qdict)
+static void hmp_trace_event(Monitor *mon, const QDict *qdict)
 {
     const char *tp_name = qdict_get_str(qdict, "name");
     bool new_state = qdict_get_bool(qdict, "option");
@@ -895,7 +895,7 @@ static void do_trace_event_set_state(Monitor *mon, const QDict *qdict)
 }
 
 #ifdef CONFIG_TRACE_SIMPLE
-static void do_trace_file(Monitor *mon, const QDict *qdict)
+static void hmp_trace_file(Monitor *mon, const QDict *qdict)
 {
     const char *op = qdict_get_try_str(qdict, "op");
     const char *arg = qdict_get_try_str(qdict, "arg");
@@ -958,7 +958,7 @@ static void user_async_cmd_handler(Monitor *mon, const mon_cmd_t *cmd,
     }
 }
 
-static void do_info_help(Monitor *mon, const QDict *qdict)
+static void hmp_info_help(Monitor *mon, const QDict *qdict)
 {
     help_cmd(mon, "info");
 }
@@ -1122,12 +1122,12 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
     return -1;
 }
 
-static void do_logfile(Monitor *mon, const QDict *qdict)
+static void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     qemu_set_log_filename(qdict_get_str(qdict, "filename"));
 }
 
-static void do_log(Monitor *mon, const QDict *qdict)
+static void hmp_log(Monitor *mon, const QDict *qdict)
 {
     int mask;
     const char *items = qdict_get_str(qdict, "items");
@@ -1144,7 +1144,7 @@ static void do_log(Monitor *mon, const QDict *qdict)
     qemu_set_log(mask);
 }
 
-static void do_singlestep(Monitor *mon, const QDict *qdict)
+static void hmp_singlestep(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     if (!option || !strcmp(option, "on")) {
@@ -1156,7 +1156,7 @@ static void do_singlestep(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_gdbserver(Monitor *mon, const QDict *qdict)
+static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_try_str(qdict, "device");
     if (!device)
@@ -1172,7 +1172,7 @@ static void do_gdbserver(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_watchdog_action(Monitor *mon, const QDict *qdict)
+static void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
 {
     const char *action = qdict_get_str(qdict, "action");
     if (select_watchdog_action(action) == -1) {
@@ -1331,7 +1331,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     }
 }
 
-static void do_memory_dump(Monitor *mon, const QDict *qdict)
+static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -1341,7 +1341,7 @@ static void do_memory_dump(Monitor *mon, const QDict *qdict)
     memory_dump(mon, count, format, size, addr, 0);
 }
 
-static void do_physical_memory_dump(Monitor *mon, const QDict *qdict)
+static void hmp_physical_memory_dump(Monitor *mon, const QDict *qdict)
 {
     int count = qdict_get_int(qdict, "count");
     int format = qdict_get_int(qdict, "format");
@@ -1377,7 +1377,7 @@ static void do_print(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "\n");
 }
 
-static void do_sum(Monitor *mon, const QDict *qdict)
+static void hmp_sum(Monitor *mon, const QDict *qdict)
 {
     uint32_t addr;
     uint16_t sum;
@@ -1396,7 +1396,7 @@ static void do_sum(Monitor *mon, const QDict *qdict)
 
 static int mouse_button_state;
 
-static void do_mouse_move(Monitor *mon, const QDict *qdict)
+static void hmp_mouse_move(Monitor *mon, const QDict *qdict)
 {
     int dx, dy, dz, button;
     const char *dx_str = qdict_get_str(qdict, "dx_str");
@@ -1420,7 +1420,7 @@ static void do_mouse_move(Monitor *mon, const QDict *qdict)
     qemu_input_event_sync();
 }
 
-static void do_mouse_button(Monitor *mon, const QDict *qdict)
+static void hmp_mouse_button(Monitor *mon, const QDict *qdict)
 {
     static uint32_t bmap[INPUT_BUTTON_MAX] = {
         [INPUT_BUTTON_LEFT]       = MOUSE_EVENT_LBUTTON,
@@ -1437,7 +1437,7 @@ static void do_mouse_button(Monitor *mon, const QDict *qdict)
     mouse_button_state = button_state;
 }
 
-static void do_ioport_read(Monitor *mon, const QDict *qdict)
+static void hmp_ioport_read(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -1471,7 +1471,7 @@ static void do_ioport_read(Monitor *mon, const QDict *qdict)
                    suffix, addr, size * 2, val);
 }
 
-static void do_ioport_write(Monitor *mon, const QDict *qdict)
+static void hmp_ioport_write(Monitor *mon, const QDict *qdict)
 {
     int size = qdict_get_int(qdict, "size");
     int addr = qdict_get_int(qdict, "addr");
@@ -1493,7 +1493,7 @@ static void do_ioport_write(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_boot_set(Monitor *mon, const QDict *qdict)
+static void hmp_boot_set(Monitor *mon, const QDict *qdict)
 {
     Error *local_err = NULL;
     const char *bootdevice = qdict_get_str(qdict, "bootdevice");
@@ -2006,7 +2006,7 @@ static void do_info_capture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_stop_capture(Monitor *mon, const QDict *qdict)
+static void hmp_stopcapture(Monitor *mon, const QDict *qdict)
 {
     int i;
     int n = qdict_get_int(qdict, "n");
@@ -2022,7 +2022,7 @@ static void do_stop_capture(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_wav_capture(Monitor *mon, const QDict *qdict)
+static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
 {
     const char *path = qdict_get_str(qdict, "path");
     int has_freq = qdict_haskey(qdict, "freq");
@@ -2057,7 +2057,7 @@ static qemu_acl *find_acl(Monitor *mon, const char *name)
     return acl;
 }
 
-static void do_acl_show(Monitor *mon, const QDict *qdict)
+static void hmp_acl_show(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     qemu_acl *acl = find_acl(mon, aclname);
@@ -2075,7 +2075,7 @@ static void do_acl_show(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_acl_reset(Monitor *mon, const QDict *qdict)
+static void hmp_acl_reset(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     qemu_acl *acl = find_acl(mon, aclname);
@@ -2086,7 +2086,7 @@ static void do_acl_reset(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_acl_policy(Monitor *mon, const QDict *qdict)
+static void hmp_acl_policy(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *policy = qdict_get_str(qdict, "policy");
@@ -2106,7 +2106,7 @@ static void do_acl_policy(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_acl_add(Monitor *mon, const QDict *qdict)
+static void hmp_acl_add(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
@@ -2137,7 +2137,7 @@ static void do_acl_add(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void do_acl_remove(Monitor *mon, const QDict *qdict)
+static void hmp_acl_remove(Monitor *mon, const QDict *qdict)
 {
     const char *aclname = qdict_get_str(qdict, "aclname");
     const char *match = qdict_get_str(qdict, "match");
@@ -2154,7 +2154,7 @@ static void do_acl_remove(Monitor *mon, const QDict *qdict)
 }
 
 #if defined(TARGET_I386)
-static void do_inject_mce(Monitor *mon, const QDict *qdict)
+static void hmp_mce(Monitor *mon, const QDict *qdict)
 {
     X86CPU *cpu;
     CPUState *cs;
@@ -2232,7 +2232,7 @@ void qmp_closefd(const char *fdname, Error **errp)
     error_set(errp, QERR_FD_NOT_FOUND, fdname);
 }
 
-static void do_loadvm(Monitor *mon, const QDict *qdict)
+static void hmp_loadvm(Monitor *mon, const QDict *qdict)
 {
     int saved_vm_running  = runstate_is_running();
     const char *name = qdict_get_str(qdict, "name");
diff --git a/net/net.c b/net/net.c
index 74e651e..506dab9 100644
--- a/net/net.c
+++ b/net/net.c
@@ -953,7 +953,7 @@ static int net_host_check_device(const char *device)
     return 0;
 }
 
-void net_host_device_add(Monitor *mon, const QDict *qdict)
+void hmp_host_net_add(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_str(qdict, "device");
     const char *opts_str = qdict_get_try_str(qdict, "opts");
@@ -980,7 +980,7 @@ void net_host_device_add(Monitor *mon, const QDict *qdict)
     }
 }
 
-void net_host_device_remove(Monitor *mon, const QDict *qdict)
+void hmp_host_net_remove(Monitor *mon, const QDict *qdict)
 {
     NetClientState *nc;
     int vlan_id = qdict_get_int(qdict, "vlan_id");
diff --git a/net/slirp.c b/net/slirp.c
index 0cbca3c..9f1047c 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -299,7 +299,7 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *vlan,
     }
 }
 
-void net_slirp_hostfwd_remove(Monitor *mon, const QDict *qdict)
+void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 {
     struct in_addr host_addr = { .s_addr = INADDR_ANY };
     int host_port;
@@ -420,7 +420,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str,
     return -1;
 }
 
-void net_slirp_hostfwd_add(Monitor *mon, const QDict *qdict)
+void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
 {
     const char *redir_str;
     SlirpState *s;
diff --git a/savevm.c b/savevm.c
index 8040766..ed9608c 100644
--- a/savevm.c
+++ b/savevm.c
@@ -1091,7 +1091,7 @@ static int del_existing_snapshots(Monitor *mon, const char *name)
     return 0;
 }
 
-void do_savevm(Monitor *mon, const QDict *qdict)
+void hmp_savevm(Monitor *mon, const QDict *qdict)
 {
     BlockDriverState *bs, *bs1;
     QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
@@ -1295,7 +1295,7 @@ int load_vmstate(const char *name)
     return 0;
 }
 
-void do_delvm(Monitor *mon, const QDict *qdict)
+void hmp_delvm(Monitor *mon, const QDict *qdict)
 {
     BlockDriverState *bs;
     Error *err;
diff --git a/ui/input.c b/ui/input.c
index 7ba99e5..eeeabe8 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -526,7 +526,7 @@ MouseInfoList *qmp_query_mice(Error **errp)
     return mice_list;
 }
 
-void do_mouse_set(Monitor *mon, const QDict *qdict)
+void hmp_mouse_set(Monitor *mon, const QDict *qdict)
 {
     QemuInputHandlerState *s;
     int index = qdict_get_int(qdict, "index");
diff --git a/vl.c b/vl.c
index 8c8f142..7e6e93c 100644
--- a/vl.c
+++ b/vl.c
@@ -1284,7 +1284,7 @@ static int usb_parse(const char *cmdline)
     return r;
 }
 
-void do_usb_add(Monitor *mon, const QDict *qdict)
+void hmp_usb_add(Monitor *mon, const QDict *qdict)
 {
     const char *devname = qdict_get_str(qdict, "devname");
     if (usb_device_add(devname) < 0) {
@@ -1292,7 +1292,7 @@ void do_usb_add(Monitor *mon, const QDict *qdict)
     }
 }
 
-void do_usb_del(Monitor *mon, const QDict *qdict)
+void hmp_usb_del(Monitor *mon, const QDict *qdict)
 {
     const char *devname = qdict_get_str(qdict, "devname");
     if (usb_device_del(devname) < 0) {
-- 
1.9.3



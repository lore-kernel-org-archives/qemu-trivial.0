Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNULn-00015X-Ta
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 15:59:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULl-0000xz-H5
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 15:59:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULk-0002KA-DV
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 15:59:49 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNULh-0002B9-MG; Sun, 14 Oct 2012 15:59:45 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9Q9woImukks+dYsGiqg19AG48kVIQUK+mk+4Ws04aVo=;
	b=c7zEW78IPkJx4h9n9Ymw+ChbxuFaYw/TydQfvdPmnbewC4xsgXWcE7RtLAHjJ5nUyz
	7kNVMXnUOTWxeH/Qv02jZVM8DpjEOO0C0AqqojtaaIZUslgcss+y6Z0XXgI7KpOsmiDS
	NQM+emDyLUrlUzCS1lZr0ek6u7cLnpJRnPJOG96IIIsOg8381hcf6yRC3bMCj3NPLljQ
	Io+fDlYltSTpIDQgZxxHeuTq8mgt6xwQEWoKtMgutZKYP1H6k42ALU4VtWEFjkM6zPzM
	4SM0WIliCxL48o5ed8oHhwkvKPWVpOeEK/d3YniwKuKiy2xHvaM8XGKkGr3YMmEkx6eC
	fZKA==
Received: by 10.152.105.236 with SMTP id gp12mr8352035lab.35.1350244784971;
	Sun, 14 Oct 2012 12:59:44 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.12.59.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 12:59:44 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:50 +0000
Message-Id: <1b9d5e43534eb98840cd2f3fbbbe73c71351cb03.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH 02/11] vl.c: add missing static
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
X-List-Received-Date: Sun, 14 Oct 2012 19:59:50 -0000

Add missing 'static' qualifiers and remove unused
pcmcia_socket_unregister().

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/pcmcia.h |    1 -
 sysemu.h    |    5 -----
 vl.c        |   33 ++++++++++++---------------------
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/hw/pcmcia.h b/hw/pcmcia.h
index 50648c9..6b7aee5 100644
--- a/hw/pcmcia.h
+++ b/hw/pcmcia.h
@@ -10,7 +10,6 @@ typedef struct {
 } PCMCIASocket;
 
 void pcmcia_socket_register(PCMCIASocket *socket);
-void pcmcia_socket_unregister(PCMCIASocket *socket);
 void pcmcia_info(Monitor *mon);
 
 struct PCMCIACardState {
diff --git a/sysemu.h b/sysemu.h
index 0c39a3a..1683448 100644
--- a/sysemu.h
+++ b/sysemu.h
@@ -19,7 +19,6 @@ extern uint8_t qemu_uuid[];
 int qemu_uuid_parse(const char *str, uint8_t *uuid);
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-%02hhx%02hhx-%02hhx%02hhx-%02hhx%02hhx-%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx"
 
-void runstate_init(void);
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
 int runstate_is_running(void);
@@ -57,11 +56,7 @@ void qemu_system_debug_request(void);
 void qemu_system_vmstop_request(RunState reason);
 int qemu_shutdown_requested_get(void);
 int qemu_reset_requested_get(void);
-int qemu_shutdown_requested(void);
-int qemu_reset_requested(void);
-int qemu_powerdown_requested(void);
 void qemu_system_killed(int signal, pid_t pid);
-void qemu_kill_report(void);
 void qemu_devices_reset(void);
 void qemu_system_reset(bool report);
 
diff --git a/vl.c b/vl.c
index 5b357a3..6cb87ac 100644
--- a/vl.c
+++ b/vl.c
@@ -180,7 +180,7 @@ static const char *data_dir;
 const char *bios_name = NULL;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 DisplayType display_type = DT_DEFAULT;
-int display_remote = 0;
+static int display_remote;
 const char* keyboard_layout = NULL;
 ram_addr_t ram_size;
 const char *mem_path = NULL;
@@ -215,7 +215,7 @@ const char *vnc_display;
 int acpi_enabled = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
-int no_reboot = 0;
+static int no_reboot;
 int no_shutdown = 0;
 int cursor_hide = 1;
 int graphic_rotate = 0;
@@ -243,7 +243,8 @@ struct FWBootEntry {
     char *suffix;
 };
 
-QTAILQ_HEAD(, FWBootEntry) fw_boot_order = QTAILQ_HEAD_INITIALIZER(fw_boot_order);
+static QTAILQ_HEAD(, FWBootEntry) fw_boot_order =
+    QTAILQ_HEAD_INITIALIZER(fw_boot_order);
 
 int nb_numa_nodes;
 uint64_t node_mem[MAX_NODES];
@@ -397,7 +398,7 @@ bool runstate_check(RunState state)
     return current_run_state == state;
 }
 
-void runstate_init(void)
+static void runstate_init(void)
 {
     const RunStateTransition *p;
 
@@ -1170,18 +1171,6 @@ void pcmcia_socket_register(PCMCIASocket *socket)
     pcmcia_sockets = entry;
 }
 
-void pcmcia_socket_unregister(PCMCIASocket *socket)
-{
-    struct pcmcia_socket_entry_s *entry, **ptr;
-
-    ptr = &pcmcia_sockets;
-    for (entry = *ptr; entry; ptr = &entry->next, entry = *ptr)
-        if (entry->socket == socket) {
-            *ptr = entry->next;
-            g_free(entry);
-        }
-}
-
 void pcmcia_info(Monitor *mon)
 {
     struct pcmcia_socket_entry_s *iter;
@@ -1373,14 +1362,14 @@ int qemu_reset_requested_get(void)
     return reset_requested;
 }
 
-int qemu_shutdown_requested(void)
+static int qemu_shutdown_requested(void)
 {
     int r = shutdown_requested;
     shutdown_requested = 0;
     return r;
 }
 
-void qemu_kill_report(void)
+static void qemu_kill_report(void)
 {
     if (!qtest_enabled() && shutdown_signal != -1) {
         fprintf(stderr, "qemu: terminating on signal %d", shutdown_signal);
@@ -1396,7 +1385,7 @@ void qemu_kill_report(void)
     }
 }
 
-int qemu_reset_requested(void)
+static int qemu_reset_requested(void)
 {
     int r = reset_requested;
     reset_requested = 0;
@@ -1417,7 +1406,7 @@ static int qemu_wakeup_requested(void)
     return r;
 }
 
-int qemu_powerdown_requested(void)
+static int qemu_powerdown_requested(void)
 {
     int r = powerdown_requested;
     powerdown_requested = 0;
@@ -2043,7 +2032,9 @@ struct device_config {
     Location loc;
     QTAILQ_ENTRY(device_config) next;
 };
-QTAILQ_HEAD(, device_config) device_configs = QTAILQ_HEAD_INITIALIZER(device_configs);
+
+static QTAILQ_HEAD(, device_config) device_configs =
+    QTAILQ_HEAD_INITIALIZER(device_configs);
 
 static void add_device_config(int type, const char *cmdline)
 {
-- 
1.7.2.5



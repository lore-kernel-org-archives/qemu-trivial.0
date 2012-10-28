Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgO-0002fW-Sq
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgK-0002S4-BP
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgJ-0007wQ-4o
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:28 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:41861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQgG-0007vF-HI; Sun, 28 Oct 2012 07:05:24 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so3144895lah.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FKFS/BgqzzsvWFEAJtP8X2ylE+fQdfaMRUWonEp+vz8=;
	b=r8Dyxw4ywQYA1JinAfuFCTMjpbbvmMk8QEIQnxxBlH6oCGUFTrKjuW4En6xLcH8m6c
	rsefhDxe0mSyps4p+v7kXu94UmPCoTsC1Gt43RHNEh1ByDtmzAsMDi37A7y5oMBJGXto
	UlNBkB5Teh88bcPY6gX9bIyvUFRmoyM7HCbtIolYLcVfzabO5w6B+J3twfoh5i6vV3Zl
	QmHS3He1QO+Ue+EbiI8M9AFC//iZHjKu7dO76qOwzcftHa3cKxqk/7MXRrGmrSR0yvuD
	5g3zT/21r8MVud6kBe7ZyXYtY7XETf298EpesjXNjHVPp4VeLSu5e4OEr/J7kVabH2gq
	/2Og==
Received: by 10.152.105.236 with SMTP id gp12mr24759534lab.35.1351422323867;
	Sun, 28 Oct 2012 04:05:23 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:23 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:47 +0000
Message-Id: <3225f962d943e3886078382ce2fd63bd42d567bb.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 2/6] vl.c: add missing static
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:32 -0000

Add missing 'static' qualifiers.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 sysemu.h |    5 -----
 vl.c     |   21 ++++++++++++---------
 2 files changed, 12 insertions(+), 14 deletions(-)

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
index 9f99ef4..7320244 100644
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
 
@@ -1373,14 +1374,14 @@ int qemu_reset_requested_get(void)
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
@@ -1396,7 +1397,7 @@ void qemu_kill_report(void)
     }
 }
 
-int qemu_reset_requested(void)
+static int qemu_reset_requested(void)
 {
     int r = reset_requested;
     reset_requested = 0;
@@ -1417,7 +1418,7 @@ static int qemu_wakeup_requested(void)
     return r;
 }
 
-int qemu_powerdown_requested(void)
+static int qemu_powerdown_requested(void)
 {
     int r = powerdown_requested;
     powerdown_requested = 0;
@@ -2043,7 +2044,9 @@ struct device_config {
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



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRcY8-0005Eu-6Y
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:24:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRcY5-0005CW-1o
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:24:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRcY3-00078R-E5
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:24:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cRcXx-00076C-W6; Thu, 12 Jan 2017 05:23:54 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90E1E8F29A;
	Thu, 12 Jan 2017 10:23:53 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v0CANpb5027933; Thu, 12 Jan 2017 05:23:52 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Daniel P Berrange <berrange@redhat.com>
Date: Thu, 12 Jan 2017 11:23:51 +0100
Message-Id: <1484216631-30723-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 12 Jan 2017 10:23:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] monitor: Fix crashes when using HMP
 commands without CPU
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
X-List-Received-Date: Thu, 12 Jan 2017 10:24:02 -0000

When running certain HMP commands ("info registers", "info cpustats",
"nmi", "memsave" or dumping virtual memory) with the "none" machine,
QEMU crashes with a segmentation fault. This happens because the "none"
machine does not have any CPUs by default, but these HMP commands did
not check for a valid CPU pointer yet. Add such checks now, so we get
an error message about the missing CPU instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Added more checks to cover "nmi" and "memsave", too

 hmp.c     |  8 +++++++-
 monitor.c | 37 +++++++++++++++++++++++++++++++------
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/hmp.c b/hmp.c
index b869617..b1c503a 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1013,8 +1013,14 @@ void hmp_memsave(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     uint64_t addr = qdict_get_int(qdict, "val");
     Error *err = NULL;
+    int cpu_index = monitor_get_cpu_index();
 
-    qmp_memsave(addr, size, filename, true, monitor_get_cpu_index(), &err);
+    if (cpu_index < 0) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    qmp_memsave(addr, size, filename, true, cpu_index, &err);
     hmp_handle_error(mon, &err);
 }
 
diff --git a/monitor.c b/monitor.c
index 0841d43..74843eb 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1025,6 +1025,9 @@ int monitor_set_cpu(int cpu_index)
 CPUState *mon_get_cpu(void)
 {
     if (!cur_mon->mon_cpu) {
+        if (!first_cpu) {
+            return NULL;
+        }
         monitor_set_cpu(first_cpu->cpu_index);
     }
     cpu_synchronize_state(cur_mon->mon_cpu);
@@ -1033,17 +1036,27 @@ CPUState *mon_get_cpu(void)
 
 CPUArchState *mon_get_cpu_env(void)
 {
-    return mon_get_cpu()->env_ptr;
+    CPUState *cs = mon_get_cpu();
+
+    return cs ? cs->env_ptr : NULL;
 }
 
 int monitor_get_cpu_index(void)
 {
-    return mon_get_cpu()->cpu_index;
+    CPUState *cs = mon_get_cpu();
+
+    return cs ? cs->cpu_index : -1;
 }
 
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
-    cpu_dump_state(mon_get_cpu(), (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
+    CPUState *cs = mon_get_cpu();
+
+    if (!cs) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+    cpu_dump_state(cs, (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
 }
 
 static void hmp_info_jit(Monitor *mon, const QDict *qdict)
@@ -1076,7 +1089,13 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
 
 static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
 {
-    cpu_dump_statistics(mon_get_cpu(), (FILE *)mon, &monitor_fprintf, 0);
+    CPUState *cs = mon_get_cpu();
+
+    if (!cs) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+    cpu_dump_statistics(cs, (FILE *)mon, &monitor_fprintf, 0);
 }
 
 static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
@@ -1235,6 +1254,12 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
     int l, line_size, i, max_digits, len;
     uint8_t buf[16];
     uint64_t v;
+    CPUState *cs = mon_get_cpu();
+
+    if (!cs && (format == 'i' || !is_physical)) {
+        monitor_printf(mon, "Can not dump without CPU\n");
+        return;
+    }
 
     if (format == 'i') {
         int flags = 0;
@@ -1264,7 +1289,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         flags = msr_le << 16;
         flags |= env->bfd_mach;
 #endif
-        monitor_disas(mon, mon_get_cpu(), addr, count, is_physical, flags);
+        monitor_disas(mon, cs, addr, count, is_physical, flags);
         return;
     }
 
@@ -1303,7 +1328,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         if (is_physical) {
             cpu_physical_memory_read(addr, buf, l);
         } else {
-            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) < 0) {
+            if (cpu_memory_rw_debug(cs, addr, buf, l, 0) < 0) {
                 monitor_printf(mon, " Cannot access memory\n");
                 break;
             }
-- 
1.8.3.1



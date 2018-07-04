Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1faYJL-0003wP-6p
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jul 2018 23:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1faYJJ-0003w2-Cb
	for qemu-trivial@nongnu.org; Tue, 03 Jul 2018 23:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>) id 1faYJG-0001rQ-6t
	for qemu-trivial@nongnu.org; Tue, 03 Jul 2018 23:18:29 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:7988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baiyaowei@cmss.chinamobile.com>)
	id 1faYJF-0001pv-E9; Tue, 03 Jul 2018 23:18:26 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
	rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id
	2ee95b3c3c78236-29a7e; Wed, 04 Jul 2018 11:18:16 +0800 (CST)
X-RM-TRANSID: 2ee95b3c3c78236-29a7e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from qemu-tcmu.novalocal (unknown[112.25.65.41])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id
	2ee65b3c3c77b2a-fe307; Wed, 04 Jul 2018 11:18:16 +0800 (CST)
X-RM-TRANSID: 2ee65b3c3c77b2a-fe307
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: mjt@tls.msk.ru,
	laurent@vivier.eu
Cc: stefanha@redhat.com, baiyaowei@cmss.chinamobile.com, eblake@redhat.com,
	cota@braap.org, qemu-trivial@nongnu.org, armbru@redhat.com,
	qemu-devel@nongnu.org
Date: Wed,  4 Jul 2018 11:17:27 +0800
Message-Id: <1530674247-31200-1-git-send-email-baiyaowei@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
Subject: [Qemu-trivial] [PATCH v2] tracing: Use double-dash spelling for
 trace option
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
X-List-Received-Date: Wed, 04 Jul 2018 03:18:30 -0000

The '-trace' and '--trace' spellings are only both supported in qemu
binary, while for qemu-nbd or qemu-img only '--trace' spelling is
supported. So for the consistency of trace option invocation, we
should use double-dash spelling in our documentation.

This's also mentioned in
https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documentation
.

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/tracing.txt | 6 +++---
 trace/control.c        | 4 ++--
 trace/control.h        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
index 6f815ec..bc52f12 100644
--- a/docs/devel/tracing.txt
+++ b/docs/devel/tracing.txt
@@ -18,7 +18,7 @@ for debugging, profiling, and observing execution.
 
 3. Run the virtual machine to produce a trace file:
 
-    qemu -trace events=/tmp/events ... # your normal QEMU invocation
+    qemu --trace events=/tmp/events ... # your normal QEMU invocation
 
 4. Pretty-print the binary trace file:
 
@@ -157,11 +157,11 @@ The state of events can also be queried and modified through monitor commands:
 * trace-event NAME on|off
   Enable/disable a given trace event or a group of events (using wildcards).
 
-The "-trace events=<file>" command line argument can be used to enable the
+The "--trace events=<file>" command line argument can be used to enable the
 events listed in <file> from the very beginning of the program. This file must
 contain one event name per line.
 
-If a line in the "-trace events=<file>" file begins with a '-', the trace event
+If a line in the "--trace events=<file>" file begins with a '-', the trace event
 will be disabled instead of enabled.  This is useful when a wildcard was used
 to enable an entire family of events but one noisy event needs to be disabled.
 
diff --git a/trace/control.c b/trace/control.c
index e40cfca..43fb786 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -253,7 +253,7 @@ void trace_init_file(const char *file)
 #ifdef CONFIG_TRACE_SIMPLE
     st_set_trace_file(file);
 #elif defined CONFIG_TRACE_LOG
-    /* If both the simple and the log backends are enabled, "-trace file"
+    /* If both the simple and the log backends are enabled, "--trace file"
      * only applies to the simple backend; use "-D" for the log backend.
      */
     if (file) {
@@ -261,7 +261,7 @@ void trace_init_file(const char *file)
     }
 #else
     if (file) {
-        fprintf(stderr, "error: -trace file=...: "
+        fprintf(stderr, "error: --trace file=...: "
                 "option not supported by the selected tracing backends\n");
         exit(1);
     }
diff --git a/trace/control.h b/trace/control.h
index eb65c8e..0716f90 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -193,7 +193,7 @@ void trace_event_set_vcpu_state_dynamic(CPUState *vcpu,
 /**
  * trace_init_backends:
  * @file:   Name of trace output file; may be NULL.
- *          Corresponds to commandline option "-trace file=...".
+ *          Corresponds to commandline option "--trace file=...".
  *
  * Initialize the tracing backend.
  *
@@ -204,7 +204,7 @@ bool trace_init_backends(void);
 /**
  * trace_init_file:
  * @file:   Name of trace output file; may be NULL.
- *          Corresponds to commandline option "-trace file=...".
+ *          Corresponds to commandline option "--trace file=...".
  *
  * Record the name of the output file for the tracing backend.
  * Exits if no selected backend does not support specifying the
-- 
1.8.3.1





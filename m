Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBq9-0005ql-Sy
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpu-0005On-0m
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpr-0003Kv-Hp
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:09 -0400
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpr-0003Il-7m
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:07 -0400
Received: by wibud3 with SMTP id ud3so104918147wib.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=72/wPJNzxu4scsnUgHi1dFP6poEhvV6V+XH1if30AU4=;
	b=RU7qOLrJpYsnKiX0CqG00JbV3GXa65dEkN4LkC3dS6WS346ZDMBfRqItJV8HZ1Vksr
	l5wCgcDnsKpQQ+wynBb3el4QUyEYPYuhLGIxznTc9pCOqQviZZaoy012KkElwkNtpQMc
	PBl/V1Kze9znEcc6xCWeJJ4YhS/h0hnPRjsEb55/L6q/Dpv0CQwFeJjrUTs8UiiFCL1Z
	Cfn8c2+V+ZNSTTGNIffXbDWBlKncTFeIr/IjLfOQ6rxhX9kCDYCuCH3+K3E8l6TsJB2k
	wklWxaFHCgK6b5MqitBJe/qU+604+xv6OiJNpch4MDfpYhQlzHJlYxHjVcYWDTV9z/wp
	TkBw==
X-Gm-Message-State: ALoCoQmeDkxbzpvfWY5bnsg9BGSCMnWfE6/swq/Ozox/pLXmRlJI2xaIXQZsPVL2CL/IShFXFjjc
X-Received: by 10.194.59.237 with SMTP id c13mr34112062wjr.24.1438593306697;
	Mon, 03 Aug 2015 02:15:06 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	lj2sm12545730wic.1.2015.08.03.02.15.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id AFEAD3E085B;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:47 +0100
Message-Id: <1438593291-27109-8-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 07/11] qemu-log: new option -dfilter to
	limit output
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:13 -0000

When debugging big programs or system emulation sometimes you want both
the verbosity of cpu,exec et all but don't want to generate lots of logs
for unneeded stuff. This patch adds a new option -dfilter which allows
you to specify interesting address ranges in the form:

  -dfilter 0x8000-0x9000,0xffffffc000080000+0x200,...

Then logging code can use the new qemu_log_in_addr_range() function to
decide if it will output logging information for the given range.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

----

v2
  - More clean-ups to the documentation

v3
  - re-base
  - use GArray instead of GList to avoid cache bouncing
  - checkpatch fixes
---
 include/qemu/log.h |  2 ++
 qemu-log.c         | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx    | 16 +++++++++++++++
 vl.c               |  3 +++
 4 files changed, 78 insertions(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index b80f8f5..ade1f76 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -182,6 +182,8 @@ static inline void qemu_set_log(int log_flags)
 }
 
 void qemu_set_log_filename(const char *filename);
+void qemu_set_dfilter_ranges(const char *ranges);
+bool qemu_log_in_addr_range(uint64_t addr);
 int qemu_str_to_log_mask(const char *str);
 
 /* Print a usage message listing all the valid logging categories
diff --git a/qemu-log.c b/qemu-log.c
index 77ed7bc..b3ebd3c 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -19,11 +19,13 @@
 
 #include "qemu-common.h"
 #include "qemu/log.h"
+#include "qemu/range.h"
 
 static char *logfilename;
 FILE *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
+static GArray *debug_regions;
 
 void qemu_log(const char *fmt, ...)
 {
@@ -92,6 +94,61 @@ void qemu_set_log_filename(const char *filename)
     qemu_set_log(qemu_loglevel);
 }
 
+/* Returns true if addr is in our debug filter or no filter defined
+ */
+bool qemu_log_in_addr_range(uint64_t addr)
+{
+    if (debug_regions) {
+        int i = 0;
+        for (i = 0; i < debug_regions->len; i++) {
+            struct Range *range = &g_array_index(debug_regions, Range, i);
+            if (addr >= range->begin && addr <= range->end) {
+                return true;
+            }
+        }
+        return false;
+    } else {
+        return true;
+    }
+}
+
+
+void qemu_set_dfilter_ranges(const char *filter_spec)
+{
+    gchar **ranges = g_strsplit(filter_spec, ",", 0);
+    if (ranges) {
+        gchar **next = ranges;
+        gchar *r = *next++;
+        debug_regions = g_array_sized_new(FALSE, FALSE,
+                                          sizeof(Range), g_strv_length(ranges));
+        while (r) {
+            gchar *delim = g_strrstr(r, "-");
+            if (!delim) {
+                delim = g_strrstr(r, "+");
+            }
+            if (delim) {
+                struct Range range;
+                range.begin = strtoul(r, NULL, 0);
+                switch (*delim) {
+                case '+':
+                    range.end = range.begin + strtoul(delim+1, NULL, 0);
+                    break;
+                case '-':
+                    range.end = strtoul(delim+1, NULL, 0);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
+                g_array_append_val(debug_regions, range);
+            } else {
+                g_error("Bad range specifier in: %s", r);
+            }
+            r = *next++;
+        }
+        g_strfreev(ranges);
+    }
+}
+
 const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_TB_OUT_ASM, "out_asm",
       "show generated host assembly code for each compiled TB" },
diff --git a/qemu-options.hx b/qemu-options.hx
index ae53346..90f0df9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2987,6 +2987,22 @@ STEXI
 Output log in @var{logfile} instead of to stderr
 ETEXI
 
+DEF("dfilter", HAS_ARG, QEMU_OPTION_DFILTER, \
+    "-dfilter range,..  filter debug output to range of addresses (useful for -d cpu,exec,etc..)\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -dfilter @var{range1}[,...]
+@findex -dfilter
+Filter debug output to that relevant to a range of target addresses. The filter
+spec can be either @var{start}-@var{end} or @var{start}+@var{size} where @var{start}
+@var{end} and @var{size} are the addresses and sizes required. For example:
+@example
+    -dfilter 0x8000-0x9000,0xffffffc000080000+0x200
+@end example
+Will dump output for any code in the 0x1000 sized block starting at 0x8000 and
+the 0x200 sized block starting at 0xffffffc000080000.
+ETEXI
+
 DEF("L", HAS_ARG, QEMU_OPTION_L, \
     "-L path         set the directory for the BIOS, VGA BIOS and keymaps\n",
     QEMU_ARCH_ALL)
diff --git a/vl.c b/vl.c
index 1d2de4f..05211cf 100644
--- a/vl.c
+++ b/vl.c
@@ -3349,6 +3349,9 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_D:
                 log_file = optarg;
                 break;
+            case QEMU_OPTION_DFILTER:
+                qemu_set_dfilter_ranges(optarg);
+                break;
             case QEMU_OPTION_PERFMAP:
                 tb_enable_perfmap();
                 break;
-- 
2.5.0



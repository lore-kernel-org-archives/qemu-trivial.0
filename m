Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteg-0004M4-IH
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteb-0004FE-3j
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteV-0007pL-E4
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdt-0007Fg-8y; Fri, 16 Sep 2016 09:57:51 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05A7D9D0C1;
	Fri, 16 Sep 2016 13:57:09 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkQ024127; Fri, 16 Sep 2016 09:57:07 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 16 Sep 2016 15:56:15 +0200
Message-Id: <1474034177-17663-25-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 16 Sep 2016 13:57:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 24/26] error,
 trace: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:14 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
---
 trace/control.c | 10 +++++-----
 util/error.c    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/trace/control.c b/trace/control.c
index 05d85ac..b09d6f1 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -165,7 +165,7 @@ void trace_enable_events(const char *line_buf)
     if (is_help_option(line_buf)) {
         trace_list_events();
         if (cur_mon == NULL) {
-            exit(0);
+            exit(EXIT_SUCCESS);
         }
     } else {
         do_trace_enable_events(line_buf);
@@ -188,7 +188,7 @@ static void trace_init_events(const char *fname)
     fp = fopen(fname, "r");
     if (!fp) {
         error_report("%s", strerror(errno));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     while (fgets(line_buf, sizeof(line_buf), fp)) {
         loc_set_file(fname, ++line_idx);
@@ -204,7 +204,7 @@ static void trace_init_events(const char *fname)
     if (fclose(fp) != 0) {
         loc_set_file(fname, 0);
         error_report("%s", strerror(errno));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     loc_pop(&loc);
 }
@@ -224,7 +224,7 @@ void trace_init_file(const char *file)
     if (file) {
         fprintf(stderr, "error: -trace file=...: "
                 "option not supported by the selected tracing backends\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #endif
 }
@@ -258,7 +258,7 @@ char *trace_opt_parse(const char *optarg)
     QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
                                              optarg, true);
     if (!opts) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (qemu_opt_get(opts, "enable")) {
         trace_enable_events(qemu_opt_get(opts, "enable"));
diff --git a/util/error.c b/util/error.c
index 9c40b1f..89b6e25 100644
--- a/util/error.c
+++ b/util/error.c
@@ -39,7 +39,7 @@ static void error_handle_fatal(Error **errp, Error *err)
     }
     if (errp == &error_fatal) {
         error_report_err(err);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
-- 
2.5.5



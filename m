Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktes-0004Vt-7j
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktel-0004P3-IF
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteg-000826-B8
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteY-0007ub-IB; Fri, 16 Sep 2016 09:58:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E94B61979;
	Fri, 16 Sep 2016 13:56:28 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk6024127; Fri, 16 Sep 2016 09:56:26 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Date: Fri, 16 Sep 2016 15:55:55 +0200
Message-Id: <1474034177-17663-5-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Sep 2016 13:56:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 04/26] block: use exit(EXIT_SUCCESS) and
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:25 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
---
 hw/block/pflash_cfi01.c |  2 +-
 hw/block/tc58128.c      |  2 +-
 qemu-img.c              |  4 ++--
 qemu-io.c               | 24 ++++++++++++------------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 62d7a56..f6a7909 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -52,7 +52,7 @@
 #define PFLASH_BUG(fmt, ...) \
 do { \
     fprintf(stderr, "PFLASH: Possible BUG - " fmt, ## __VA_ARGS__); \
-    exit(1); \
+    exit(EXIT_FAILURE); \
 } while(0)
 
 /* #define PFLASH_DEBUG */
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 1d9f7ee..8d7b489 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -41,7 +41,7 @@ static void init_dev(tc58128_dev * dev, const char *filename)
 	if (ret < 0) {
             if (!qtest_enabled()) {
                 error_report("Could not load flash image %s", filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 	} else {
 	    /* Build first block with number of blocks */
diff --git a/qemu-img.c b/qemu-img.c
index ea52486..ed90a21 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2418,7 +2418,7 @@ static void dump_map_entry(OutputFormat output_format, MapEntry *e,
     case OFORMAT_HUMAN:
         if (e->data && !e->has_offset) {
             error_report("File contains external, encrypted or compressed clusters.");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (e->data && !e->zero) {
             printf("%#-16"PRIx64"%#-16"PRIx64"%#-16"PRIx64"%s\n",
@@ -3870,7 +3870,7 @@ int main(int argc, char **argv)
     optind = 0;
 
     if (!trace_init_backends()) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     trace_init_file(trace_file);
     qemu_set_log(LOG_TRACE);
diff --git a/qemu-io.c b/qemu-io.c
index db129ea..5b08adf 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -489,7 +489,7 @@ int main(int argc, char **argv)
         case 'd':
             if (bdrv_parse_discard_flags(optarg, &flags) < 0) {
                 error_report("Invalid discard option: %s", optarg);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             break;
         case 'f':
@@ -510,7 +510,7 @@ int main(int argc, char **argv)
         case 't':
             if (bdrv_parse_cache_mode(optarg, &flags, &writethrough) < 0) {
                 error_report("Invalid cache option: %s", optarg);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             break;
         case 'T':
@@ -519,16 +519,16 @@ int main(int argc, char **argv)
             break;
         case 'V':
             printf("%s version %s\n", progname, QEMU_VERSION);
-            exit(0);
+            exit(EXIT_SUCCESS);
         case 'h':
             usage(progname);
-            exit(0);
+            exit(EXIT_SUCCESS);
         case OPTION_OBJECT: {
             QemuOpts *qopts;
             qopts = qemu_opts_parse_noisily(&qemu_object_opts,
                                             optarg, true);
             if (!qopts) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }   break;
         case OPTION_IMAGE_OPTS:
@@ -536,33 +536,33 @@ int main(int argc, char **argv)
             break;
         default:
             usage(progname);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
     if ((argc - optind) > 1) {
         usage(progname);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (format && imageOpts) {
         error_report("--image-opts and -f are mutually exclusive");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_init_main_loop(&local_error)) {
         error_report_err(local_error);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (qemu_opts_foreach(&qemu_object_opts,
                           user_creatable_add_opts_foreach,
                           NULL, NULL)) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (!trace_init_backends()) {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     trace_init_file(trace_file);
     qemu_set_log(LOG_TRACE);
@@ -591,7 +591,7 @@ int main(int argc, char **argv)
             QemuOpts *qopts = NULL;
             qopts = qemu_opts_parse_noisily(&file_opts, argv[optind], false);
             if (!qopts) {
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             opts = qemu_opts_to_qdict(qopts, NULL);
             openfile(NULL, flags, writethrough, opts);
-- 
2.5.5



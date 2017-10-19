Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5A7e-0000iR-RH
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 08:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lu.zhipeng@zte.com.cn>) id 1e58ot-0006Uh-LQ
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lu.zhipeng@zte.com.cn>) id 1e58op-0002rH-2Y
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:16:59 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:41014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lu.zhipeng@zte.com.cn>)
	id 1e58oo-0002oe-Ms
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 07:16:54 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 7C582DAAA5C2AB596D36;
	Thu, 19 Oct 2017 19:16:47 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id v9JBGcZF012596;
	Thu, 19 Oct 2017 19:16:38 +0800 (GMT-8)
	(envelope-from lu.zhipeng@zte.com.cn)
Received: from ceshi.localdomain ([10.74.120.130])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2017101919164409-1061551 ;
	Thu, 19 Oct 2017 19:16:44 +0800 
From: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
To: dgilbert@redhat.com
Cc: qemu-trivial@nongnu.org, ZhiPeng Lu <lu.zhipeng@zte.com.cn>
Date: Thu, 19 Oct 2017 19:16:33 +0800
Message-Id: <1508411793-22868-1-git-send-email-lu.zhipeng@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2017-10-19 19:16:44,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2017-10-19 19:16:27,
	Serialize complete at 2017-10-19 19:16:27
X-MAIL: mse01.zte.com.cn v9JBGcZF012596
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
X-Mailman-Approved-At: Thu, 19 Oct 2017 08:40:26 -0400
Subject: [Qemu-trivial] [PATCH] hmp: Replace error_report_err
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
X-List-Received-Date: Thu, 19 Oct 2017 11:17:00 -0000

Use hmp_handle_error instend of error_report_err to set error.

Signed-off-by: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
Reviewed-by: Jiyun Fan <fan.jiyun@zte.com.cn>
---
 hmp.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/hmp.c b/hmp.c
index ec61329..a03bd03 100644
--- a/hmp.c
+++ b/hmp.c
@@ -667,7 +667,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
 
     info2l = qmp_query_vnc_servers(&err);
     if (err) {
-        error_report_err(err);
+        hmp_handle_error(mon, &err);
         return;
     }
     if (!info2l) {
@@ -782,7 +782,7 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
 
     info = qmp_query_balloon(&err);
     if (err) {
-        error_report_err(err);
+        hmp_handle_error(mon, &err);
         return;
     }
 
@@ -1125,7 +1125,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
 
     data = qmp_ringbuf_read(chardev, size, false, 0, &err);
     if (err) {
-        error_report_err(err);
+        hmp_handle_error(mon, &err);
         return;
     }
 
@@ -1192,9 +1192,7 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     qmp_balloon(value, &err);
-    if (err) {
-        error_report_err(err);
-    }
+    hmp_handle_error(mon, &err);
 }
 
 void hmp_block_resize(Monitor *mon, const QDict *qdict)
@@ -1518,10 +1516,7 @@ void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
     qmp_migrate_set_cache_size(value, &err);
-    if (err) {
-        error_report_err(err);
-        return;
-    }
+    hmp_handle_error(mon, &err);
 }
 
 /* Kept for backwards compatibility */
@@ -1552,10 +1547,7 @@ void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
 
 end:
     qapi_free_MigrationCapabilityStatusList(caps);
-
-    if (err) {
-        error_report_err(err);
-    }
+    hmp_handle_error(mon, &err);
 }
 
 void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
@@ -1653,9 +1645,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
  cleanup:
     qapi_free_MigrateSetParameters(p);
     visit_free(v);
-    if (err) {
-        error_report_err(err);
-    }
+    hmp_handle_error(mon, &err);
 }
 
 void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
@@ -1909,7 +1899,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
 
     qmp_migrate(uri, !!blk, blk, !!inc, inc, false, false, &err);
     if (err) {
-        error_report_err(err);
+        hmp_handle_error(mon, &err);
         return;
     }
 
-- 
1.8.3.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Gw-0007wB-43
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:42:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gq-0007ku-3L
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gl-0007Dn-W1
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4Gd-0007Bo-Im; Wed, 03 Sep 2014 02:42:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0ADD940769;
	Wed,  3 Sep 2014 10:42:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C36F36E9;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1618 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:33 +0400
Message-Id: <1409726135-1547-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/10] qom/object.c,
	hmp.c: fix string_output_get_string() memory leak
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
X-List-Received-Date: Wed, 03 Sep 2014 06:42:24 -0000

From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>

string_output_get_string() uses g_string_free(str, false) to
transfer the 'str' pointer to callers and never free it.

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hmp.c        |    6 ++++--
 qom/object.c |   12 ++++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hmp.c b/hmp.c
index 4d1838e..ba40c75 100644
--- a/hmp.c
+++ b/hmp.c
@@ -1687,6 +1687,7 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
     MemdevList *memdev_list = qmp_query_memdev(&err);
     MemdevList *m = memdev_list;
     StringOutputVisitor *ov;
+    char *str;
     int i = 0;
 
 
@@ -1704,9 +1705,10 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->prealloc ? "true" : "false");
         monitor_printf(mon, "  policy: %s\n",
                        HostMemPolicy_lookup[m->value->policy]);
-        monitor_printf(mon, "  host nodes: %s\n",
-                       string_output_get_string(ov));
+        str = string_output_get_string(ov);
+        monitor_printf(mon, "  host nodes: %s\n", str);
 
+        g_free(str);
         string_output_visitor_cleanup(ov);
         m = m->next;
         i++;
diff --git a/qom/object.c b/qom/object.c
index 1b00831..79bd0cc 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -938,14 +938,18 @@ int object_property_get_enum(Object *obj, const char *name,
 {
     StringOutputVisitor *sov;
     StringInputVisitor *siv;
+    char *str;
     int ret;
 
     sov = string_output_visitor_new(false);
     object_property_get(obj, string_output_get_visitor(sov), name, errp);
-    siv = string_input_visitor_new(string_output_get_string(sov));
+    str = string_output_get_string(sov);
+    siv = string_input_visitor_new(str);
     string_output_visitor_cleanup(sov);
     visit_type_enum(string_input_get_visitor(siv),
                     &ret, strings, NULL, name, errp);
+
+    g_free(str);
     string_input_visitor_cleanup(siv);
 
     return ret;
@@ -956,13 +960,17 @@ void object_property_get_uint16List(Object *obj, const char *name,
 {
     StringOutputVisitor *ov;
     StringInputVisitor *iv;
+    char *str;
 
     ov = string_output_visitor_new(false);
     object_property_get(obj, string_output_get_visitor(ov),
                         name, errp);
-    iv = string_input_visitor_new(string_output_get_string(ov));
+    str = string_output_get_string(ov);
+    iv = string_input_visitor_new(str);
     visit_type_uint16List(string_input_get_visitor(iv),
                           list, NULL, errp);
+
+    g_free(str);
     string_output_visitor_cleanup(ov);
     string_input_visitor_cleanup(iv);
 }
-- 
1.7.10.4



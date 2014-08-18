Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJN9H-0007S9-K1
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 09:38:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmd-0002Lf-N5
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XJGmZ-0001Vt-DJ
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 02:51:11 -0400
Received: from [59.151.112.132] (port=32573 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XJGmQ-0001Me-0S; Mon, 18 Aug 2014 02:50:58 -0400
X-IronPort-AV: E=Sophos;i="5.04,348,1406563200"; d="scan'208";a="34726262"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2014 14:48:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7I6orI8031646;
	Mon, 18 Aug 2014 14:50:53 +0800
Received: from G08FNSTD131468.fnst.cn.fujitsu.com (10.167.226.78) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 18 Aug 2014 14:50:58 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Date: Mon, 18 Aug 2014 14:46:34 +0800
Message-ID: <2db58f5c8a767ef2d263042d49ae43f6bc8c09b4.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
References: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Mon, 18 Aug 2014 09:38:58 -0400
Subject: [Qemu-trivial] [RESEND v2 2/3] qom/object.c: fix
	string_output_get_string() memory leak
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
X-List-Received-Date: Mon, 18 Aug 2014 06:51:16 -0000

string_output_get_string() uses g_string_free(str, false) to
transfer the 'str' pointer to callers and never free it.

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>

---
 hmp.c        |  6 ++++--
 qom/object.c | 12 ++++++++++--
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
index 0e8267b..e5aed60 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -948,14 +948,18 @@ int object_property_get_enum(Object *obj, const char *name,
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
@@ -966,13 +970,17 @@ void object_property_get_uint16List(Object *obj, const char *name,
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
1.9.3



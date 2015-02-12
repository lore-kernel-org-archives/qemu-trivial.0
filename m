Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLj2K-0002Lo-8d
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 20:57:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLj2I-0002Li-PV
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLj2E-0008D8-Pf
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 20:57:46 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:23437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLj2E-0008D2-7j; Wed, 11 Feb 2015 20:57:42 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHE52735; Thu, 12 Feb 2015 09:57:35 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Feb 2015 09:57:28 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 12 Feb 2015 09:57:20 +0800
Message-ID: <1423706240-10844-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Markus Armbruster <armbru@redhat.com>, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH v2] monitor: Fix missing err = NULL in
	client_migrate_info()
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
X-List-Received-Date: Thu, 12 Feb 2015 01:57:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

When SPICE isn't used, we either fail an assertion in error_set(),
or leak an error object.  Broken in commit b25d81b.

Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
v2: 
 - rework patch's title and commit message (Markus)
 - add R-by tag
---
 monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index c3cc060..137d23f 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1095,12 +1095,13 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
     const char *subject  = qdict_get_try_str(qdict, "cert-subject");
     int port             = qdict_get_try_int(qdict, "port", -1);
     int tls_port         = qdict_get_try_int(qdict, "tls-port", -1);
-    Error *err;
+    Error *err = NULL;
     int ret;
 
     if (strcmp(protocol, "spice") == 0) {
         if (!qemu_using_spice(&err)) {
             qerror_report_err(err);
+            error_free(err);
             return -1;
         }
 
-- 
1.7.12.4




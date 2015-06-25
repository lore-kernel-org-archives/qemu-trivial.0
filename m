Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z80ai-000747-Kg
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 02:24:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z80ag-00071Q-IJ
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:24:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z80af-0002cb-KE
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 02:24:50 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:25632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z80aX-0002Ux-HW; Thu, 25 Jun 2015 02:24:43 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CQA74011; Thu, 25 Jun 2015 14:24:28 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Jun 2015 14:24:21 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Jun 2015 14:24:10 +0800
Message-ID: <1435213450-6700-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, jiri@resnulli.us,
	Gonglei <arei.gonglei@huawei.com>, sfeldma@gmail.com
Subject: [Qemu-trivial] [PATCH] rocker: fix memory leak
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
X-List-Received-Date: Thu, 25 Jun 2015 06:24:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Meanwhile, using g_new0 instead of g_malloc0,
refer to commit 5839e53.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/net/rocker/rocker.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 4d25842..7e06015 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -96,7 +96,7 @@ World *rocker_get_world(Rocker *r, enum rocker_world_type type)
 
 RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
 {
-    RockerSwitch *rocker = g_malloc0(sizeof(*rocker));
+    RockerSwitch *rocker;
     Rocker *r;
 
     r = rocker_find(name);
@@ -106,6 +106,7 @@ RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
         return NULL;
     }
 
+    rocker = g_new0(RockerSwitch, 1);
     rocker->name = g_strdup(r->name);
     rocker->id = r->switch_id;
     rocker->ports = r->fp_ports;
-- 
1.7.12.4




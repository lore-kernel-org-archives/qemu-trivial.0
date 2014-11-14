Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xp7Xk-0006kh-DO
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 22:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp7Xd-0006jL-Pb
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 22:27:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xp7XY-0006NN-Vp
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 22:27:21 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:55994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xp7XY-0006Mo-CF; Thu, 13 Nov 2014 22:27:16 -0500
Received: from 172.24.2.119 (EHLO szxeml404-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCI38396; Fri, 14 Nov 2014 11:27:08 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml404-hub.china.huawei.com
	(10.82.67.59) with Microsoft SMTP Server id 14.3.158.1; Fri, 14 Nov 2014
	11:26:57 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Fri, 14 Nov 2014 11:25:28 +0800
Message-ID: <1415935528-11792-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	kraxel@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] gtk: fix possible memory leak about local_err
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
X-List-Received-Date: Fri, 14 Nov 2014 03:27:27 -0000

local_err in gd_vc_gfx_init() is not freed, and we don't use it,
so remove it.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 ui/gtk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 38bf463..9496b8d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1666,10 +1666,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                               QemuConsole *con, int idx,
                               GSList *group, GtkWidget *view_menu)
 {
-    Error *local_err = NULL;
     Object *obj;
 
-    obj = object_property_get_link(OBJECT(con), "device", &local_err);
+    obj = object_property_get_link(OBJECT(con), "device", NULL);
     if (obj) {
         vc->label = g_strdup_printf("%s", object_get_typename(obj));
     } else {
-- 
1.7.12.4




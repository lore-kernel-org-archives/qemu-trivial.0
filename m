Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHhb-0003iM-1q
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 03:50:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHhV-0003cB-Od
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHhR-0007UD-Di
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:49:57 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:34154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJHhH-0007SV-TJ; Mon, 18 Aug 2014 03:49:44 -0400
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATF23592; Mon, 18 Aug 2014 15:49:36 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 15:49:28 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Aug 2014 15:49:22 +0800
Message-ID: <1408348162-10020-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.53F1B012.0074,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: c8d4e025f7f60934c5b2d27ace01bc46
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, luonengjun@huawei.com,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v7] util/path: Use the GLib memory allocation
	routines
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
X-List-Received-Date: Mon, 18 Aug 2014 07:50:02 -0000

In this file, we don't check the return value of malloc/strdup/realloc which may fail.
Instead of using these routines, we use the GLib memory APIs g_malloc/g_strdup/g_realloc.
They will exit on allocation failure, so there is no need to test for failure,
which would be fine for setup.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/path.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/path.c b/util/path.c
index 5c59d9f..4e4877e 100644
--- a/util/path.c
+++ b/util/path.c
@@ -45,8 +45,8 @@ static struct pathelem *new_entry(const char *root,
                                   struct pathelem *parent,
                                   const char *name)
 {
-    struct pathelem *new = malloc(sizeof(*new));
-    new->name = strdup(name);
+    struct pathelem *new = g_malloc(sizeof(*new));
+    new->name = g_strdup(name);
     new->pathname = g_strdup_printf("%s/%s", root, name);
     new->num_entries = 0;
     return new;
@@ -88,7 +88,7 @@ static struct pathelem *add_entry(struct pathelem *root, const char *name,
 
     root->num_entries++;
 
-    root = realloc(root, sizeof(*root)
+    root = g_realloc(root, sizeof(*root)
                    + sizeof(root->entries[0])*root->num_entries);
     e = &root->entries[root->num_entries-1];
 
@@ -161,8 +161,8 @@ void init_paths(const char *prefix)
     base = add_dir_maybe(base);
     if (base->num_entries == 0) {
         g_free(base->pathname);
-        free(base->name);
-        free(base);
+        g_free(base->name);
+        g_free(base);
         base = NULL;
     } else {
         set_parents(base, base);
-- 
1.7.12.4




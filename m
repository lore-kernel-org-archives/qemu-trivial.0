Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv30-000226-NE
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWI-0005Gt-IE
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWE-0006NW-98
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:22 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpW2-0006JI-K2; Thu, 14 Aug 2014 03:32:08 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11821; Thu, 14 Aug 2014 15:30:56 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:56 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:16 +0800
Message-ID: <1408001361-13580-6-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 05/10] util/path: Use the GLib memory
	allocation routines
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
X-List-Received-Date: Thu, 14 Aug 2014 07:32:27 -0000

In this file, we don't check the return value of malloc/strdup/realloc which may fail.
Instead of using these routines, we use the GLib memory APIs g_malloc/g_strdup/g_realloc.
They will exit on allocation failure, so there is no need to test for failure,
which would be fine for setup.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/path.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/path.c b/util/path.c
index 5c59d9f..e152f2a 100644
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
 
-- 
1.7.12.4




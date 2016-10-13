Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buZyM-0000NU-3O
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 02:58:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1buZyJ-0000NN-UH
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 02:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1buZyF-0003rg-1a
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 02:58:30 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:62141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1buZyA-0003el-H4; Thu, 13 Oct 2016 02:58:26 -0400
Received: from 172.24.1.136 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CJH24986; Thu, 13 Oct 2016 14:57:48 +0800 (CST)
Received: from localhost (10.177.24.212) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Oct 2016 14:57:37 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
CC: <zhangchen.fnst@cn.fujitsu.com>, <jasowang@redhat.com>, <mjt@tls.msk.ru>, 
	<qemu-devel@nongnu.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>
Date: Thu, 13 Oct 2016 14:57:28 +0800
Message-ID: <1476341848-1940-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-trivial] [PATCH] colo-compare: remove unused struct
 CompareChardevProps and 'props' variable
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
X-List-Received-Date: Thu, 13 Oct 2016 06:58:32 -0000

After commit 0a73336d, 'props' variable in find_and_check_chardev()
is unused. Remove it, togther with struct CompareChardevProps.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 net/colo-compare.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 47703c5..4be6fc3 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -92,10 +92,6 @@ typedef struct CompareClass {
     ObjectClass parent_class;
 } CompareClass;
 
-typedef struct CompareChardevProps {
-    bool is_socket;
-} CompareChardevProps;
-
 enum {
     PRIMARY_IN = 0,
     SECONDARY_IN,
@@ -573,8 +569,6 @@ static int find_and_check_chardev(CharDriverState **chr,
                                   char *chr_name,
                                   Error **errp)
 {
-    CompareChardevProps props;
-
     *chr = qemu_chr_find(chr_name);
     if (*chr == NULL) {
         error_setg(errp, "Device '%s' not found",
@@ -582,8 +576,6 @@ static int find_and_check_chardev(CharDriverState **chr,
         return 1;
     }
 
-    memset(&props, 0, sizeof(props));
-
     if (!qemu_chr_has_feature(*chr, QEMU_CHAR_FEATURE_RECONNECTABLE)) {
         error_setg(errp, "chardev \"%s\" is not reconnectable",
                    chr_name);
-- 
1.8.3.1




Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7J56-0006zy-S8
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7J54-0006zh-FW
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7J50-0004EN-Ch
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:57:18 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:24771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7J4z-0004E6-LT; Tue, 23 Jun 2015 03:57:14 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV98997; Tue, 23 Jun 2015 15:56:55 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 15:56:40 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 15:56:38 +0800
Message-ID: <1435046198-10200-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: quintela@redhat.com, qemu-trivial@nongnu.org, armbru@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, mrhines@us.ibm.com,
	amit.shah@redhat.com, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH v2] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 07:57:19 -0000

From: Gonglei <arei.gonglei@huawei.com>

Variable "r" going out of scope leaks the storage
it points to in line 3268.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Amit Shah <amit.shah@redhat.com>
---
 v2:
  - Drop needless initialization. (Markus & Paolo)
  - add Amit's R-by.
---
 migration/rdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index cf5de7e..b5f9f82 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
 
 static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
 {
-    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
+    QEMUFileRDMA *r;
 
     if (qemu_file_mode_is_not_valid(mode)) {
         return NULL;
     }
 
+    r = g_malloc0(sizeof(QEMUFileRDMA));
     r->rdma = rdma;
 
     if (mode[0] == 'w') {
-- 
1.7.12.4




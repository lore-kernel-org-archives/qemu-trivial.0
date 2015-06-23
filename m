Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7CcA-0002Ql-Ka
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:03:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7Cc8-0002OB-8I
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7Cc7-0001vh-76
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:03:00 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:58788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7Cc2-0001oY-I7; Mon, 22 Jun 2015 21:02:55 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BIA92605; Tue, 23 Jun 2015 09:02:40 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:02:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 09:02:28 +0800
Message-ID: <1435021348-9156-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5588B031.012A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 407a82a950f78d7c125c3e07a6754827
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, mrhines@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [PATCH] rdma: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 01:03:01 -0000

From: Gonglei <arei.gonglei@huawei.com>

Variable "r" going out of scope leaks the storage
it points to in line 3268.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 migration/rdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index cf5de7e..de80860 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3262,12 +3262,13 @@ static const QEMUFileOps rdma_write_ops = {
 
 static void *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
 {
-    QEMUFileRDMA *r = g_malloc0(sizeof(QEMUFileRDMA));
+    QEMUFileRDMA *r = NULL;
 
     if (qemu_file_mode_is_not_valid(mode)) {
         return NULL;
     }
 
+    r = g_malloc0(sizeof(QEMUFileRDMA));
     r->rdma = rdma;
 
     if (mode[0] == 'w') {
-- 
1.7.12.4




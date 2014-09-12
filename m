Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XSJxg-00018L-HS
	for mharc-qemu-trivial@gnu.org; Fri, 12 Sep 2014 02:04:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XSJxa-000109-Cl
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 02:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XSJxV-0004ma-J8
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 02:03:54 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:6842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XSJxL-0004jd-7c; Fri, 12 Sep 2014 02:03:39 -0400
Received: from 172.24.2.119 (EHLO szxeml461-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBO64427; Fri, 12 Sep 2014 14:03:29 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml461-hub.china.huawei.com
	(10.82.67.204) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 12 Sep 2014 14:03:19 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Fri, 12 Sep 2014 14:03:14 +0800
Message-ID: <1410501794-13624-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, luonengjun@huawei.com,
	qemu-devel@nongnu.org, mrhines@linux.vnet.ibm.com,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 2/2] rdma: Fix incorrect description in
	comments
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
X-List-Received-Date: Fri, 12 Sep 2014 06:03:59 -0000

Since we have supported memory hotplug, VM's ram include pc.ram
and hotplug-memory.

Fix the confused description for rdma migration: pc.ram -> VM's ram

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 docs/rdma.txt    | 6 +++---
 migration-rdma.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/rdma.txt b/docs/rdma.txt
index 1f5d9e9..2bdd0a5 100644
--- a/docs/rdma.txt
+++ b/docs/rdma.txt
@@ -18,7 +18,7 @@ Contents:
 * RDMA Migration Protocol Description
 * Versioning and Capabilities
 * QEMUFileRDMA Interface
-* Migration of pc.ram
+* Migration of VM's ram
 * Error handling
 * TODO
 
@@ -149,7 +149,7 @@ The only difference between a SEND message and an RDMA
 message is that SEND messages cause notifications
 to be posted to the completion queue (CQ) on the
 infiniband receiver side, whereas RDMA messages (used
-for pc.ram) do not (to behave like an actual DMA).
+for VM's ram) do not (to behave like an actual DMA).
 
 Messages in infiniband require two things:
 
@@ -355,7 +355,7 @@ If the buffer is empty, then we follow the same steps
 listed above and issue another "QEMU File" protocol command,
 asking for a new SEND message to re-fill the buffer.
 
-Migration of pc.ram:
+Migration of VM's ram:
 ====================
 
 At the beginning of the migration, (migration-rdma.c),
diff --git a/migration-rdma.c b/migration-rdma.c
index d99812c..b32dbdf 100644
--- a/migration-rdma.c
+++ b/migration-rdma.c
@@ -2523,7 +2523,7 @@ static void *qemu_rdma_data_init(const char *host_port, Error **errp)
 /*
  * QEMUFile interface to the control channel.
  * SEND messages for control only.
- * pc.ram is handled with regular RDMA messages.
+ * VM's ram is handled with regular RDMA messages.
  */
 static int qemu_rdma_put_buffer(void *opaque, const uint8_t *buf,
                                 int64_t pos, int size)
@@ -2539,7 +2539,7 @@ static int qemu_rdma_put_buffer(void *opaque, const uint8_t *buf,
 
     /*
      * Push out any writes that
-     * we're queued up for pc.ram.
+     * we're queued up for VM's ram.
      */
     ret = qemu_rdma_write_flush(f, rdma);
     if (ret < 0) {
-- 
1.7.12.4




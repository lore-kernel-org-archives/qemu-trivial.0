Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqR-0003YM-NE
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqK-0003JV-7V
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqF-0000d9-O7
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVyq4-0000VU-B5; Mon, 22 Sep 2014 04:19:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8843445D11;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 217F26D9;
	Mon, 22 Sep 2014 12:11:19 +0400 (MSK)
Received: (nullmailer pid 16992 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:11 +0400
Message-Id: <1411373477-16938-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 3/9] rdma: Fix incorrect description in
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
X-List-Received-Date: Mon, 22 Sep 2014 08:19:36 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Since we have supported memory hotplug, VM's ram include pc.ram
and hotplug-memory.

Fix the confused description for rdma migration: pc.ram -> VM's ram

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/rdma.txt    |    6 +++---
 migration-rdma.c |    4 ++--
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
1.7.10.4



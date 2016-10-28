Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09Ve-0003Af-Rq
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09Va-00035l-Dt
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VZ-0003PK-Bw
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VR-0003Iu-Ej; Fri, 28 Oct 2016 11:55:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CCC7E4374D;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1B432B49;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6062 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:40 +0300
Message-Id: <f96fe6b5c27b9a66dba71044af0716f3d3e5601f.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/23] hw/block/nvme: Simplify if-statements a
 little bit
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:57 -0000

From: Thomas Huth <thuth@redhat.com>

The condition  '!A || (A && B)' is equivalent to '!A || B'.

Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b380142..d479fd2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -375,7 +375,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
     if (!cqid || nvme_check_cqid(n, cqid)) {
         return NVME_INVALID_CQID | NVME_DNR;
     }
-    if (!sqid || (sqid && !nvme_check_sqid(n, sqid))) {
+    if (!sqid || !nvme_check_sqid(n, sqid)) {
         return NVME_INVALID_QID | NVME_DNR;
     }
     if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {
@@ -449,7 +449,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
     uint16_t qflags = le16_to_cpu(c->cq_flags);
     uint64_t prp1 = le64_to_cpu(c->prp1);
 
-    if (!cqid || (cqid && !nvme_check_cqid(n, cqid))) {
+    if (!cqid || !nvme_check_cqid(n, cqid)) {
         return NVME_INVALID_CQID | NVME_DNR;
     }
     if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {
-- 
2.1.4



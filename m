Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buLJ6-0004ys-1j
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 11:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buLIz-0004w1-0W
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buLIw-0003Sk-Un
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 11:18:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1buLIp-0003Pq-K4; Wed, 12 Oct 2016 11:18:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B0AF335F6A;
	Wed, 12 Oct 2016 15:18:43 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9CFIeb7009263; Wed, 12 Oct 2016 11:18:41 -0400
From: Thomas Huth <thuth@redhat.com>
To: Keith Busch <keith.busch@intel.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 12 Oct 2016 17:18:40 +0200
Message-Id: <1476285520-1985-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 12 Oct 2016 15:18:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/block/nvme: Simplify if-statements a
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
X-List-Received-Date: Wed, 12 Oct 2016 15:18:59 -0000

The condition  '!A || (A && B)' is equivalent to '!A || B'.

Buglink: https://bugs.launchpad.net/qemu/+bug/1464611
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cef3bb4..53d9d2e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -373,7 +373,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
     if (!cqid || nvme_check_cqid(n, cqid)) {
         return NVME_INVALID_CQID | NVME_DNR;
     }
-    if (!sqid || (sqid && !nvme_check_sqid(n, sqid))) {
+    if (!sqid || !nvme_check_sqid(n, sqid)) {
         return NVME_INVALID_QID | NVME_DNR;
     }
     if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {
@@ -447,7 +447,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
     uint16_t qflags = le16_to_cpu(c->cq_flags);
     uint64_t prp1 = le64_to_cpu(c->prp1);
 
-    if (!cqid || (cqid && !nvme_check_cqid(n, cqid))) {
+    if (!cqid || !nvme_check_cqid(n, cqid)) {
         return NVME_INVALID_CQID | NVME_DNR;
     }
     if (!qsize || qsize > NVME_CAP_MQES(n->bar.cap)) {
-- 
1.8.3.1



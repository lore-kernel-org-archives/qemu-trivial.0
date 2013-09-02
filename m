Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGRtj-0001aI-Q4
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtd-0001No-D4
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtY-0005Qd-Hb
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGRtN-0005Li-Qc; Mon, 02 Sep 2013 07:01:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E96F640235;
	Mon,  2 Sep 2013 15:01:56 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D354720E;
	Mon,  2 Sep 2013 15:01:56 +0400 (MSK)
Received: (nullmailer pid 14628 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:23 +0400
Message-Id: <1378119695-14568-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Michael R. Hines" <mrhines@us.ibm.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 03/15] rdma: silly ipv6 bugfix
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
X-List-Received-Date: Mon, 02 Sep 2013 11:02:18 -0000

From: "Michael R. Hines" <mrhines@us.ibm.com>

My bad - but it's very important for us to warn the user that
IPv6 is broken on RoCE in linux right now, until linux releases
a fixed version.

Signed-off-by: Michael R. Hines <mrhines@us.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration-rdma.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration-rdma.c b/migration-rdma.c
index f540366..05a155b 100644
--- a/migration-rdma.c
+++ b/migration-rdma.c
@@ -920,9 +920,11 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
         ret = rdma_resolve_addr(rdma->cm_id, NULL, e->ai_dst_addr,
                 RDMA_RESOLVE_TIMEOUT_MS);
         if (!ret) {
-            ret = qemu_rdma_broken_ipv6_kernel(errp, rdma->cm_id->verbs);
-            if (ret) {
-                continue;
+            if (e->ai_family == AF_INET6) {
+                ret = qemu_rdma_broken_ipv6_kernel(errp, rdma->cm_id->verbs);
+                if (ret) {
+                    continue;
+                }
             }
             goto route;
         }
-- 
1.7.10.4



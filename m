Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBQ3C-00033m-M9
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 10:03:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBFBq-0004r9-1s
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 22:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBFBg-0007IV-C2
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 22:27:30 -0400
Received: from e8.ny.us.ibm.com ([32.97.182.138]:34058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mrhines@linux.vnet.ibm.com>) id 1VBFBg-0007ID-6v
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 22:27:20 -0400
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mrhines@linux.vnet.ibm.com>;
	Mon, 19 Aug 2013 03:27:18 +0100
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 19 Aug 2013 03:27:16 +0100
Received: from d01relay01.pok.ibm.com (d01relay01.pok.ibm.com [9.56.227.233])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 54874C90041
	for <qemu-trivial@nongnu.org>; Sun, 18 Aug 2013 22:27:13 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by d01relay01.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r7J2RF9s084600
	for <qemu-trivial@nongnu.org>; Sun, 18 Aug 2013 22:27:15 -0400
Received: from d01av05.pok.ibm.com (loopback [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r7J2RE0K019786
	for <qemu-trivial@nongnu.org>; Sun, 18 Aug 2013 22:27:15 -0400
Received: from mrhinesdev.klabtestbed.com (klinux.watson.ibm.com [9.2.208.21])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r7J2REtx019781; Sun, 18 Aug 2013 22:27:14 -0400
From: mrhines@linux.vnet.ibm.com
To: qemu-trivial@nongnu.org
Date: Sun, 18 Aug 2013 22:27:08 -0400
Message-Id: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.4
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13081902-0320-0000-0000-000000B7C5DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
X-Mailman-Approved-At: Mon, 19 Aug 2013 10:03:17 -0400
Cc: yamahata@private.email.ne.jp, aliguori@us.ibm.com, quintela@redhat.com,
	owasserm@redhat.com, mrhines@us.ibm.com, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH for-1.6] rdma: silly ipv6 bugfix
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
X-List-Received-Date: Mon, 19 Aug 2013 02:27:39 -0000

From: "Michael R. Hines" <mrhines@us.ibm.com>

My bad - but it's very important for us to warn the user that
IPv6 is broken on RoCE in linux right now, until linux releases
a fixed version.

Signed-off-by: Michael R. Hines <mrhines@us.ibm.com>
---
 migration-rdma.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration-rdma.c b/migration-rdma.c
index 3d1266f..f5e75d6 100644
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



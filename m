Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ey2iz-0002Ww-CH
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2018 17:53:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ey2ix-0002UZ-50
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2018 17:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ey2iw-0000mk-CF
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2018 17:53:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52202 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ey2ir-0000c0-UQ; Mon, 19 Mar 2018 17:53:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EDD68E684;
	Mon, 19 Mar 2018 21:53:41 +0000 (UTC)
Received: from red.redhat.com (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBC351134CCC;
	Mon, 19 Mar 2018 21:53:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Date: Mon, 19 Mar 2018 16:53:35 -0500
Message-Id: <20180319215335.1119213-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 19 Mar 2018 21:53:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 19 Mar 2018 21:53:41 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH for-2.12] rdma: Fix 32-bit compilation
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
X-List-Received-Date: Mon, 19 Mar 2018 21:53:48 -0000

Use the correct printf formats, so that a 32-bit compile doesn't
spit out lots of warnings about %lx being incompatible with uint64_t.
Broken since initial commit ef6d4ccd.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I don't know if 'make vm-build-ubuntu.i368' would catch this (it failed
for me for other reasons); I found it via a 32-bit rawhide VM.

 hw/rdma/rdma_backend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index e306fba5344..89020fdcf62 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -656,7 +656,8 @@ void rdma_backend_destroy_qp(RdmaBackendQP *qp)
 #define CHK_ATTR(req, dev, member, fmt) ({ \
     pr_dbg("%s="fmt","fmt"\n", #member, dev.member, req->member); \
     if (req->member > dev.member) { \
-        warn_report("%s = 0x%lx is higher than host device capability 0x%lx", \
+        warn_report("%s = 0x%" PRIx64 " is higher than host device " \
+                    "capability 0x%" PRIx64, \
                     #member, (uint64_t)req->member, (uint64_t)dev.member); \
         req->member = dev.member; \
     } \
-- 
2.14.3



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTD4H-0002EU-4K
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:26:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4B-00023A-Os
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4A-00052O-Oe
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTD44-0004y0-At; Wed, 04 Mar 2015 12:26:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5625E408A8;
	Wed,  4 Mar 2015 20:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 361A5958;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17513 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:32 +0300
Message-Id: <29637ea9b71b36552fcd626d824a35c25b812a3b.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/47] numa: remove superfluous '\n' around
	error_setg
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
X-List-Received-Date: Wed, 04 Mar 2015 17:26:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/numa.c b/numa.c
index 5634bf0..ffbec68 100644
--- a/numa.c
+++ b/numa.c
@@ -66,7 +66,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
 
     if (nodenr >= MAX_NODES) {
         error_setg(errp, "Max number of NUMA nodes reached: %"
-                   PRIu16 "\n", nodenr);
+                   PRIu16 "", nodenr);
         return;
     }
 
@@ -85,7 +85,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
     }
 
     if (node->has_mem && node->has_memdev) {
-        error_setg(errp, "qemu: cannot specify both mem= and memdev=\n");
+        error_setg(errp, "qemu: cannot specify both mem= and memdev=");
         return;
     }
 
@@ -94,7 +94,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
     }
     if (node->has_memdev != have_memdevs) {
         error_setg(errp, "qemu: memdev option must be specified for either "
-                   "all or no nodes\n");
+                   "all or no nodes");
         return;
     }
 
-- 
2.1.4



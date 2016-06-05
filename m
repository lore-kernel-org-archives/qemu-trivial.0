Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9YJC-0005zR-71
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJA-0005xP-TO
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJ8-0002JT-Rq
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9YJ4-0002HY-5E; Sun, 05 Jun 2016 09:41:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A49364092B;
	Sun,  5 Jun 2016 16:41:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EF7F5B11;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1155 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:09 +0300
Message-Id: <017be9923f4cdb5306df23bed46e4955ed178378.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 32/52] docs/multi-thread-compression: Fix
 wrong command string
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
X-List-Received-Date: Sun, 05 Jun 2016 13:41:41 -0000

From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>

s/info_migrate_capabilities/info migrate_capabilities

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Liang Li <liang.z.li@intel.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/multi-thread-compression.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/multi-thread-compression.txt b/docs/multi-thread-compression.txt
index 3d477c3..d0caaf7 100644
--- a/docs/multi-thread-compression.txt
+++ b/docs/multi-thread-compression.txt
@@ -110,7 +110,7 @@ Usage
 =====
 1. Verify both the source and destination QEMU are able
 to support the multiple thread compression migration:
-    {qemu} info_migrate_capabilities
+    {qemu} info migrate_capabilities
     {qemu} ... compress: off ...
 
 2. Activate compression on the source:
-- 
2.1.4



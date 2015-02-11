Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOfX-0003m4-VA
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:12:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfR-0003ZZ-WC
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfM-0004EM-5a
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:49 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:30220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOfL-0004Dj-Il; Tue, 10 Feb 2015 23:12:44 -0500
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBU12379; Wed, 11 Feb 2015 12:12:41 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:07 +0800
Message-ID: <1423627934-11676-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54DAD6B9.0216, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 28e67edb4a3e28d9d81d6541cbc20b93
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 04/11] numa: remove superfluous '\n' around
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
X-List-Received-Date: Wed, 11 Feb 2015 04:12:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/numa.c b/numa.c
index afd2866..6decd13 100644
--- a/numa.c
+++ b/numa.c
@@ -59,7 +59,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
 
     if (nodenr >= MAX_NODES) {
         error_setg(errp, "Max number of NUMA nodes reached: %"
-                   PRIu16 "\n", nodenr);
+                   PRIu16 "", nodenr);
         return;
     }
 
@@ -78,7 +78,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
     }
 
     if (node->has_mem && node->has_memdev) {
-        error_setg(errp, "qemu: cannot specify both mem= and memdev=\n");
+        error_setg(errp, "qemu: cannot specify both mem= and memdev=");
         return;
     }
 
@@ -87,7 +87,7 @@ static void numa_node_parse(NumaNodeOptions *node, QemuOpts *opts, Error **errp)
     }
     if (node->has_memdev != have_memdevs) {
         error_setg(errp, "qemu: memdev option must be specified for either "
-                   "all or no nodes\n");
+                   "all or no nodes");
         return;
     }
 
-- 
1.7.12.4




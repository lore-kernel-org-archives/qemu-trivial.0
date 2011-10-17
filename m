Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFk4a-0006B2-AW
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 06:05:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>) id 1RFk4R-0005h9-Gt
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>) id 1RFk4N-0003jQ-Gv
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:05:23 -0400
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:59776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>)
	id 1RFk4K-0003iW-E4; Mon, 17 Oct 2011 06:05:16 -0400
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [202.81.31.247])
	by e23smtp07.au.ibm.com (8.14.4/8.13.1) with ESMTP id p9HA57rJ018760;
	Mon, 17 Oct 2011 21:05:07 +1100
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p9HA2Y192248886; Mon, 17 Oct 2011 21:02:36 +1100
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p9HA54gr018683; Mon, 17 Oct 2011 21:05:04 +1100
Received: from Ray-Ubuntu-11.cn.ibm.com ([9.115.116.13])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p9HA53kb016905; Mon, 17 Oct 2011 21:05:03 +1100
From: Ray Wang <raywang@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Oct 2011 18:03:56 +0800
Message-Id: <1318845836-30088-1-git-send-email-raywang@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 202.81.31.140
Cc: qemu-trivial@nongnu.org, raywang@linux.vnet.ibm.com
Subject: [Qemu-trivial] [Qemu-devel][PATCH] change free() to g_free() to
	pair with g_malloc() series.
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
X-List-Received-Date: Mon, 17 Oct 2011 10:05:30 -0000

Signed-off-by: Ray Wang <raywang@linux.vnet.ibm.com>
---
 block/dmg.c         |   14 +++++++-------
 target-arm/helper.c |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/block/dmg.c b/block/dmg.c
index 64c3cce..661f31b 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -284,14 +284,14 @@ static void dmg_close(BlockDriverState *bs)
 {
     BDRVDMGState *s = bs->opaque;
     if(s->n_chunks>0) {
-	free(s->types);
-	free(s->offsets);
-	free(s->lengths);
-	free(s->sectors);
-	free(s->sectorcounts);
+	g_free(s->types);
+	g_free(s->offsets);
+	g_free(s->lengths);
+	g_free(s->sectors);
+	g_free(s->sectorcounts);
     }
-    free(s->compressed_chunk);
-    free(s->uncompressed_chunk);
+    g_free(s->compressed_chunk);
+    g_free(s->uncompressed_chunk);
     inflateEnd(&s->zstream);
 }
 
diff --git a/target-arm/helper.c b/target-arm/helper.c
index e2428eb..2b17dc9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -471,7 +471,7 @@ static uint32_t cpu_arm_find_by_name(const char *name)
 
 void cpu_arm_close(CPUARMState *env)
 {
-    free(env);
+    g_free(env);
 }
 
 uint32_t cpsr_read(CPUARMState *env)
-- 
1.7.4.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0El-00024S-Kv
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Ee-0001qd-LZ
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Ea-00085q-7x
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0EN-00083r-LV; Sat, 26 Oct 2013 05:32:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B1EFA43916;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 74A19516;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: (nullmailer pid 19511 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:22 +0400
Message-Id: <1382779887-15971-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 2/7] misc: New spelling fixes in comments
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
X-List-Received-Date: Sat, 26 Oct 2013 09:32:49 -0000

From: Stefan Weil <sw@weilnetz.de>

compatiblity -> compatibility
continously -> continuously
existance -> existence
usefull -> useful
shoudl -> should

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/iscsi.c            |    2 +-
 hw/ppc/spapr.c           |    2 +-
 target-alpha/translate.c |    2 +-
 tests/test-throttle.c    |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index a2a961e..a2d578c 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -866,7 +866,7 @@ retry:
         /* in case the get_lba_status_callout fails (i.e.
          * because the device is busy or the cmd is not
          * supported) we pretend all blocks are allocated
-         * for backwards compatiblity */
+         * for backwards compatibility */
         goto out;
     }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 004184d..74aa5cc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -120,7 +120,7 @@ int spapr_allocate_irq_block(int num, bool lsi, bool msi)
      * it has to be aligned to num to support multiple
      * MSI vectors. MSI-X is not affected by this.
      * The hint is used for the first IRQ, the rest should
-     * be allocated continously.
+     * be allocated continuously.
      */
     if (msi) {
         assert((num == 1) || (num == 2) || (num == 4) ||
diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index c24910f..1155e86 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -1601,7 +1601,7 @@ static ExitStatus gen_call_pal(DisasContext *ctx, int palcode)
         tcg_temp_free(pc);
 
         /* Since the destination is running in PALmode, we don't really
-           need the page permissions check.  We'll see the existance of
+           need the page permissions check.  We'll see the existence of
            the page when we create the TB, and we'll flush all TBs if
            we change the PAL base register.  */
         if (!ctx->singlestep_enabled && !(ctx->tb->cflags & CF_LAST_IO)) {
diff --git a/tests/test-throttle.c b/tests/test-throttle.c
index 7608126..1d4ffd3 100644
--- a/tests/test-throttle.c
+++ b/tests/test-throttle.c
@@ -18,7 +18,7 @@ LeakyBucket    bkt;
 ThrottleConfig cfg;
 ThrottleState  ts;
 
-/* usefull function */
+/* useful function */
 static bool double_cmp(double x, double y)
 {
     return fabsl(x - y) < 1e-6;
@@ -320,7 +320,7 @@ static void test_have_timer(void)
     /* zero the structure */
     memset(&ts, 0, sizeof(ts));
 
-    /* no timer set shoudl return false */
+    /* no timer set should return false */
     g_assert(!throttle_have_timer(&ts));
 
     /* init the structure */
-- 
1.7.10.4



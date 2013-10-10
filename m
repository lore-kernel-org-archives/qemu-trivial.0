Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VULck-0002In-NC
	for mharc-qemu-trivial@gnu.org; Thu, 10 Oct 2013 15:10:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VULMs-00047I-82
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 14:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VULMq-0002A7-VA
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 14:53:50 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:44408
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VULMo-00029J-4V; Thu, 10 Oct 2013 14:53:46 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id C284717FC91; Thu, 10 Oct 2013 20:53:41 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 10 Oct 2013 20:53:40 +0200
Message-Id: <1381431220-31946-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] misc: New spelling fixes in comments
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
X-List-Received-Date: Thu, 10 Oct 2013 18:53:51 -0000

compatiblity -> compatibility
continously -> continuously
existance -> existence
usefull -> useful
shoudl -> should

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/iscsi.c            |    2 +-
 hw/ppc/spapr.c           |    2 +-
 target-alpha/translate.c |    2 +-
 tests/test-throttle.c    |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 6152ef1..58e3c3d 100644
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
index 28ce436..0b7dce0 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -1624,7 +1624,7 @@ static ExitStatus gen_call_pal(DisasContext *ctx, int palcode)
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



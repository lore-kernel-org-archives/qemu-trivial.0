Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RODux-0006KW-9a
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 14:34:39 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RODuu-0006Af-Dx
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RODut-0006xt-H9
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:34:36 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:42337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RODur-0006xK-8c; Wed, 09 Nov 2011 14:34:33 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RODum-0002by-PH; Wed, 09 Nov 2011 19:34:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 Nov 2011 19:34:28 +0000
Message-Id: <1320867268-10015-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/tc58128.c: Remove unnecessary check for
	g_malloc failure
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
X-List-Received-Date: Wed, 09 Nov 2011 19:34:37 -0000

Remove a check for g_malloc failing: this never happens.
Also use g_malloc rather than g_malloc0 as we immediately
memset the entire region and so zero-initialising it is pointless.
Spotted by Coverity (see bug 887883).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/tc58128.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/hw/tc58128.c b/hw/tc58128.c
index ee3ecad..4ce80b1 100644
--- a/hw/tc58128.c
+++ b/hw/tc58128.c
@@ -30,12 +30,8 @@ static void init_dev(tc58128_dev * dev, const char *filename)
     int ret, blocks;
 
     dev->state = WAIT;
-    dev->flash_contents = g_malloc0(FLASH_SIZE);
+    dev->flash_contents = g_malloc(FLASH_SIZE);
     memset(dev->flash_contents, 0xff, FLASH_SIZE);
-    if (!dev->flash_contents) {
-	fprintf(stderr, "could not alloc memory for flash\n");
-	exit(1);
-    }
     if (filename) {
 	/* Load flash image skipping the first block */
 	ret = load_image(filename, dev->flash_contents + 528 * 32);
-- 
1.7.1



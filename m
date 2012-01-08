Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rjxas-0005hj-62
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jan 2012 13:35:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rjxap-0005bk-FI
	for qemu-trivial@nongnu.org; Sun, 08 Jan 2012 13:35:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rjxao-0002iw-Ah
	for qemu-trivial@nongnu.org; Sun, 08 Jan 2012 13:35:43 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rjxal-0002iT-KR; Sun, 08 Jan 2012 13:35:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2E6317280003; Sun,  8 Jan 2012 19:35:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AhIemRKMHbyY; Sun,  8 Jan 2012 19:35:09 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B1CD37280004; Sun,  8 Jan 2012 19:35:09 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun,  8 Jan 2012 19:35:09 +0100
Message-Id: <1326047709-32345-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Spelling fixes in comments and documentation
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
X-List-Received-Date: Sun, 08 Jan 2012 18:35:44 -0000

Codespell detected these new spelling issues.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/writing-qmp-commands.txt |    2 +-
 memory.h                      |    4 ++--
 qemu-ga.c                     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/writing-qmp-commands.txt b/docs/writing-qmp-commands.txt
index 0472fc3..0ad51aa 100644
--- a/docs/writing-qmp-commands.txt
+++ b/docs/writing-qmp-commands.txt
@@ -435,7 +435,7 @@ There are a number of things to be noticed:
    for all QMP functions)
 3. The "clock" variable (which will point to our QAPI type instance) is
    allocated by the regular g_malloc0() function. Note that we chose to
-   initialize the memory to zero. This is recomended for all QAPI types, as
+   initialize the memory to zero. This is recommended for all QAPI types, as
    it helps avoiding bad surprises (specially with booleans)
 4. Remember that "next_deadline" is optional? All optional members have a
    'has_TYPE_NAME' member that should be properly set by the implementation,
diff --git a/memory.h b/memory.h
index 70f57fb..d48b08b 100644
--- a/memory.h
+++ b/memory.h
@@ -561,7 +561,7 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
  * memory_region_get_ram_addr: Get the ram address associated with a memory
  *                             region
  *
- * DO NOT USE THIS FUCNTION.  This is a temporary workaround while the Xen
+ * DO NOT USE THIS FUNCTION.  This is a temporary workaround while the Xen
  * code is being reworked.
  */
 ram_addr_t memory_region_get_ram_addr(MemoryRegion *mr);
@@ -650,7 +650,7 @@ void memory_global_sync_dirty_bitmap(MemoryRegion *address_space);
  * memory_region_transaction_begin: Start a transaction.
  *
  * During a transaction, changes will be accumulated and made visible
- * only when the transaction ends (is commited).
+ * only when the transaction ends (is committed).
  */
 void memory_region_transaction_begin(void);
 
diff --git a/qemu-ga.c b/qemu-ga.c
index 200bb15..29e4f64 100644
--- a/qemu-ga.c
+++ b/qemu-ga.c
@@ -92,7 +92,7 @@ static void usage(const char *cmd)
 "  -v, --verbose     log extra debugging information\n"
 "  -V, --version     print version information and exit\n"
 "  -d, --daemonize   become a daemon\n"
-"  -b, --blacklist   comma-seperated list of RPCs to disable (no spaces, \"?\""
+"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\""
 "                    to list available RPCs)\n"
 "  -h, --help        display this help and exit\n"
 "\n"
-- 
1.7.2.5



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VNctU-0002c4-Ok
	for mharc-qemu-trivial@gnu.org; Sun, 22 Sep 2013 02:11:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNctO-0002UF-QE
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 02:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNctJ-0003lQ-SN
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 02:11:38 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58214
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VNct9-0003kG-SP; Sun, 22 Sep 2013 02:11:23 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E324317FE86; Sun, 22 Sep 2013 08:11:19 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 22 Sep 2013 08:11:19 +0200
Message-Id: <1379830279-23376-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] translate-all: Fix formatting of dump
	output
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
X-List-Received-Date: Sun, 22 Sep 2013 06:11:43 -0000

The page dump writes a table with 3 abi_ulong values in each row.
These values take 8 or 16 characters (depending on sizeof abi_ulong).

Fix the table headings to be aligned with the table columns.

old:
start    end      size     prot
0000000120000000-000000012021e000 000000000021e000 rwx
0000004000000000-0000004000002000 0000000000002000 ---
0000004000002000-0000004000802000 0000000000800000 rw-

new:
start            end              size             prot
0000000120000000-000000012021e000 000000000021e000 rwx
0000004000000000-0000004000002000 0000000000002000 ---
0000004000002000-0000004000802000 0000000000800000 rw-

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2:
'length' is now an int value instead of a size_t.
Compilers require an int for the '*' flag.
size_t causes a compiler warning in some configurations.

 translate-all.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index 2c923c6..e7aff92 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1679,8 +1679,9 @@ static int dump_region(void *priv, abi_ulong start,
 /* dump memory mappings */
 void page_dump(FILE *f)
 {
-    (void) fprintf(f, "%-8s %-8s %-8s %s\n",
-            "start", "end", "size", "prot");
+    const int length = sizeof(abi_ulong) * 2;
+    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
+            length, "start", length, "end", length, "size", "prot");
     walk_memory_regions(f, dump_region);
 }
 
-- 
1.7.10.4



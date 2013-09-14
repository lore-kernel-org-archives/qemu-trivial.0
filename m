Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvpB-0005Zm-E8
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:48:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvp5-0005OU-N4
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvp1-0006ki-A4
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:48:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvom-0006ci-S7; Sat, 14 Sep 2013 15:47:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 200E7411C0;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 051264C3;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: (nullmailer pid 7699 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:31 +0400
Message-Id: <1379188061-7634-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 05/15] translate-all: Fix formatting of dump
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
X-List-Received-Date: Sat, 14 Sep 2013 19:48:08 -0000

From: Stefan Weil <sw@weilnetz.de>

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 translate-all.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index 2c923c6..3b97c66 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1679,8 +1679,9 @@ static int dump_region(void *priv, abi_ulong start,
 /* dump memory mappings */
 void page_dump(FILE *f)
 {
-    (void) fprintf(f, "%-8s %-8s %-8s %s\n",
-            "start", "end", "size", "prot");
+    const size_t length = sizeof(abi_ulong) * 2;
+    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
+            length, "start", length, "end", length, "size", "prot");
     walk_memory_regions(f, dump_region);
 }
 
-- 
1.7.10.4



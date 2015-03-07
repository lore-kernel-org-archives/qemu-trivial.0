Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUN1L-0000T3-R4
	for mharc-qemu-trivial@gnu.org; Sat, 07 Mar 2015 17:16:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUN1J-0000OU-0Z
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 17:16:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUN1I-0002M7-56
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 17:16:28 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:44683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUN1D-0002JM-QJ; Sat, 07 Mar 2015 17:16:23 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 4FCCB17F989; Sat,  7 Mar 2015 23:16:21 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  7 Mar 2015 23:16:21 +0100
Message-Id: <1425766581-18250-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] block/qapi: Fix Sparse warning
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
X-List-Received-Date: Sat, 07 Mar 2015 22:16:29 -0000

Sparse reports this warning:

block/qapi.c:417:47: warning:
 too long initializer-string for array of char(no space for nul char)

Replacing the string by an array of characters fixes this warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/qapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qapi.c b/block/qapi.c
index 1808e67..8a19aed 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -414,7 +414,7 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
 
 static char *get_human_readable_size(char *buf, int buf_size, int64_t size)
 {
-    static const char suffixes[NB_SUFFIXES] = "KMGT";
+    static const char suffixes[NB_SUFFIXES] = {'K', 'M', 'G', 'T'};
     int64_t base;
     int i;
 
-- 
2.1.4



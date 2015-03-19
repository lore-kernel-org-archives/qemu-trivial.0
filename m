Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVT-0002Lb-9O
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVQ-0002GQ-Hi
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVP-0007m4-MC
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVK-0007jc-8g; Thu, 19 Mar 2015 05:12:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CEF2641E49;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B4702926;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 341 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:27 +0300
Message-Id: <2c20fa2cc26fd203a1260bb5251a523320faa905.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/24] block/qapi: Fix Sparse warning
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:45 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse reports this warning:

block/qapi.c:417:47: warning:
 too long initializer-string for array of char(no space for nul char)

Replacing the string by an array of characters fixes this warning.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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



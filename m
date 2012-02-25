Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1HnN-0005XL-8m
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 08:36:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1HnF-0005Ek-NA
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:36:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1Hn7-0004YC-IJ
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:36:06 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:51879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1Hmx-0004XB-Il; Sat, 25 Feb 2012 08:35:51 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9E73E7280099; Sat, 25 Feb 2012 14:35:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hwzddUY9P7fn; Sat, 25 Feb 2012 14:35:49 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1631B728009A; Sat, 25 Feb 2012 14:35:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 14:35:47 +0100
Message-Id: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: Fix packed boolean struct members
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
X-List-Received-Date: Sat, 25 Feb 2012 13:36:15 -0000

This patch fixes warnings reported by splint:

For variables which are packed in a single bit, a signed data type
like 'int' does not make much sense.

There is no obvious reason why the two values should be packed,
so I removed the packing and changed the data type to bool
because both are used as boolean values.

Cc: Anthony Liguori <aliguori@us.ibm.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/vnc-auth-sasl.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
index fd9b18a..ee243a9 100644
--- a/ui/vnc-auth-sasl.h
+++ b/ui/vnc-auth-sasl.h
@@ -37,9 +37,9 @@ typedef struct VncDisplaySASL VncDisplaySASL;
 struct VncStateSASL {
     sasl_conn_t *conn;
     /* If we want to negotiate an SSF layer with client */
-    int wantSSF :1;
+    bool wantSSF;
     /* If we are now running the SSF layer */
-    int runSSF :1;
+    bool runSSF;
     /*
      * If this is non-zero, then wait for that many bytes
      * to be written plain, before switching to SSF encoding
-- 
1.7.9



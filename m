Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UvvWL-0006zR-UC
	for mharc-qemu-trivial@gnu.org; Sun, 07 Jul 2013 16:25:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UvvWH-0006sY-PM
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 16:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UvvWF-0005Ok-2O
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 16:25:17 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1UvvWA-0005N8-0G; Sun, 07 Jul 2013 16:25:10 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A284F72819DE; Sun,  7 Jul 2013 22:25:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VMM0nU4z5SJD; Sun,  7 Jul 2013 22:25:05 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id BAC8F72819DF; Sun,  7 Jul 2013 22:25:05 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  7 Jul 2013 22:25:02 +0200
Message-Id: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Spelling fixes
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
X-List-Received-Date: Sun, 07 Jul 2013 20:25:20 -0000

* it's -> its
* of cause -> of course
* grammar fix in ui/vnc-enc-zywrle.h

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qapi-schema.json    |    2 +-
 slirp/if.c          |    2 +-
 ui/vnc-enc-zywrle.h |    6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 5b0fb3b..1efad03 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1664,7 +1664,7 @@
 #
 # Since: 0.14.0
 #
-# Notes: This command only exists as a stop-gap.  It's use is highly
+# Notes: This command only exists as a stop-gap.  Its use is highly
 #        discouraged.  The semantics of this command are not guaranteed.
 #
 #        Known limitations:
diff --git a/slirp/if.c b/slirp/if.c
index dcd5faf..3db3a30 100644
--- a/slirp/if.c
+++ b/slirp/if.c
@@ -142,7 +142,7 @@ diddit:
 
 /*
  * Send a packet
- * We choose a packet based on it's position in the output queues;
+ * We choose a packet based on its position in the output queues;
  * If there are packets on the fastq, they are sent FIFO, before
  * everything else.  Otherwise we choose the first packet from the
  * batchq and send it.  the next packet chosen will be from the session
diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
index 1ff40b1..addee55 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -305,9 +305,9 @@ static inline void harr(int8_t *px0, int8_t *px1)
    |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
 
  In this method, H/L and X0/X1 is always same position.
- This lead us to more speed and less memory.
- Of cause, the result of both method is quite same
- because it's only difference that coefficient position.
+ This leads us to more speed and less memory.
+ Of course, the result of both methods is quite same
+ because its only difference is that coefficient position.
 */
 static inline void wavelet_level(int *data, int size, int l, int skip_pixel)
 {
-- 
1.7.10.4



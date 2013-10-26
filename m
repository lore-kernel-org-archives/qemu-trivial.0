Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Ki-0006bb-E7
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Kd-0006Qz-AM
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0KZ-0001Bc-IF
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:38:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0KM-00014G-Pe; Sat, 26 Oct 2013 05:38:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AD3E643919;
	Sat, 26 Oct 2013 13:38:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E517651D;
	Sat, 26 Oct 2013 13:32:27 +0400 (MSK)
Received: (nullmailer pid 19599 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:26 +0400
Message-Id: <1382779887-15971-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 6/7] misc: Spelling and grammar fixes in
	comments
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
X-List-Received-Date: Sat, 26 Oct 2013 09:38:59 -0000

From: Stefan Weil <sw@weilnetz.de>

* it's -> its
* grammar fix in ui/vnc-enc-zywrle.h

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Don Koch <dkoch@verizon.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json    |    2 +-
 slirp/if.c          |    2 +-
 ui/vnc-enc-zywrle.h |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 60f3fd1..a003aa1 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1914,7 +1914,7 @@
 #
 # Since: 0.14.0
 #
-# Notes: This command only exists as a stop-gap.  It's use is highly
+# Notes: This command only exists as a stop-gap.  Its use is highly
 #        discouraged.  The semantics of this command are not guaranteed.
 #
 #        Known limitations:
diff --git a/slirp/if.c b/slirp/if.c
index 87ca8a5..fb7acf8 100644
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
index 1ff40b1..d436d58 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -305,7 +305,7 @@ static inline void harr(int8_t *px0, int8_t *px1)
    |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
 
  In this method, H/L and X0/X1 is always same position.
- This lead us to more speed and less memory.
+ This leads us to more speed and less memory.
  Of cause, the result of both method is quite same
  because it's only difference that coefficient position.
 */
-- 
1.7.10.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUi2j-0004Wa-UB
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 15:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUi2h-0004Tt-Dh
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUi2g-0005vn-DU
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:06:31 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45533
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUi2c-0005uG-UQ; Fri, 11 Oct 2013 15:06:27 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 293DE180576; Fri, 11 Oct 2013 21:06:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Fri, 11 Oct 2013 21:06:22 +0200
Message-Id: <1381518382-6105-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: peter.maydell@linaro.org, Anthony Liguori <anthony@codemonkey.ws>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, alex@alex.org.uk,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] misc: Spelling and other fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 19:06:32 -0000

* it's -> its
* Grammar fix in ui/vnc-enc-zywrle.h. In the same context
  a sentence with unclear meaning which could not be fixed was removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is an update of patch http://patchwork.ozlabs.org/patch/257416/
(Spelling fixes).

v2: Don't try to fix a strange sentence in ui/vnc-enc-zywrle.h - remove it.

 qapi-schema.json    |    2 +-
 slirp/if.c          |    2 +-
 ui/vnc-enc-zywrle.h |    4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 145eca8..ce38a3a 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1864,7 +1864,7 @@
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
index 1ff40b1..91d2616 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -305,9 +305,7 @@ static inline void harr(int8_t *px0, int8_t *px1)
    |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
 
  In this method, H/L and X0/X1 is always same position.
- This lead us to more speed and less memory.
- Of cause, the result of both method is quite same
- because it's only difference that coefficient position.
+ This leads us to more speed and less memory.
 */
 static inline void wavelet_level(int *data, int size, int l, int skip_pixel)
 {
-- 
1.7.10.4



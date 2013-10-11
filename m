Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUiU4-0002D0-0W
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 15:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUiTx-00025d-Ps
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUiTw-0005tQ-Oq
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:34:41 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45571
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VUiTt-0005rm-8O; Fri, 11 Oct 2013 15:34:37 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0E9E8180576; Fri, 11 Oct 2013 21:34:33 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Fri, 11 Oct 2013 21:34:33 +0200
Message-Id: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH v3] misc: Spelling and grammar fixes in
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
X-List-Received-Date: Fri, 11 Oct 2013 19:34:43 -0000

* it's -> its
* grammar fix in ui/vnc-enc-zywrle.h

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is v3 of http://patchwork.ozlabs.org/patch/257416/.

v3:
Don't try to improve a strange sentence in the same context ("Of cause [...]").

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



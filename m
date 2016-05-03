Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axjIc-0003TX-Nq
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 19:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1axjIV-00039z-5j
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 19:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1axjIJ-0005os-CO
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 19:00:01 -0400
Received: from lekensteyn.nl ([178.21.112.251]:54519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1axjHz-0005gH-OP; Tue, 03 May 2016 18:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2015-q1; 
	h=Message-Id:Date:Subject:Cc:To:From;
	bh=tfaAvWMnOpTVG2tuNVQGNqaMJgoh2HabHLlZFb8421U=; 
	b=BUSOXO5iebHC/5CzOLUC8yvYhkYrz9pAZuftuftI0uMHR6KartP9rGEldH/dYnLb5Ha2B7xNbcoBFyirhPwkwiTjxZCcph2T2RXXRAjAgxfEWDHmJBjbKCyphUkCJuwTYOuOscgAPjZiA5Rmf2Rm+4RkY4hwz3TsisDXb7G+XaR8AvvD9p8K6+ZBhNuh3HbTe8KkLJR17F+wpKy4INEWfEQ7x/nAtS20dFGsS0MdJQ2ow5r4IG9LNgx13x0WF1sQoaypRnkHgDVBvXueJSDW71dDLWOin5yUzRHAQSIDFT6WQl4hHfwDH+XyjT9yEusYBu6w1U8WElARH1EwrhYkJQ==;
Received: by lekensteyn.nl with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim 4.84_2)
	(envelope-from <peter@lekensteyn.nl>)
	id 1axjHS-0008Vx-Oh; Wed, 04 May 2016 00:59:09 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 May 2016 00:58:39 +0200
Message-Id: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.8.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.21.112.251
Subject: [Qemu-trivial] [PATCH] gdbstub: avoid busy loop while waiting for
 gdb
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 23:00:13 -0000

While waiting for a gdb response, or while sending an acknowledgement
there is not much to do, so just mark the socket as non-blocking to
avoid a busy loop while paused at gdb. This only affects the user-mode
emulation (qemu-arm -g 1234 ./a.out).

Note that this issue was reported before at
https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.

While at it, close the gdb client fd on EOF or error while reading.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
 gdbstub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 0e431fd..b126bf5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -332,7 +332,7 @@ static int get_char(GDBState *s)
         if (ret < 0) {
             if (errno == ECONNRESET)
                 s->fd = -1;
-            if (errno != EINTR && errno != EAGAIN)
+            if (errno != EINTR)
                 return -1;
         } else if (ret == 0) {
             close(s->fd);
@@ -393,7 +393,7 @@ static void put_buffer(GDBState *s, const uint8_t *buf, int len)
     while (len > 0) {
         ret = send(s->fd, buf, len, 0);
         if (ret < 0) {
-            if (errno != EINTR && errno != EAGAIN)
+            if (errno != EINTR)
                 return;
         } else {
             buf += ret;
@@ -1542,9 +1542,13 @@ gdb_handlesig(CPUState *cpu, int sig)
             for (i = 0; i < n; i++) {
                 gdb_read_byte(s, buf[i]);
             }
-        } else if (n == 0 || errno != EAGAIN) {
+        } else {
             /* XXX: Connection closed.  Should probably wait for another
                connection before continuing.  */
+            if (n == 0) {
+                close(s->fd);
+            }
+            s->fd = -1;
             return sig;
         }
     }
@@ -1599,8 +1603,6 @@ static void gdb_accept(void)
     gdb_has_xml = false;
 
     gdbserver_state = s;
-
-    fcntl(fd, F_SETFL, O_NONBLOCK);
 }
 
 static int gdbserver_open(int port)
-- 
2.8.0



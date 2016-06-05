Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9ZA9-0007ix-QJ
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 10:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1b9ZA7-0007f1-9e
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 10:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1b9ZA4-0005tz-Qk
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 10:36:22 -0400
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:41221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1b9ZA1-0005tR-Ru; Sun, 05 Jun 2016 10:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2015-q1; 
	h=Message-Id:Date:Subject:Cc:To:From;
	bh=4TMjNtdPlmka7knNLhKTaJOYUIwDnt1DHyVwCH1xK/8=; 
	b=ehd/Y1qVga7zzWNtULJKYCwYErBRYgky47QoASc7pEh0wGNBVhVALw4l9PPlMwNQZfO5+AlXvmZBVZk5zLIZaTAEPhJgUHS6LRmondo//u4wxTZ1E94PT1eTGfQGO+sOXcOuHSRxBjnYd5cuK/TWKdcEqeeAsSzYjU9tyLUPTmuaKnyrFwcr5TJBPCBvl5rDo0mzdiqHYAHDdVabXSdHVM2DJALMN6L0ZPycMLUPsjYFFGcDqT7DdYLFcWNO0S3knt1xPlLuzGHr3WSRFy2FvyP0+yV1OSS5Mm6SGbRFjpDULU4w9hqClHbhEpfN1khoPuzCtF2QRDG/YI8CRnTuxg==;
Received: by lekensteyn.nl with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <peter@lekensteyn.nl>)
	id 1b9Z9w-0004Nl-Jv; Sun, 05 Jun 2016 16:36:13 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sun,  5 Jun 2016 16:35:48 +0200
Message-Id: <20160605143548.2331-1-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.8.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a02:2308::360:1:25
Subject: [Qemu-trivial] [PATCH v2] gdbstub: avoid busy loop while waiting
 for gdb
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
X-List-Received-Date: Sun, 05 Jun 2016 14:36:24 -0000

While waiting for a gdb response, or while sending an acknowledgement
there is not much to do, so do not mark the socket as non-blocking to
avoid a busy loop while paused at gdb. This only affects the user-mode
emulation (qemu-arm -g 1234 ./a.out).

Note that this issue was reported before at
https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.

While at it, close the gdb client fd on EOF or error while reading.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 v2: resent with fixed commit message + R-b from
     https://patchwork.kernel.org/patch/9008751/
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
2.8.3



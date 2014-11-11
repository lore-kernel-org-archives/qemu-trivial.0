Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpN-0000o8-96
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpI-0000e1-6d
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpE-00029k-4j
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp1-00027O-5S; Tue, 11 Nov 2014 09:53:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F8C441DFC;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 87B99710;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14567 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:27 +0300
Message-Id: <f17b06901049e54dbfa8b01c278cdc2e3ae5d62d.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Martin Simmons <martin@lispworks.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/11] gdbstub: Add a missing case of signal
	number translation in gdbstub
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:52 -0000

From: Martin Simmons <martin@lispworks.com>

While using qemu with gdb "target remote" to debug an application that uses
fork and exec, the qemu process receives SIGSTOP every time the forked process
terminates (sending SIGCHLD).

This is caused by a missing call to gdb_signal_to_target in gdbstub.c, which
is fixed by this patch:

Signed-off-by: Martin Simmons <martin@lispworks.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 gdbstub.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index d1b5afd..0faca56 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -823,7 +823,10 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
                 action = *p++;
                 signal = 0;
                 if (action == 'C' || action == 'S') {
-                    signal = strtoul(p, (char **)&p, 16);
+                    signal = gdb_signal_to_target(strtoul(p, (char **)&p, 16));
+                    if (signal == -1) {
+                        signal = 0;
+                    }
                 } else if (action != 'c' && action != 's') {
                     res = 0;
                     break;
-- 
1.7.10.4



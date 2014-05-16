Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WlHkL-0007GP-Up
	for mharc-qemu-trivial@gnu.org; Fri, 16 May 2014 09:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WlHkJ-0007E1-AZ
	for qemu-trivial@nongnu.org; Fri, 16 May 2014 09:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WlHkF-0001dI-9s
	for qemu-trivial@nongnu.org; Fri, 16 May 2014 09:00:19 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WlHkC-0001Dm-T9; Fri, 16 May 2014 09:00:13 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WlHk3-0008Kg-Uf; Fri, 16 May 2014 14:00:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 May 2014 14:00:03 +0100
Message-Id: <1400245203-32005-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] iohandler.c: Properly initialize sigaction
	struct
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
X-List-Received-Date: Fri, 16 May 2014 13:00:20 -0000

The code in qemu_init_child_watch() wasn't clearing the 'struct
sigaction' before passing it to sigaction(); this meant that we
would block a random set of signals while executing the SIGCHLD
handler. Initialize properly by using memset() on the struct,
as we do in similar cases elsewhere.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Pretty harmless, but spotted by coverity.

 iohandler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/iohandler.c b/iohandler.c
index ae2ef8f..cca614f 100644
--- a/iohandler.c
+++ b/iohandler.c
@@ -191,6 +191,7 @@ static void qemu_init_child_watch(void)
     struct sigaction act;
     sigchld_bh = qemu_bh_new(sigchld_bh_handler, NULL);
 
+    memset(&act, 0, sizeof(act));
     act.sa_handler = sigchld_handler;
     act.sa_flags = SA_NOCLDSTOP;
     sigaction(SIGCHLD, &act, NULL);
-- 
1.9.2



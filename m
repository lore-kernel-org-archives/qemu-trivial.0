Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopD1-0005Kl-Lf
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCv-0005Cu-6q
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopCq-0007OJ-SB
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:20:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopCh-0007Kx-Ob; Mon, 26 May 2014 03:20:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8ACC842FA3;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66F76666;
	Mon, 26 May 2014 11:20:13 +0400 (MSK)
Received: (nullmailer pid 22989 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:50 +0400
Message-Id: <1401088811-22923-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/23] iohandler.c: Properly initialize
	sigaction struct
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
X-List-Received-Date: Mon, 26 May 2014 07:20:33 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The code in qemu_init_child_watch() wasn't clearing the 'struct
sigaction' before passing it to sigaction(); this meant that we
would block a random set of signals while executing the SIGCHLD
handler. Initialize properly by using memset() on the struct,
as we do in similar cases elsewhere.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 iohandler.c |    1 +
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
1.7.10.4



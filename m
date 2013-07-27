Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z1U-0003s7-1E
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:34:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1R-0003nS-5C
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1Q-0006AR-1X
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z1M-00068y-Pn; Sat, 27 Jul 2013 03:34:32 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 153A442FBF;
	Sat, 27 Jul 2013 11:34:32 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 4D3A5202881; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:24 +0400
Message-Id: <1374910406-15273-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Ramkumar Ramachandra <artagnon@gmail.com>,
	qemu-trivial@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL trivial 09/11] qemu-options: mention C-a h in
	the -nographic doc
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
X-List-Received-Date: Sat, 27 Jul 2013 07:34:38 -0000

From: Ramkumar Ramachandra <artagnon@gmail.com>

Otherwise, a new user will be wondering how to switch between the
console and monitor.

Cc: Anthony Liguori <aliguori@us.ibm.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Ramkumar Ramachandra <artagnon@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 2dbfd42..25ecb55 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -844,7 +844,8 @@ you can totally disable graphical output so that QEMU is a simple
 command line application. The emulated serial port is redirected on
 the console and muxed with the monitor (unless redirected elsewhere
 explicitly). Therefore, you can still use QEMU to debug a Linux kernel
-with a serial console.
+with a serial console.  Use @key{C-a h} for help on switching between
+the console and monitor.
 ETEXI
 
 DEF("curses", 0, QEMU_OPTION_curses,
-- 
1.7.10.4



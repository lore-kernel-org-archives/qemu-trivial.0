Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z1T-0003r1-6L
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:34:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1R-0003nC-0S
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z1P-0006AC-7g
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:34:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z1M-00068r-C6; Sat, 27 Jul 2013 03:34:32 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B40F842F73;
	Sat, 27 Jul 2013 11:34:31 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 413B0202884; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:17 +0400
Message-Id: <1374910406-15273-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Liu Ping Fan <pingfank@linux.vnet.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Liu Ping Fan <qemulist@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 02/11] timer: make timers_state static
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

From: Liu Ping Fan <qemulist@gmail.com>

Signed-off-by: Liu Ping Fan <pingfank@linux.vnet.ibm.com>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index ca6b886..0f65e76 100644
--- a/cpus.c
+++ b/cpus.c
@@ -112,7 +112,7 @@ typedef struct TimersState {
     int64_t dummy;
 } TimersState;
 
-TimersState timers_state;
+static TimersState timers_state;
 
 /* Return the virtual CPU time, based on the instruction counter.  */
 int64_t cpu_get_icount(void)
-- 
1.7.10.4



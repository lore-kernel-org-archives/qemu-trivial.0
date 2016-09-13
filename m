Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqMB-0006RA-Tf
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM7-0006MU-7g
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqM3-00087M-IG
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqLv-0007lQ-0v; Tue, 13 Sep 2016 12:14:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2B361416E4;
	Tue, 13 Sep 2016 19:14:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9A8C3B0B;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: (nullmailer pid 31900 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:47 +0300
Message-Id: <8223f345b9ba787eff1ae65114523f513fd27906.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/16] linux-user,
 trivial: display "0x%x" instead of "0x%d"
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
X-List-Received-Date: Tue, 13 Sep 2016 16:14:47 -0000

From: Laurent Vivier <laurent@vivier.eu>

Display an exception number, generally defined as an hexadecimal
number (for instance, EXCP_HLT is 0x10001).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Riku Voipio <riku.voipio@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 6004ece..3ad70f8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -2030,7 +2030,7 @@ void cpu_loop(CPUPPCState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            cpu_abort(cs, "Unknown exception 0x%d. Aborting\n", trapnr);
+            cpu_abort(cs, "Unknown exception 0x%x. Aborting\n", trapnr);
             break;
         }
         process_pending_signals(env);
-- 
2.1.4



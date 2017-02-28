Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibfv-0007DR-OZ
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:54:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibfs-0007A1-MN
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibfr-0005u6-RK
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibfn-0005sW-Ib; Tue, 28 Feb 2017 01:54:11 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9084943588;
	Tue, 28 Feb 2017 09:54:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A32F83D7;
	Tue, 28 Feb 2017 09:45:01 +0300 (MSK)
Received: (nullmailer pid 19631 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:51 +0300
Message-Id: <8ea1d056320dd5bbbd480c45e6cfb8e3689bcc7e.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/14] cadence_gem: Remove unused parameter
 debug message
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
X-List-Received-Date: Tue, 28 Feb 2017 06:54:17 -0000

From: Fam Zheng <famz@redhat.com>

Reported by cppcheck.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e99d454..d4de8ad 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -508,7 +508,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 
     if ((s->num_priority_queues == 1) && s->regs[GEM_ISR]) {
         /* No priority queues, just trigger the interrupt */
-        DB_PRINT("asserting int.\n", i);
+        DB_PRINT("asserting int.\n");
         qemu_set_irq(s->irq[0], 1);
         return;
     }
-- 
2.1.4



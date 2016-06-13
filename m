Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCOcN-000168-Ph
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 05:57:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOcL-00012p-3G
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOcJ-0005Q1-7Q
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:57:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bCOcD-0005PF-CK; Mon, 13 Jun 2016 05:57:05 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC3A441126;
	Mon, 13 Jun 2016 12:57:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1FD24AAB;
	Mon, 13 Jun 2016 12:57:01 +0300 (MSK)
Received: (nullmailer pid 2455 invoked by uid 1000);
	Mon, 13 Jun 2016 09:57:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 12:57:00 +0300
Message-Id: <1465811820-2411-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] arm: spelling fix: mismatch
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
X-List-Received-Date: Mon, 13 Jun 2016 09:57:14 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 862e780..5571ad6 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7354,7 +7354,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          * is unpredictable. Flag this as a guest error.  */
         if (sign != sext) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "AArch32: VTCR.S / VTCR.T0SZ[3] missmatch\n");
+                          "AArch32: VTCR.S / VTCR.T0SZ[3] mismatch\n");
         }
     }
     t1sz = extract32(tcr->raw_tcr, 16, 6);
-- 
2.1.4



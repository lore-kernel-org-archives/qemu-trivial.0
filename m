Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCqx-00069k-DJ
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqq-0005wE-LA
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqm-0000zV-Bk
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCqa-0000vC-Gg; Thu, 27 Mar 2014 12:08:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B6D0E43735;
	Thu, 27 Mar 2014 20:08:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 40A9A685;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1799 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:21 +0400
Message-Id: <1395934108-1694-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/23] hw/intc/openpic: Avoid shifting left
	into sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:25 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid undefined behaviour. This is only strictly
necessary for the 1 << 31 cases; for consistency we extend it
to other constants in the same group.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/openpic.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 7df72f4..be76fbd 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -123,7 +123,7 @@ static FslMpicInfo fsl_mpic_42 = {
 #define TCCR_TOG          0x80000000 /* toggles when decrement to zero */
 
 #define IDR_EP_SHIFT      31
-#define IDR_EP_MASK       (1 << IDR_EP_SHIFT)
+#define IDR_EP_MASK       (1U << IDR_EP_SHIFT)
 #define IDR_CI0_SHIFT     30
 #define IDR_CI1_SHIFT     29
 #define IDR_P1_SHIFT      1
@@ -220,17 +220,17 @@ typedef struct IRQSource {
 } IRQSource;
 
 #define IVPR_MASK_SHIFT       31
-#define IVPR_MASK_MASK        (1 << IVPR_MASK_SHIFT)
+#define IVPR_MASK_MASK        (1U << IVPR_MASK_SHIFT)
 #define IVPR_ACTIVITY_SHIFT   30
-#define IVPR_ACTIVITY_MASK    (1 << IVPR_ACTIVITY_SHIFT)
+#define IVPR_ACTIVITY_MASK    (1U << IVPR_ACTIVITY_SHIFT)
 #define IVPR_MODE_SHIFT       29
-#define IVPR_MODE_MASK        (1 << IVPR_MODE_SHIFT)
+#define IVPR_MODE_MASK        (1U << IVPR_MODE_SHIFT)
 #define IVPR_POLARITY_SHIFT   23
-#define IVPR_POLARITY_MASK    (1 << IVPR_POLARITY_SHIFT)
+#define IVPR_POLARITY_MASK    (1U << IVPR_POLARITY_SHIFT)
 #define IVPR_SENSE_SHIFT      22
-#define IVPR_SENSE_MASK       (1 << IVPR_SENSE_SHIFT)
+#define IVPR_SENSE_MASK       (1U << IVPR_SENSE_SHIFT)
 
-#define IVPR_PRIORITY_MASK     (0xF << 16)
+#define IVPR_PRIORITY_MASK     (0xFU << 16)
 #define IVPR_PRIORITY(_ivprr_) ((int)(((_ivprr_) & IVPR_PRIORITY_MASK) >> 16))
 #define IVPR_VECTOR(opp, _ivprr_) ((_ivprr_) & (opp)->vector_mask)
 
-- 
1.7.10.4



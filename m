Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyO-00062W-F9
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy9-0005Ur-US
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy8-0007n6-Mj
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:53 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZy2-0007gB-Go; Mon, 17 Mar 2014 12:00:46 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004vv-C0; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:36 +0000
Message-Id: <1395072041-18911-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 07/12] hw/intc/openpic: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:55 -0000

Add U suffix to avoid undefined behaviour. This is only strictly
necessary for the 1 << 31 cases; for consistency we extend it
to other constants in the same group.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/openpic.c | 14 +++++++-------
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
1.9.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bb-0005PO-LX
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bR-00054m-4u
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bM-0003Oh-9G
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:09 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:39685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bB-0003JX-Q9; Mon, 10 Mar 2014 15:10:53 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002TN-A8; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:43 +0000
Message-Id: <1394478649-9453-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 07/12] hw/intc/openpic: Avoid shifting left
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
X-List-Received-Date: Mon, 10 Mar 2014 19:11:14 -0000

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/openpic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 7df72f4..cfd7f06 100644
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
@@ -220,7 +220,7 @@ typedef struct IRQSource {
 } IRQSource;
 
 #define IVPR_MASK_SHIFT       31
-#define IVPR_MASK_MASK        (1 << IVPR_MASK_SHIFT)
+#define IVPR_MASK_MASK        (1U << IVPR_MASK_SHIFT)
 #define IVPR_ACTIVITY_SHIFT   30
 #define IVPR_ACTIVITY_MASK    (1 << IVPR_ACTIVITY_SHIFT)
 #define IVPR_MODE_SHIFT       29
-- 
1.9.0



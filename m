Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyQ-00065s-IQ
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZyA-0005WB-J6
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy9-0007nU-3l
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:54 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxy-0007gB-QD; Mon, 17 Mar 2014 12:00:43 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004vr-Ak; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:35 +0000
Message-Id: <1395072041-18911-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 06/12] hw/usb/hcd-ohci.c: Avoid shifting
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

Add U suffix to avoid undefined behaviour. This is only
strictly necessary for the 1<<31 cases, but we add it for the
other constants in these groups for consistency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/hcd-ohci.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 3d35058b..93f186f 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -234,15 +234,15 @@ struct ohci_iso_td {
 #define OHCI_STATUS_OCR       (1<<3)
 #define OHCI_STATUS_SOC       ((1<<6)|(1<<7))
 
-#define OHCI_INTR_SO          (1<<0) /* Scheduling overrun */
-#define OHCI_INTR_WD          (1<<1) /* HcDoneHead writeback */
-#define OHCI_INTR_SF          (1<<2) /* Start of frame */
-#define OHCI_INTR_RD          (1<<3) /* Resume detect */
-#define OHCI_INTR_UE          (1<<4) /* Unrecoverable error */
-#define OHCI_INTR_FNO         (1<<5) /* Frame number overflow */
-#define OHCI_INTR_RHSC        (1<<6) /* Root hub status change */
-#define OHCI_INTR_OC          (1<<30) /* Ownership change */
-#define OHCI_INTR_MIE         (1<<31) /* Master Interrupt Enable */
+#define OHCI_INTR_SO          (1U<<0) /* Scheduling overrun */
+#define OHCI_INTR_WD          (1U<<1) /* HcDoneHead writeback */
+#define OHCI_INTR_SF          (1U<<2) /* Start of frame */
+#define OHCI_INTR_RD          (1U<<3) /* Resume detect */
+#define OHCI_INTR_UE          (1U<<4) /* Unrecoverable error */
+#define OHCI_INTR_FNO         (1U<<5) /* Frame number overflow */
+#define OHCI_INTR_RHSC        (1U<<6) /* Root hub status change */
+#define OHCI_INTR_OC          (1U<<30) /* Ownership change */
+#define OHCI_INTR_MIE         (1U<<31) /* Master Interrupt Enable */
 
 #define OHCI_HCCA_SIZE        0x100
 #define OHCI_HCCA_MASK        0xffffff00
@@ -253,7 +253,7 @@ struct ohci_iso_td {
 #define OHCI_FMI_FSMPS        0xffff0000
 #define OHCI_FMI_FIT          0x80000000
 
-#define OHCI_FR_RT            (1<<31)
+#define OHCI_FR_RT            (1U<<31)
 
 #define OHCI_LS_THRESH        0x628
 
@@ -265,12 +265,12 @@ struct ohci_iso_td {
 #define OHCI_RHA_NOCP         (1<<12)
 #define OHCI_RHA_POTPGT_MASK  0xff000000
 
-#define OHCI_RHS_LPS          (1<<0)
-#define OHCI_RHS_OCI          (1<<1)
-#define OHCI_RHS_DRWE         (1<<15)
-#define OHCI_RHS_LPSC         (1<<16)
-#define OHCI_RHS_OCIC         (1<<17)
-#define OHCI_RHS_CRWE         (1<<31)
+#define OHCI_RHS_LPS          (1U<<0)
+#define OHCI_RHS_OCI          (1U<<1)
+#define OHCI_RHS_DRWE         (1U<<15)
+#define OHCI_RHS_LPSC         (1U<<16)
+#define OHCI_RHS_OCIC         (1U<<17)
+#define OHCI_RHS_CRWE         (1U<<31)
 
 #define OHCI_PORT_CCS         (1<<0)
 #define OHCI_PORT_PES         (1<<1)
-- 
1.9.0



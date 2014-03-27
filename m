Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCqz-0006CV-8z
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:08:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqr-0005yQ-Ho
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCqn-0000zo-7Q
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:08:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCqZ-0000uM-Mg; Thu, 27 Mar 2014 12:08:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A833843733;
	Thu, 27 Mar 2014 20:08:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 640C867B;
	Thu, 27 Mar 2014 19:28:31 +0400 (MSK)
Received: (nullmailer pid 1797 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:20 +0400
Message-Id: <1395934108-1694-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/23] hw/usb/hcd-ohci.c: Avoid shifting left
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
X-List-Received-Date: Thu, 27 Mar 2014 16:08:27 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid undefined behaviour. This is only
strictly necessary for the 1<<31 cases, but we add it for the
other constants in these groups for consistency.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-ohci.c |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 3d35058..93f186f 100644
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
1.7.10.4



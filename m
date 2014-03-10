Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bL-0004vE-HE
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bF-0004hi-0O
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bE-0003MP-8d
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:10:56 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5bA-0003JG-W9; Mon, 10 Mar 2014 15:10:53 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002TJ-8y; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:42 +0000
Message-Id: <1394478649-9453-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 06/12] hw/usb/hcd-ohci.c: Avoid shifting left
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
X-List-Received-Date: Mon, 10 Mar 2014 19:10:58 -0000

Add U suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/hcd-ohci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 3d35058b..9dcfb99 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -242,7 +242,7 @@ struct ohci_iso_td {
 #define OHCI_INTR_FNO         (1<<5) /* Frame number overflow */
 #define OHCI_INTR_RHSC        (1<<6) /* Root hub status change */
 #define OHCI_INTR_OC          (1<<30) /* Ownership change */
-#define OHCI_INTR_MIE         (1<<31) /* Master Interrupt Enable */
+#define OHCI_INTR_MIE         (1U<<31) /* Master Interrupt Enable */
 
 #define OHCI_HCCA_SIZE        0x100
 #define OHCI_HCCA_MASK        0xffffff00
@@ -253,7 +253,7 @@ struct ohci_iso_td {
 #define OHCI_FMI_FSMPS        0xffff0000
 #define OHCI_FMI_FIT          0x80000000
 
-#define OHCI_FR_RT            (1<<31)
+#define OHCI_FR_RT            (1U<<31)
 
 #define OHCI_LS_THRESH        0x628
 
@@ -270,7 +270,7 @@ struct ohci_iso_td {
 #define OHCI_RHS_DRWE         (1<<15)
 #define OHCI_RHS_LPSC         (1<<16)
 #define OHCI_RHS_OCIC         (1<<17)
-#define OHCI_RHS_CRWE         (1<<31)
+#define OHCI_RHS_CRWE         (1U<<31)
 
 #define OHCI_PORT_CCS         (1<<0)
 #define OHCI_PORT_PES         (1<<1)
-- 
1.9.0



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nv3aq-0002zh-Vu
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2022 17:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3ap-0002yY-S9
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:27 -0400
Received: from mout-u-107.mailbox.org ([91.198.250.252]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nv3ao-0006sa-Ax
 for qemu-trivial@nongnu.org; Sat, 28 May 2022 17:03:27 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L9Yzx1Z1fz9sV1;
 Sat, 28 May 2022 23:03:25 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-trivial@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH 3/4] piix_ide_reset: Use pci_set_* functions instead of direct
 access
Date: Sat, 28 May 2022 21:02:49 +0000
Message-Id: <20220528210250.175832-3-lkujaw@member.fsf.org>
In-Reply-To: <20220528210250.175832-1-lkujaw@member.fsf.org>
References: <20220528210250.175832-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4L9Yzx1Z1fz9sV1
Received-SPF: pass client-ip=91.198.250.252;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 28 May 2022 21:03:28 -0000

Eliminates the remaining TODOs in hw/ide/piix.c by:
- Using pci_set_{size} functions to write the PIIX PCI configuration
  space instead of manipulating it directly as an array; and
- Documenting default register values by reference to the controlling
  specification.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/piix.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..76ea8fd9f6 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -21,6 +21,10 @@
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
+ *
+ * References:
+ *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
+ *      290550-002, Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -114,14 +118,11 @@ static void piix_ide_reset(DeviceState *dev)
         ide_bus_reset(&d->bus[i]);
     }
 
-    /* TODO: this is the default. do not override. */
-    pci_conf[PCI_COMMAND] = 0x00;
-    /* TODO: this is the default. do not override. */
-    pci_conf[PCI_COMMAND + 1] = 0x00;
-    /* TODO: use pci_set_word */
-    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
-    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
-    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
+    /* PCI command register default value (0000h) per [1, p.48].  */
+    pci_set_word(pci_conf + PCI_COMMAND, 0x0000);
+    pci_set_word(pci_conf + PCI_STATUS,
+                 PCI_STATUS_DEVSEL_MEDIUM | PCI_STATUS_FAST_BACK);
+    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
 static int pci_piix_init_ports(PCIIDEState *d)
-- 
2.34.1



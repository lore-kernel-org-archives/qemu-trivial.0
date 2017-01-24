Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVy7u-0002og-4V
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:14:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7q-0002kw-SL
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7p-0002cQ-Oj
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVy7l-0002Zn-Ac; Tue, 24 Jan 2017 05:14:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 83A4C42105;
	Tue, 24 Jan 2017 13:14:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 33CB355E;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12618 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:09 +0300
Message-Id: <b7dbb62fdd3e766451f9c72f6d4f6ecaed7386b5.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/31] include: Fix typos found by codespell
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
X-List-Received-Date: Tue, 24 Jan 2017 10:14:56 -0000

From: Stefan Weil <sw@weilnetz.de>

Add also a missing parenthesis in a comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/dma/xlnx_dpdma.h    | 3 ++-
 include/hw/pci-host/q35.h      | 2 +-
 include/hw/register.h          | 2 +-
 include/qapi/dealloc-visitor.h | 2 +-
 include/qemu/qht.h             | 2 +-
 include/qemu/xattr.h           | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
index 664df28..7a304a5 100644
--- a/include/hw/dma/xlnx_dpdma.h
+++ b/include/hw/dma/xlnx_dpdma.h
@@ -53,7 +53,8 @@ typedef struct XlnxDPDMAState XlnxDPDMAState;
  *                             data to the buffer specified by
  *                             dpdma_set_host_data_location().
  *
- * Returns The number of bytes transfered by the DPDMA or 0 if an error occured.
+ * Returns The number of bytes transferred by the DPDMA
+ *         or 0 if an error occurred.
  *
  * @s The DPDMA state.
  * @channel The channel to start.
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 94486fd..53b6760 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -180,7 +180,7 @@ typedef struct Q35PCIHost {
 uint64_t mch_mcfg_base(void);
 
 /*
- * Arbitary but unique BNF number for IOAPIC device.
+ * Arbitrary but unique BNF number for IOAPIC device.
  *
  * TODO: make sure there would have no conflict with real PCI bus
  */
diff --git a/include/hw/register.h b/include/hw/register.h
index 8c12233..5b6dc32 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -92,7 +92,7 @@ struct RegisterInfo {
  * This structure is used to group all of the individual registers which are
  * modeled using the RegisterInfo structure.
  *
- * @r is an aray containing of all the relevent RegisterInfo structures.
+ * @r is an array containing of all the relevant RegisterInfo structures.
  *
  * @num_elements is the number of elements in the array r
  *
diff --git a/include/qapi/dealloc-visitor.h b/include/qapi/dealloc-visitor.h
index b3e5c85..c36715f 100644
--- a/include/qapi/dealloc-visitor.h
+++ b/include/qapi/dealloc-visitor.h
@@ -19,7 +19,7 @@
 typedef struct QapiDeallocVisitor QapiDeallocVisitor;
 
 /*
- * The dealloc visitor is primarly used only by generated
+ * The dealloc visitor is primarily used only by generated
  * qapi_free_FOO() functions, and is the only visitor designed to work
  * correctly in the face of a partially-constructed QAPI tree.
  */
diff --git a/include/qemu/qht.h b/include/qemu/qht.h
index 311139b..56c2c77 100644
--- a/include/qemu/qht.h
+++ b/include/qemu/qht.h
@@ -72,7 +72,7 @@ void qht_destroy(struct qht *ht);
  * In case of successful operation, smp_wmb() is implied before the pointer is
  * inserted into the hash table.
  *
- * Returns true on sucess.
+ * Returns true on success.
  * Returns false if the @p-@hash pair already exists in the hash table.
  */
 bool qht_insert(struct qht *ht, void *p, uint32_t hash);
diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index 83cf98c..a83fe8e 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -14,7 +14,7 @@
 #define QEMU_XATTR_H
 
 /*
- * Modern distributions (e.g. Fedora 15, have no libattr.so, place attr.h
+ * Modern distributions (e.g. Fedora 15), have no libattr.so, place attr.h
  * in /usr/include/sys, and don't have ENOATTR.
  */
 
-- 
2.1.4



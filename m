Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8Bbj-0000dt-K7
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 14:47:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8Bbh-0000ca-FD
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:47:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8Bbg-0004Kv-CC
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:47:25 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:57269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c8Bbb-0004Jb-MQ; Sat, 19 Nov 2016 14:47:19 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 8CCC311810A9;
	Sat, 19 Nov 2016 20:47:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pWfe7VIsxrmN; Sat, 19 Nov 2016 20:47:16 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 1DB5F11810A8;
	Sat, 19 Nov 2016 20:47:16 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 00E7A4677CA; Sat, 19 Nov 2016 20:47:15 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>
Date: Sat, 19 Nov 2016 20:47:15 +0100
Message-Id: <20161119194715.19841-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH for-2.8] include: Fix typos found by codespell
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
X-List-Received-Date: Sat, 19 Nov 2016 19:47:26 -0000

Add also a missing parenthesis in a comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/hw/dma/xlnx_dpdma.h    | 3 ++-
 include/hw/pci-host/q35.h      | 2 +-
 include/hw/register.h          | 2 +-
 include/io/task.h              | 2 +-
 include/qapi/dealloc-visitor.h | 2 +-
 include/qemu/qht.h             | 2 +-
 include/qemu/xattr.h           | 2 +-
 7 files changed, 8 insertions(+), 7 deletions(-)

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
diff --git a/include/io/task.h b/include/io/task.h
index 42028cb..6810842 100644
--- a/include/io/task.h
+++ b/include/io/task.h
@@ -231,7 +231,7 @@ void qio_task_complete(QIOTask *task);
  *
  * Mark the operation as failed, with @err providing
  * details about the failure. The @err may be freed
- * afer the function returns, as the notification
+ * after the function returns, as the notification
  * callback is invoked synchronously. The @task will
  * be freed when this call completes.
  */
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
2.10.2



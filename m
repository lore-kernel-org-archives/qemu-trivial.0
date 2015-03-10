Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVHVW-0002zP-NF
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 06:35:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YVHVP-0002ry-NI
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:35:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YVHVA-0001SG-HW
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:35:19 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:56199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YVHVA-0001Ra-C3
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 06:35:04 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 10 Mar 2015 06:35:03 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 10 Mar 2015 06:35:01 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
	[9.57.198.23])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 2B541C90041;
	Tue, 10 Mar 2015 06:26:11 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2AAYqKx12845072; Tue, 10 Mar 2015 10:35:00 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2AAYSAh019837; Tue, 10 Mar 2015 06:34:28 -0400
Received: from localhost.localdomain (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2AAYR2l019283; Tue, 10 Mar 2015 06:34:27 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: mst@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 06:34:01 -0400
Message-Id: <1425983641-216781-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031010-0033-0000-0000-0000020B9915
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.182.139
Cc: Stefan Berger <stefanb@us.ibm.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] tpm: Move memory subregion function into
	realize function
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
X-List-Received-Date: Tue, 10 Mar 2015 10:35:24 -0000

From: Stefan Berger <stefanb@us.ibm.com>

Move the memory subregion function into the DeviceClass realize function
due to isa_address_space (now) crashing if called in the instance init
function.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_tis.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index d0bb97f..9084ca4 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -959,18 +959,18 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
     tis->bh = qemu_bh_new(tpm_tis_receive_bh, s);
 
     isa_init_irq(&s->busdev, &tis->irq, tis->irq_num);
+
+    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
+                                TPM_TIS_ADDR_BASE, &s->mmio);
 }
 
 static void tpm_tis_initfn(Object *obj)
 {
-    ISADevice *dev = ISA_DEVICE(obj);
     TPMState *s = TPM(obj);
 
     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
                           s, "tpm-tis-mmio",
                           TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
-    memory_region_add_subregion(isa_address_space(dev), TPM_TIS_ADDR_BASE,
-                                &s->mmio);
 }
 
 static void tpm_tis_class_init(ObjectClass *klass, void *data)
-- 
2.1.0



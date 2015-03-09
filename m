Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV7Sk-00022h-Iy
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 19:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YV7Sh-00022W-Sz
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 19:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YV7Sc-0004S7-Lk
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 19:51:51 -0400
Received: from e33.co.us.ibm.com ([32.97.110.151]:36006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YV7Sc-0004Rr-FI
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 19:51:46 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:51:44 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:51:43 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com
	(b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id A22503E4003B;
	Mon,  9 Mar 2015 17:51:42 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29NpaUi31654122; Mon, 9 Mar 2015 16:51:36 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t29Npgm6018643; Mon, 9 Mar 2015 17:51:42 -0600
Received: from localhost.localdomain (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t29NpfsR018635; Mon, 9 Mar 2015 17:51:41 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: mst@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon,  9 Mar 2015 19:51:39 -0400
Message-Id: <1425945099-215293-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030923-0009-0000-0000-0000095C8711
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.151
Cc: Stefan Berger <stefanb@us.ibm.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] tpm: Move memory initialization into realize
	function
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
X-List-Received-Date: Mon, 09 Mar 2015 23:51:52 -0000

From: Stefan Berger <stefanb@us.ibm.com>

Move the memory initialization into the DeviceClass realize function due to
isa_address_space crashing if called in the instance init function.
A recent change must have changed the order in which structures are
initialized so that this move is now necessary.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_tis.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index d0bb97f..339e1bf 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -959,18 +959,12 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
     tis->bh = qemu_bh_new(tpm_tis_receive_bh, s);
 
     isa_init_irq(&s->busdev, &tis->irq, tis->irq_num);
-}
-
-static void tpm_tis_initfn(Object *obj)
-{
-    ISADevice *dev = ISA_DEVICE(obj);
-    TPMState *s = TPM(obj);
 
     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
                           s, "tpm-tis-mmio",
                           TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
-    memory_region_add_subregion(isa_address_space(dev), TPM_TIS_ADDR_BASE,
-                                &s->mmio);
+    memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
+                                TPM_TIS_ADDR_BASE, &s->mmio);
 }
 
 static void tpm_tis_class_init(ObjectClass *klass, void *data)
@@ -987,7 +981,6 @@ static const TypeInfo tpm_tis_info = {
     .name = TYPE_TPM_TIS,
     .parent = TYPE_ISA_DEVICE,
     .instance_size = sizeof(TPMState),
-    .instance_init = tpm_tis_initfn,
     .class_init  = tpm_tis_class_init,
 };
 
-- 
2.1.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ycxjg-0000ht-W5
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 11:05:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Ycxja-0000aP-FO
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcxjL-0008Ib-7r
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:05:42 -0400
Received: from e32.co.us.ibm.com ([32.97.110.150]:57026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcxjK-0008ID-Ps
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 11:05:26 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 09:05:25 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 09:05:22 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
	(b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9F6C019D8040;
	Tue, 31 Mar 2015 08:56:27 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VF5P7E41418938; Tue, 31 Mar 2015 08:05:26 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VF5Kw5014885; Tue, 31 Mar 2015 09:05:20 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VF5JJv014784; Tue, 31 Mar 2015 09:05:19 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Tue, 31 Mar 2015 11:05:18 -0400
Message-Id: <1427814318-541552-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033115-0005-0000-0000-000009C93251
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.150
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] tpm_tis: fix format for 64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 15:05:47 -0000

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_tis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 815c8ea..3f42982 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
             tis->loc[locty].state == TPM_TIS_STATE_COMPLETION) {
             /* drop the byte */
         } else {
-            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=%d)\n",
+            DPRINTF("tpm_tis: Data to send to TPM: 0x%08" PRIx64 " (size=%d)\n",
                     val, size);
             if (tis->loc[locty].state == TPM_TIS_STATE_READY) {
                 tis->loc[locty].state = TPM_TIS_STATE_RECEPTION;
-- 
1.9.3



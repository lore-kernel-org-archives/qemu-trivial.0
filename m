Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YcwGb-0002Be-5k
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 09:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcwGZ-00026m-9V
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 09:31:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcwGV-0000GU-2A
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 09:31:39 -0400
Received: from e39.co.us.ibm.com ([32.97.110.160]:39882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1YcwGU-0000GH-Rt
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 09:31:34 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 07:27:56 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 07:27:39 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com
	(b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 3AE561FF0021;
	Tue, 31 Mar 2015 07:18:39 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VDRE6r34537484; Tue, 31 Mar 2015 06:27:14 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VDRP0r010870; Tue, 31 Mar 2015 07:27:26 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VDRLp6010437; Tue, 31 Mar 2015 07:27:23 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Tue, 31 Mar 2015 09:27:17 -0400
Message-Id: <1427808437-535644-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033113-0033-0000-0000-00000418AC73
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.160
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] tpm_tis: fix format for 64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 13:31:40 -0000

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_tis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 815c8ea..52e0148 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque, hwaddr addr,
             tis->loc[locty].state == TPM_TIS_STATE_COMPLETION) {
             /* drop the byte */
         } else {
-            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=%d)\n",
+            DPRINTF("tpm_tis: Data to send to TPM: %08lx (size=%d)\n",
                     val, size);
             if (tis->loc[locty].state == TPM_TIS_STATE_READY) {
                 tis->loc[locty].state = TPM_TIS_STATE_RECEPTION;
-- 
1.9.3



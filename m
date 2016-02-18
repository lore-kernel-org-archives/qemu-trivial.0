Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWPlO-0007ik-R7
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2016 09:41:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWPlJ-0007bt-FV
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 09:40:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWPlG-00017C-3e
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 09:40:57 -0500
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:37339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aWPlF-00015O-Fe
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 09:40:54 -0500
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Thu, 18 Feb 2016 14:40:50 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 18 Feb 2016 14:40:48 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org; qemu-ppc@nongnu.org;
	qemu-trivial@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id EEF6517D8056; 
	Thu, 18 Feb 2016 14:41:06 +0000 (GMT)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1IEem4d5702108; Thu, 18 Feb 2016 14:40:48 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1IEelJk023846; Thu, 18 Feb 2016 07:40:47 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1IEek68023814; Thu, 18 Feb 2016 07:40:46 -0700
Received: from bahia.huguette.org (sig-9-79-65-117.de.ibm.com [9.79.65.117])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id D67BA220328;
	Thu, 18 Feb 2016 15:40:45 +0100 (CET)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 18 Feb 2016 15:40:45 +0100
Message-ID: <20160218144045.7349.67293.stgit@bahia.huguette.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021814-0009-0000-0000-000007AEED31
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] spapr: initialize local Error pointer
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
X-List-Received-Date: Thu, 18 Feb 2016 14:41:00 -0000

This fixes a crash in the target QEMU during migration.

Fixes: c5f54f3e31bf693f70a98d4d73ea5dbe05689857
Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 hw/ppc/spapr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e214a34257b3..c119f5582429 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1528,7 +1528,7 @@ static int htab_load(QEMUFile *f, void *opaque, int version_id)
     section_hdr = qemu_get_be32(f);
 
     if (section_hdr) {
-        Error *local_err;
+        Error *local_err = NULL;
 
         /* First section gives the htab size */
         spapr_reallocate_hpt(spapr, section_hdr, &local_err);



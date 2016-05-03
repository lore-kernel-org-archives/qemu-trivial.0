Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axVbr-0005Mg-LS
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 04:23:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1axVbj-00053M-Ut
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 04:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1axVbP-00065y-K4
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 04:22:58 -0400
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:38758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1axVbP-0005gp-9i
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 04:22:43 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Tue, 3 May 2016 09:22:05 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 3 May 2016 09:22:03 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2E8E4219005E; 
	Tue,  3 May 2016 09:21:39 +0100 (BST)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u438M2Jh6422952; Tue, 3 May 2016 08:22:02 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u438M231005512; Tue, 3 May 2016 04:22:02 -0400
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u438M2ID005499; Tue, 3 May 2016 04:22:02 -0400
Received: from bahia.huguette.org (sig-9-83-39-223.evts.uk.ibm.com
	[9.83.39.223])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 6D99322007E;
	Tue,  3 May 2016 10:22:01 +0200 (CEST)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Date: Tue, 03 May 2016 10:22:00 +0200
Message-ID: <146226372069.2827.10871082115775209236.stgit@bahia.huguette.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050308-0009-0000-0000-000016BB1D56
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Subject: [Qemu-trivial] [PATCH] 9p: drop unused declaration from coth.h
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
X-List-Received-Date: Tue, 03 May 2016 08:23:10 -0000

Commit "ebac1202c95a virtio-9p: use QEMU thread pool" dropped function
v9fs_init_worker_threads.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 hw/9pfs/coth.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index 209fc6a9afbc..a911cbb16589 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -47,7 +47,6 @@
     } while (0)
 
 extern void co_run_in_worker_bh(void *);
-extern int v9fs_init_worker_threads(void);
 extern int v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
 extern int v9fs_co_readdir_r(V9fsPDU *, V9fsFidState *,
                            struct dirent *, struct dirent **result);



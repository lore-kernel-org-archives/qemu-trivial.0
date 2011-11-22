Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnIA-0000Yg-1f
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:09:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnI3-0007Nv-DR
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHY-0006Ya-Ri
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:09:12 -0500
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:60692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHX-00061B-T7
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:52 -0500
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:26 +0530
Received: from d28relay03.in.ibm.com ([9.184.220.60])
	by e28smtp04.in.ibm.com ([192.168.1.134]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:22 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7MH43043564; Tue, 22 Nov 2011 15:37:22 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7L6t027934; Tue, 22 Nov 2011 21:07:22 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0N026400; Tue, 22 Nov 2011 21:07:20 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:20 +0800
Message-Id: <1321956386-12004-5-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-5564-0000-0000-0000003477D9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.4
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 05/11] fix spelling in scripts sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:09:29 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 scripts/checkpatch.pl |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7a71324..970e395 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1901,7 +1901,7 @@ sub process {
 # printk should use KERN_* levels.  Note that follow on printk's on the
 # same line do not need a level, so we use the current block context
 # to try and find and validate the current printk.  In summary the current
-# printk includes all preceeding printk's which have no newline on the end.
+# printk includes all preceding printk's which have no newline on the end.
 # we assume the first bad printk is the one to report.
 		if ($line =~ /\bprintk\((?!KERN_)\s*"/) {
 			my $ok = 0;
-- 
1.7.5.4



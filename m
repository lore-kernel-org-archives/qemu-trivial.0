Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQyUS-0001pY-3B
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 08:28:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUM-0001br-9j
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUB-0007dE-Hd
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:26 -0500
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:38458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YQyUB-0007cO-8C
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 08:28:15 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 26 Feb 2015 13:28:12 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 26 Feb 2015 13:28:10 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 943141B0806B; 
	Thu, 26 Feb 2015 13:28:25 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1QDS9bj11796874; Thu, 26 Feb 2015 13:28:10 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1QDS9UZ032658; Thu, 26 Feb 2015 06:28:09 -0700
Received: from oc7435384737.ibm.com (sig-9-79-14-249.uk.ibm.com [9.79.14.249])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1QDS8Wr032630; Thu, 26 Feb 2015 06:28:08 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 26 Feb 2015 14:28:05 +0100
Message-Id: <1424957288-24408-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15022613-0009-0000-0000-000003463201
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.108
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v3 0/3] Remove unused functions
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
X-List-Received-Date: Thu, 26 Feb 2015 13:28:31 -0000

There are quite a lot of completely unused functions scattered
around in the QEMU sources - here are some patches to remove at
least some of them.

I've limited the patches now to the ones which have been ack'ed
by the corresponding subsystem maintainers, so it should be
really save now to apply these patches (I'll maybe re-post the
other patches later again for further discusison).

Michael, can you take these through your trivial-patches repository?

Thomas Huth (3):
  ui: Removed unused functions
  ui/vnc: Remove vnc_stop_worker_thread()
  xen: Remove xen_cmos_set_s3_resume()

 include/hw/xen/xen.h |    1 -
 include/ui/console.h |    3 ---
 ui/console.c         |   12 ------------
 ui/d3des.c           |    9 ---------
 ui/d3des.h           |    6 ------
 ui/input-legacy.c    |    6 ------
 ui/vnc-jobs.c        |   13 -------------
 ui/vnc-jobs.h        |    1 -
 xen-hvm-stub.c       |    4 ----
 9 files changed, 0 insertions(+), 55 deletions(-)



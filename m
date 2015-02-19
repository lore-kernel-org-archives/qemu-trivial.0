Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOUeb-0005lY-Lm
	for mharc-qemu-trivial@gnu.org; Thu, 19 Feb 2015 12:12:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeS-0005fa-3o
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007LB-FM
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:36 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:49626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YOUeM-0007IO-5o
	for qemu-trivial@nongnu.org; Thu, 19 Feb 2015 12:12:30 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 19 Feb 2015 17:12:26 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 19 Feb 2015 17:12:25 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id F12A417D8042; 
	Thu, 19 Feb 2015 17:12:38 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1JHCOM96226374; Thu, 19 Feb 2015 17:12:24 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1JHCOhY013638; Thu, 19 Feb 2015 10:12:24 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-69.boeblingen.de.ibm.com
	[9.152.224.69])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1JHCNs3013629; Thu, 19 Feb 2015 10:12:23 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 19 Feb 2015 18:12:18 +0100
Message-Id: <1424365943-27563-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021917-0017-0000-0000-00000318E7F8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 0/5] Remove unused functions
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
X-List-Received-Date: Thu, 19 Feb 2015 17:12:44 -0000

There are quite a lot of completely unused functions scattered
around in the QEMU sources - here are some patches to remove at
least some of them.

v2:
- Incorporated review feedback to keep the functions that still might
  be usefull (e.g. dropped the patch to remove unused functions in the
  block layer)
- Added a patch to remove xen_cmos_set_s3_resume()

Thomas Huth (5):
  migration: Remove unused functions
  ui: Removed unused functions
  ui/vnc: Remove vnc_stop_worker_thread()
  util: Remove unused functions
  xen: Remove xen_cmos_set_s3_resume()

 arch_init.c                   |   10 ------
 include/hw/xen/xen.h          |    1 -
 include/migration/migration.h |    3 --
 include/migration/qemu-file.h |    2 -
 include/qemu-common.h         |    4 --
 include/qemu/compatfd.h       |    1 -
 include/ui/console.h          |    3 --
 migration/migration.c         |    9 -----
 migration/qemu-file-buf.c     |   53 ---------------------------------
 ui/console.c                  |   12 -------
 ui/d3des.c                    |    9 -----
 ui/d3des.h                    |    6 ----
 ui/input-legacy.c             |    6 ----
 ui/vnc-jobs.c                 |   13 --------
 ui/vnc-jobs.h                 |    1 -
 util/compatfd.c               |   19 ------------
 util/osdep.c                  |   66 -----------------------------------------
 xen-hvm-stub.c                |    4 --
 18 files changed, 0 insertions(+), 222 deletions(-)



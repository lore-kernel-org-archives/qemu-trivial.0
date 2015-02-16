Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNTQI-0007VK-1S
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 16:41:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQC-0007MF-FK
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQ8-0007Du-V9
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:40 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:40380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YNTQ8-0007Bl-Lo
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 16:41:36 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 16 Feb 2015 21:41:35 -0000
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 16 Feb 2015 21:41:34 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 31052219004D; 
	Mon, 16 Feb 2015 21:41:28 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t1GLfXpT55902300; Mon, 16 Feb 2015 21:41:33 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t1GLfXxG015852; Mon, 16 Feb 2015 14:41:33 -0700
Received: from oc7435384737.ibm.com (sig-9-81-72-150.evts.uk.ibm.com
	[9.81.72.150])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t1GLfWRV015849; Mon, 16 Feb 2015 14:41:32 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 16 Feb 2015 22:41:27 +0100
Message-Id: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15021621-0017-0000-0000-0000030EE9A7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 0/4] Remove unused functions
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
X-List-Received-Date: Mon, 16 Feb 2015 21:41:44 -0000

There are quite a lot of completely unused functions scattered
around in the QEMU sources - here are some patches to remove at
least some of them.

Thomas Huth (4):
  migration: Remove unused functions
  ui/console: Removed unused functions
  util: Remove unused functions
  block: Remove unused functions

 arch_init.c                   |   10 ----
 block.c                       |   11 ----
 include/block/block.h         |    1 -
 include/block/nbd.h           |    1 -
 include/migration/migration.h |    3 -
 include/migration/qemu-file.h |    2 -
 include/qemu-common.h         |    4 --
 include/qemu/compatfd.h       |    1 -
 include/qemu/option.h         |    2 -
 include/ui/console.h          |   11 ----
 include/ui/input.h            |    1 -
 include/ui/qemu-pixman.h      |    3 -
 migration/migration.c         |    9 ----
 migration/qemu-file-buf.c     |   53 ---------------------
 nbd.c                         |    9 ----
 ui/console.c                  |  103 -----------------------------------------
 ui/d3des.c                    |    9 ----
 ui/d3des.h                    |    6 --
 ui/input-legacy.c             |    6 --
 ui/input.c                    |    7 ---
 ui/qemu-pixman.c              |   19 --------
 ui/vnc-jobs.c                 |   13 -----
 ui/vnc-jobs.h                 |    1 -
 util/compatfd.c               |   19 --------
 util/osdep.c                  |   66 --------------------------
 util/qemu-option.c            |    6 --
 26 files changed, 0 insertions(+), 376 deletions(-)



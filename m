Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG5Uw-0007bs-80
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 07:44:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YG5H0-0001ZO-Vy
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 07:29:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YG4zV-0007JH-AM
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 07:11:48 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:39190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YG4zV-0007IV-1e
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 07:11:33 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Tue, 27 Jan 2015 12:11:30 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 27 Jan 2015 12:11:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id C5C331B08070; 
	Tue, 27 Jan 2015 12:11:31 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t0RCBR7E3932654; Tue, 27 Jan 2015 12:11:27 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t0RCBRiv009550; Tue, 27 Jan 2015 05:11:27 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-42.boeblingen.de.ibm.com
	[9.152.224.42])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t0RCBQRq009527; Tue, 27 Jan 2015 05:11:26 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 27 Jan 2015 13:11:26 +0100
Message-Id: <1422360686-5895-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15012712-0029-0000-0000-0000031D8C99
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Subject: [Qemu-trivial] [PATCH] qemu-log: Correct help text of 'log
	cpu_reset'
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
X-List-Received-Date: Tue, 27 Jan 2015 12:44:00 -0000

The logging of the CPU state during reset is done for all architectures
nowadays (see cpu_common_reset() in qom/cpu.c), so the "x86 only" text
does not apply here anymore.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 qemu-log.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-log.c b/qemu-log.c
index 05b5493..13f3813 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -111,7 +111,7 @@ const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_PCALL, "pcall",
       "x86 only: show protected mode far calls/returns/exceptions" },
     { CPU_LOG_RESET, "cpu_reset",
-      "x86 only: show CPU state before CPU resets" },
+      "show CPU state before CPU resets" },
     { CPU_LOG_IOPORT, "ioport",
       "show all i/o ports accesses" },
     { LOG_UNIMP, "unimp",
-- 
1.7.1



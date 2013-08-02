Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5MnK-00073o-R0
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 17:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1V5MnF-0006xG-8y
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 17:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1V5GXT-0006Kj-Ie
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:41:17 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:34787
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1V5En1-00084D-6F; Fri, 02 Aug 2013 08:49:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5EACC2658BBC;
	Fri,  2 Aug 2013 14:48:32 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCgyw7EndEQk; Fri,  2 Aug 2013 14:48:32 +0200 (CEST)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4CF242658BB9;
	Fri,  2 Aug 2013 14:48:32 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Fri,  2 Aug 2013 14:48:28 +0200
Message-Id: <1375447708-14545-2-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] Add ARM registers definitions in Monitor
	commands
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
X-List-Received-Date: Fri, 02 Aug 2013 21:21:54 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 monitor.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/monitor.c b/monitor.c
index 5dc0aa9..78e93af 100644
--- a/monitor.c
+++ b/monitor.c
@@ -3167,6 +3167,23 @@ static const MonitorDef monitor_defs[] = {
     { "cleanwin", offsetof(CPUSPARCState, cleanwin) },
     { "fprs", offsetof(CPUSPARCState, fprs) },
 #endif
+#elif defined(TARGET_ARM)
+    { "r0",     offsetof(CPUARMState, regs[0])  },
+    { "r1",     offsetof(CPUARMState, regs[1])  },
+    { "r2",     offsetof(CPUARMState, regs[2])  },
+    { "r3",     offsetof(CPUARMState, regs[3])  },
+    { "r4",     offsetof(CPUARMState, regs[4])  },
+    { "r5",     offsetof(CPUARMState, regs[5])  },
+    { "r6",     offsetof(CPUARMState, regs[6])  },
+    { "r7",     offsetof(CPUARMState, regs[7])  },
+    { "r8",     offsetof(CPUARMState, regs[8])  },
+    { "r9",     offsetof(CPUARMState, regs[9])  },
+    { "r10",    offsetof(CPUARMState, regs[10]) },
+    { "r11",    offsetof(CPUARMState, regs[11]) },
+    { "r12",    offsetof(CPUARMState, regs[12]) },
+    { "r13|sp", offsetof(CPUARMState, regs[13]) },
+    { "r14|lr", offsetof(CPUARMState, regs[14]) },
+    { "r15|pc", offsetof(CPUARMState, regs[15]) },
 #endif
     { NULL },
 };
-- 
1.7.9.5



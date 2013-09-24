Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOVlP-0004TV-Ds
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 12:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVlJ-0004JJ-PF
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVlC-0006A2-RO
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:46:57 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:43995
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VOVl0-0005sB-5h; Tue, 24 Sep 2013 12:46:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A04282666378;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VifLjIN48Emj; Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 8FD8E2666379;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Tue, 24 Sep 2013 18:46:01 +0200
Message-Id: <1380041161-13266-4-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, afaerber@suse.de,
	lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 3/3] Add ARM registers definitions in Monitor
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
X-List-Received-Date: Tue, 24 Sep 2013 16:47:02 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 monitor.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/monitor.c b/monitor.c
index 74f3f1b..e40c20d 100644
--- a/monitor.c
+++ b/monitor.c
@@ -3351,6 +3351,23 @@ static const MonitorDef monitor_defs[] = {
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



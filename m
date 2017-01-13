Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cSINH-0001r3-VX
	for mharc-qemu-trivial@gnu.org; Sat, 14 Jan 2017 02:03:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9to-00036q-Ed
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 17:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9tn-0005Hu-Eb
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 17:00:40 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1cS9th-0005H1-Nt; Fri, 13 Jan 2017 17:00:33 -0500
Received: by mail-pf0-x244.google.com with SMTP id 127so9929932pfg.0;
	Fri, 13 Jan 2017 14:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5QQ9kphs1sJGQ9/hVBW7cBXU275aqNskdhbtXgg8vgo=;
	b=VZjTE08XoLIVOMhaSd5BZVPFtqE9QLx5MPB3CnxsZ3Bie2kwlAlptkFwqXo7mQWjlm
	mElEW8BDm1u3RWSbqfOdt+Rk3nMfqTu6RkGrepwAeX/GxlhY5H5Az0h0aUreMdvvTF3w
	rH+RBYt60XeCcciDLFUcZrB9uWz4+NoQG7gqaSqVc9JhfS5655oY/TGDAd8tvbCeuhCJ
	f6jLnk3mhuBZcDniMax1t05KEqOKJg1EVWuYGzxQ6I/Aba9rWcMA9MOoyeOyvgeYaC9z
	YdwRq6KdedE9E0PKycL+bwr4G+hIZ1QT6Qs/qAnhENN4Ybn9AmBzmAc2J6T+XIuwkkDT
	38cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5QQ9kphs1sJGQ9/hVBW7cBXU275aqNskdhbtXgg8vgo=;
	b=ba0TsCVGckHD78yAivopJ8v4sFAHWDevnV40XythGAsBDqqKf4fmaphQm/a81U1YS2
	F7EMxjwe/VnfZY6D8bOwi9lnrVb0wqYuFNo6Vmx6SMeGFV+0Fh6Y0GaftwIpJD2CjT8B
	ZyI2DGH1VNMNLEHrItx8OBe7dLGS54ptnwc14Ps9oV55zJwxsBIKAtxyE2sPzCLaQuqm
	rg8ZgEz65BbeUorrgxIiI8Gc4g/qKCc2owGdPwjZAw3PRU7pjPAXsbDEm6QQO/TtCtir
	EX39X/HbP9HrdMrVMJ3ZHDGrGWTcSOFeEJSaSf/s5leKbZITdTVSvY5e0PLMEh0gKrWu
	hszA==
X-Gm-Message-State: AIkVDXIUqZUUvUY6zd5G+MB+pDKZ0spn2Dk59UFvDV4toLsMwTpbhak0/5T8ejMgIw1jUQ==
X-Received: by 10.84.195.1 with SMTP id i1mr32656408pld.84.1484344832834;
	Fri, 13 Jan 2017 14:00:32 -0800 (PST)
Received: from localhost (z192.220-213-15.ppp.wakwak.ne.jp. [220.213.15.192])
	by smtp.gmail.com with ESMTPSA id
	c71sm31570485pga.22.2017.01.13.14.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 Jan 2017 14:00:32 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Jia Liu <proljc@gmail.com>,
	qemu-devel@nongnu.org
Cc: Stafford Horne <shorne@gmail.com>, qemu-trivial@nongnu.org,
	openrisc@lists.librecores.org
Date: Sat, 14 Jan 2017 07:00:28 +0900
Message-Id: <20170113220028.29687-1-shorne@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Sat, 14 Jan 2017 02:03:39 -0500
Subject: [Qemu-trivial] [PATCH] target-openrisc: Fix exception handling
 status registers
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
X-List-Received-Date: Fri, 13 Jan 2017 22:00:42 -0000

I am working on testing instruction emulation patches for the linux
kernel. During testing I found these 2 issues:

 - sets DSX (delay slot exception) but never clears it
 - EEAR for illegal insns should point to the bad exception (as per
   openrisc spec) but its not

This patch fixes these two issues by clearing the DSX flag when not in a
delay slot and by setting EEAR to exception PC when handling illegal
instruction exceptions.

After this patch the openrisc kernel with latest patches boots great on
qemu and instruction emulation works.

Cc: qemu-trivial@nongnu.org
Cc: openrisc@lists.librecores.org
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/interrupt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 5fe3f11..e1b0142 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -38,10 +38,17 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
         env->flags &= ~D_FLAG;
         env->sr |= SR_DSX;
         env->epcr -= 4;
+    } else {
+        env->sr &= ~SR_DSX;
     }
     if (cs->exception_index == EXCP_SYSCALL) {
         env->epcr += 4;
     }
+    /* When we have an illegal instruction the error effective address
+       shall be set to the illegal instruction address.  */
+    if (cs->exception_index == EXCP_ILLEGAL) {
+        env->eear = env->pc;
+    }
 
     /* For machine-state changed between user-mode and supervisor mode,
        we need flush TLB when we enter&exit EXCP.  */
-- 
2.9.3



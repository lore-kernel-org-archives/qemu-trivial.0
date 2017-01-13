Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cSINI-0001rQ-7u
	for mharc-qemu-trivial@gnu.org; Sat, 14 Jan 2017 02:03:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9r2-0000e8-Ay
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 16:57:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1cS9qy-0004MR-CJ
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 16:57:48 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>) id 1cS9qy-0004Kd-6X
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2017 16:57:44 -0500
Received: by mail-pf0-x244.google.com with SMTP id b22so9905881pfd.3
	for <qemu-trivial@nongnu.org>; Fri, 13 Jan 2017 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5QQ9kphs1sJGQ9/hVBW7cBXU275aqNskdhbtXgg8vgo=;
	b=FnPSFAuQcAKY7QtFMH6Hynar3ydj9ql9UdstWInAUH/KIvzJPC6fCpcW2S5esJAh3+
	6y1e7FAma6r0juXTKa+7DOm62MCsfvogsaCQgGGDl42OHeQkhUBOlBDTnuxkqQshIZZG
	Ru8Ar+/4vDbv0H397zAwGpBIzoJe5GoDiduvC+tD4Ba/JuBv34mgW1Mm0AKZMmxwJ0cB
	Jo6J7jNnSNd8y2aXhF57Sh0JiAoafI6O+w4OXF9v3sUopJUTrjsYfcGFrMJhS4FQXEV7
	fBWiI8+W6XgzhX0LacZlyERMfRxTEnjCI4kr8hZhIZ1e5BYURlaGx2pE4B+jCmn4fjH1
	V6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5QQ9kphs1sJGQ9/hVBW7cBXU275aqNskdhbtXgg8vgo=;
	b=nnsz7WCH52uM4t6RP0knPF0FEVOicHp7pymdqgfPm7LBIxIZXu5OeLlGfEUwMf1pPY
	l9mzgNFEFNwiHd+p4Nskxrst3kK9rGmjW3zIhwCSWuiwSuedkxBfBhQrormeoHl/wnxh
	brHdzsDTmEGpOREAJCuaMwXFSUUSfvJ/V4JERcnLycaqWlN6LGa6jTXHCDkprGN/Hx5R
	7ts1PPGLXY+nebP5x1ruENVomy69iJr82r3BvmYrjAwtrxP+neoqcdHNH35arO2GLFpa
	9j1vkI/iCF2pC+NsPihcHZbGS5vBVwLhSo165fz1VY4+raKugAHqJhrdVaOOE/jVJkJV
	PN8g==
X-Gm-Message-State: AIkVDXKzgR+1CZD+Wl6q3v+AYTyB3L2n7/bZyHQVyXrt8YGuT+c9FBVmpTQ0xqN7+p4cnQ==
X-Received: by 10.98.63.210 with SMTP id z79mr25249410pfj.134.1484344662714;
	Fri, 13 Jan 2017 13:57:42 -0800 (PST)
Received: from localhost (z192.220-213-15.ppp.wakwak.ne.jp. [220.213.15.192])
	by smtp.gmail.com with ESMTPSA id
	y6sm31578960pge.16.2017.01.13.13.57.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 Jan 2017 13:57:42 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Jia Liu <proljc@gmail.com>,
	qemu-devel@nongnu.or
Cc: Stafford Horne <shorne@gmail.com>, qemu-trivial@nongnu.org,
	openrisc@lists.librecores.org
Date: Sat, 14 Jan 2017 06:57:20 +0900
Message-Id: <20170113215720.29598-1-shorne@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Sat, 14 Jan 2017 02:03:38 -0500
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
X-List-Received-Date: Fri, 13 Jan 2017 21:57:49 -0000

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



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdO8X-0004jV-L9
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 16:26:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cdO8U-0004fZ-D0
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 16:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cdO8T-0001K2-AN
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 16:26:14 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cdO8N-0001GO-9g; Mon, 13 Feb 2017 16:26:07 -0500
Received: by mail-qk0-x241.google.com with SMTP id p22so8992314qka.3;
	Mon, 13 Feb 2017 13:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PS1yzg2qNpHqbKcSDEtwXDj1vGrkbgQT/QK32kQ9bxs=;
	b=aiooAvjPVcvba/rBOUFL9s6N/hoGIZGz1gwx65ScHFNX5rcPYRyS7OEcmvy2tTCmXw
	/4apqXtB2DK8jIkjXHRJAmUs8KTbce6PV/RcaftVWbTG4PodtyIMxkmM0wAhufqo6O5y
	rVwWMxJ6vR9OM9Pbz0Qj3WdV0EfNvLQ32AcL3+U3FpW8zuXdtu5cc4x+stRMciTSkDzy
	rCTQwtb/t0+4H7/mMF0fkzi6OPRPCo8yVfL+88j3kqWO3sOseS7c2JjvzmKVv3P0EPoS
	bv9CWlnwT+oYSF9pIeRuoB5Rd7fgC1IEnzkw4HFp0A8TKpdGa90ABcRLwB64owo1FSOX
	DeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=PS1yzg2qNpHqbKcSDEtwXDj1vGrkbgQT/QK32kQ9bxs=;
	b=fN3kPsVgBPz5cdXdE84zo0Q6Cbh4or1+Lqiq9JIcWq+7awA0y5Xxrw4JHunmpShL4W
	yytWYi12J1Rz0RYhETFFpc4XnUO0I6sAj9s7L8UcEeWngmnvLCvebGKNMMo+ZDhE7oju
	Bhb1n1c7BF8HcaXI6dF3793A3oRDbgUyPIfidykX9BtzWvUJLdv9MvmE3oQLHJrKKTF+
	GrTNrqpL9CEfBapZ3GJqmnMDqxfjHqK8Y7wCtzpEkDPd/WH87x3oJqZ+8CT0Vh9L8YeV
	l7QOsSfcVj2cI6yL4xm8iN3nKxYY5jZQE9CZxS3d/ChpKURID1VfsyVEduUwKCB6Bf+r
	sErA==
X-Gm-Message-State: AMke39n+fQm6YdA5mfwyJETJVREHCfxbQumXztVP/5kjSF+etG+k9/jcHr1Dr8XAISnMwQ==
X-Received: by 10.55.67.77 with SMTP id q74mr22935329qka.127.1487021166788;
	Mon, 13 Feb 2017 13:26:06 -0800 (PST)
Received: from bigtime.twiddle.net.com ([1.129.9.91])
	by smtp.gmail.com with ESMTPSA id h40sm8311480qtb.6.2017.02.13.13.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 13:26:06 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stafford Horne <shorne@gmail.com>,
	qemu-trivial@nongnu.org, openrisc@lists.librecores.org
Date: Tue, 14 Feb 2017 08:25:17 +1100
Message-Id: <20170213212536.31871-6-rth@twiddle.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170213212536.31871-1-rth@twiddle.net>
References: <20170213212536.31871-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PULL 05/24] target/openrisc: Fix exception handling
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
X-List-Received-Date: Mon, 13 Feb 2017 21:26:15 -0000

From: Stafford Horne <shorne@gmail.com>

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
Message-Id: <20170113220028.29687-1-shorne@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/openrisc/interrupt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index e43fc84..a243eb2 100644
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



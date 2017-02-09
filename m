Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbgiX-00028p-23
	for mharc-qemu-trivial@gnu.org; Wed, 08 Feb 2017 23:52:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cbgiV-00026x-BC
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 23:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cbgiU-0007k1-LR
	for qemu-trivial@nongnu.org; Wed, 08 Feb 2017 23:52:23 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cbgiP-0007jI-1C; Wed, 08 Feb 2017 23:52:17 -0500
Received: by mail-pg0-x244.google.com with SMTP id 194so16792487pgd.0;
	Wed, 08 Feb 2017 20:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PS1yzg2qNpHqbKcSDEtwXDj1vGrkbgQT/QK32kQ9bxs=;
	b=TNPCzXW9YRarpSIIJqx0T1Znl76aCOTEk6bdrFgGT6yI//BWQhG5fScwKaozMM7vTh
	2I+2tys6EqJHY6GuqWrPsSOMo3EaAdJiJJshyW4NMWTWJiRNUQHmkFIxmMYeBaFONzNa
	RGZz89G+gQOPH3kV5XGxHndOIa6bpx8yduZgSTMXLs13zl2ZWWPoKGkNdLFRbfheGCYE
	IggmLTyJi8y5vdWphYIjKcrB5H10UpfzXs+M13PX7/YHgKtQsq/6nZXLNPexDecIesXO
	v7x/yE9TCnCSNEx7KGghX0BRUQ3Nc67GLWZ+JssJp/a5Wa9EKtCNVp0xgnKDtRcCFSFA
	B29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=PS1yzg2qNpHqbKcSDEtwXDj1vGrkbgQT/QK32kQ9bxs=;
	b=K74RCv2uLOqPwQwGvq660icEhvnFWH9cQaTkt5k/jTAzLvNmup04WxsWvNZtUwnq2F
	AsCwD1b2YTRyMO6OHdGGbNXEJlzsTcsTBqKL5NirPR5ZL0Yuw/bmf03dYGUX09UIItbP
	Ym5aDOUyZ9ji65T0ecvSiDYOpMnYHrH4zecptmuFXVLcukZQu1LjIP/l8FaDqY6fBJ1x
	VQz+h+yAWEqJpINMzaYbbGj+6u/sDwR9+2ZCeaSTqenNl06zCkzok5D4nwAThJ8wB2PW
	E7tUQYEfDG6RRCsuV9So5ycpmUs/6nlFZiVSbiq5TNsAknclP6UXkkreL5hnPzE/Z70G
	wzNw==
X-Gm-Message-State: AMke39mFq9sZJbnyNxnA/ecbmAq1H9KSdigU3EMZurFN7qvGODq/pQgxkHIAyuVMdaYDTw==
X-Received: by 10.98.139.22 with SMTP id j22mr1461275pfe.115.1486615935879;
	Wed, 08 Feb 2017 20:52:15 -0800 (PST)
Received: from bigtime.home ([1.128.80.123]) by smtp.gmail.com with ESMTPSA id
	b75sm24202832pfb.90.2017.02.08.20.52.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 20:52:15 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Cc: shorne@gmail.com, qemu-trivial@nongnu.org, openrisc@lists.librecores.org
Date: Wed,  8 Feb 2017 20:51:36 -0800
Message-Id: <20170209045154.16868-5-rth@twiddle.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170209045154.16868-1-rth@twiddle.net>
References: <20170209045154.16868-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-trivial] [PATCH 04/22] target/openrisc: Fix exception
 handling status registers
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
X-List-Received-Date: Thu, 09 Feb 2017 04:52:24 -0000

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



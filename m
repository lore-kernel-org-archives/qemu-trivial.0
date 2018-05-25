Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fMBpH-0002t0-5D
	for mharc-qemu-trivial@gnu.org; Fri, 25 May 2018 08:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM6BG-000642-0l
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 02:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM6BB-0007e5-RE
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 02:26:24 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:36102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fM6BB-0007cZ-KR
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 02:26:21 -0400
Received: by mail-pl0-x244.google.com with SMTP id v24-v6so2532432plo.3
	for <qemu-trivial@nongnu.org>; Thu, 24 May 2018 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4IfblghiDBq+2bd29L3gAJIy+A7G+fEhKiPzRpKXQKI=;
	b=dvLtY/FEXFtslMhSbq2bSie3FeR9MHMx/ScUE19LV+HYBTn0RSoXFpglkZKhSiKrUM
	duFo8t21qoAu5pHMIi0Gl4l4MOIbWZBE6nNpV7z2UPI0v4N51W4Juw5lPafMubAJ++Oj
	xYj31QHTqA1UliT5O8OJGPX4UGl1uyBVH03F1eN24WD5w+FqvC6a7zU2xxoxUzpsDQOF
	8I8DMITvvLCrS6BaLXuGwJLCLFTMrBHU7/q0dVrRQbKFO2iBwk8NjBUkzjfCInvzF2OA
	sOUBfcSHw2AxBiZTPmyJWpg3Qjezg9JKendfiFrzD/LGDFfPHK1V8TuGlzomd9X0CFUP
	BKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4IfblghiDBq+2bd29L3gAJIy+A7G+fEhKiPzRpKXQKI=;
	b=Wm4Q4a1xfL9UKD49lns4VLjyN80xmIVQW+wWGaUG7mH97s4xQsUAm7iKMjv4hg2Ml+
	xO6IWlQjxnNblFw8/hA7AAT8Agx9maLWaH1JNvg0yyy06Q5cbQJrF56N54fMEQd5JVCJ
	LKKAKFa5kVwiv8rEq69vJQZPBUvEaF+dTG+2BccXstOK5iBUAilaOjdKyDWsNUGhQxtK
	63JJIo7Fb+VnNWXXh+0Q6SRpkIgoRfW/lUyU70Pr43+k1tnHvwkWd8WO6DRXWhCsF4A6
	yD5CCpA9ndTYMjXLYQYMjs3XW6Ivf0rtLchbAEX+2rCw7XRzMsWVyKuiZaNEqLR1BqCE
	hcxQ==
X-Gm-Message-State: ALKqPwdvxJehTG9aS7+iSJgay9kA7dnNqyLgJtdE+5OV5hYjP6ZbLpEN
	01KmLf2B84HDSaTseMd8B0z+koCydG4=
X-Google-Smtp-Source: AB8JxZqW2VnWQGpquuovlfzdSlxTALfp0pi65I6B82ddA+wvwDtgEG/CKon91yAMbP4LfqC7rUEWrg==
X-Received: by 2002:a17:902:b681:: with SMTP id
	c1-v6mr1251378pls.286.1527229580666; 
	Thu, 24 May 2018 23:26:20 -0700 (PDT)
Received: from localhost.localdomain (122-58-167-22-fibre.bb.spark.co.nz.
	[122.58.167.22]) by smtp.gmail.com with ESMTPSA id
	q62-v6sm55900800pfd.172.2018.05.24.23.26.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 23:26:20 -0700 (PDT)
From: Michael Clark <mjc@sifive.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@groups.riscv.org, Richard Henderson <rth@twiddle.net>,
	Michael Clark <mjc@sifive.com>
Date: Fri, 25 May 2018 18:24:48 +1200
Message-Id: <1527229488-49822-1-git-send-email-mjc@sifive.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
X-Mailman-Approved-At: Fri, 25 May 2018 08:28:05 -0400
Subject: [Qemu-trivial] [PATCH] RISC-V: Correct typo in RV32 perf counters
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
X-List-Received-Date: Fri, 25 May 2018 06:26:27 -0000

This patch enables mhpmcounter3h through mhpmcounter31h on RV32.
Previously the RV32 h versions (high 32-bits of 64-bit counters)
of these counters would trap with an illegal instruction instead
of returning 0 as intended.

Reported-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 target/riscv/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3abf52453cfc..1f6dc9a85852 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -406,7 +406,7 @@ target_ulong csr_read_helper(CPURISCVState *env, target_ulong csrno)
         return 0;
     }
 #if defined(TARGET_RISCV32)
-    if (csrno >= CSR_MHPMCOUNTER3 && csrno <= CSR_MHPMCOUNTER31) {
+    if (csrno >= CSR_MHPMCOUNTER3H && csrno <= CSR_MHPMCOUNTER31H) {
         return 0;
     }
 #endif
-- 
2.7.0



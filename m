Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an4a0-0005wx-KR
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 09:30:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an2KI-0007dv-AM
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 07:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an2KD-00014C-VO
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 07:05:46 -0400
Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235]:33076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an2KC-00013r-Kk
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 07:05:41 -0400
Received: by mail-lf0-x235.google.com with SMTP id p188so137432297lfd.0
	for <qemu-trivial@nongnu.org>; Mon, 04 Apr 2016 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=IofTgNV2+VJIbJy7ZU3DhOGGKH6mrTWUkS2SuCHm7mY=;
	b=P6q4iBCAYkC6H3C9q3GX1J2dsQMuyxcNpHHEwfBFhCGXnTFyl4970s/KctetkFTxPF
	0tBCzL0Iw+t/QCXiMA34wAAEv3DuCbNdCX7v46novHTLrwxBPGS8sfoGnuBQaBaY6nfk
	82AL48U0L2NSsj+lzREG7QcFU37ZdwBZ6MyGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IofTgNV2+VJIbJy7ZU3DhOGGKH6mrTWUkS2SuCHm7mY=;
	b=dcQG6kNRcrotTU8buIsf7+P+NYcReC9hn6gEmVmBQ1TXMs+ScJkPjak8l2SZ18I0fn
	+53oIg6i+Mj3vKVdIsBp3GD3dcr0mEWcxRmgtAoK5QPacJeeN6SINsqjUq5G+ILsODKe
	CSnGrF21pX702MMSWv1VdbLZc8rkzyFcxDPla3ENi3tv8K5xXqp0pIgCV/Q39zxjKhxP
	C3MjWWnnCyHkQX35w58MF3qu0BhKaQvL6YVMi18LFfqX++NvjhRrASQwZpSEGHXi2TJq
	eCB/IwZWQ6umpQj5fe7LXUUc8KhmE1b/JScIQ57oMhtTKBB6pf4/rnHUymPP78wNi/iK
	9lLg==
X-Gm-Message-State: AD7BkJJRY67p+24IjFeIgCkkbHkia0k4CmHCHNGXgOMiGn2PyQ4XSQ7JI6pXIuaAv6f2ac/T
X-Received: by 10.25.78.80 with SMTP id c77mr2825247lfb.62.1459767939525;
	Mon, 04 Apr 2016 04:05:39 -0700 (PDT)
Received: from localhost.localdomain ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	f134sm4725811lff.34.2016.04.04.04.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 04:05:38 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  4 Apr 2016 14:05:18 +0300
Message-Id: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.7.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::235
X-Mailman-Approved-At: Mon, 04 Apr 2016 09:30:07 -0400
Cc: qemu-trivial@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>,
	Sergey Fedorov <sergey.fedorov@linaro.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tci: Fix build with no '-DNDEBUG'
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
X-List-Received-Date: Mon, 04 Apr 2016 11:05:47 -0000

From: Sergey Fedorov <serge.fdrv@gmail.com>

assert() always evaluates its argument so there's no need to #ifdef the
definitions which is only used for assert(). Actually, doing so
generates a compilation warning which is treated as an error in QEMU
build by default. Let compiler sort out and eliminate unnecessary
local variables.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---
 tci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tci.c b/tci.c
index 7cbb39ed4b6a..d709e008f3f9 100644
--- a/tci.c
+++ b/tci.c
@@ -472,10 +472,8 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if !defined(NDEBUG)
         uint8_t op_size = tb_ptr[1];
         uint8_t *old_code_ptr = tb_ptr;
-#endif
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-- 
2.7.3



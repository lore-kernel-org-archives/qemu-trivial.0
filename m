Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsn-0001zc-7W
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsl-0001xQ-1M
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsk-000146-AW
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:19 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsk-00013n-71; Tue, 18 Jul 2017 02:21:18 -0400
Received: by mail-qk0-x243.google.com with SMTP id u126so448897qka.0;
	Mon, 17 Jul 2017 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vtdYGuwg2ORw45SbkIBAl33OrA9D3Qx7gJlEyn98dvI=;
	b=HleKzbcOJZIhevkk9qogN3kY9db5yB5GwUreKvR1g/NX2KkRgCcpox4+ns4UkzqwZr
	73XmhX9UCdgReA53OA8/bW5zSHqlZ2dxC7QetkoLVVo2HEPhZbJFoCMwYQs1lJ+4G+B0
	zjRPtuIKpLSjhWt1qse8Whu1K2yUyWX4C3MjEdJeiihdyqxSVckp5LOhkOaq0oaNqpZj
	/4uArnTAPkjKawI7Qouiye6Xk2IQFXJ/EsdUeRDjlg+LeCbLWnM7gt8l7XEEgijsVIAs
	RyN/fxPYd29/Lyf77gJRY0VBVPReaN20b0G6JBKhlQpfQKAqDdAw6OFXtKqaV4mU77xG
	OyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vtdYGuwg2ORw45SbkIBAl33OrA9D3Qx7gJlEyn98dvI=;
	b=QXKPT4jNHWNsGLNdaQoecAE0tXVTgf600DXpIpamw2Rb9RC1SamNYBOSLb9jKIndnS
	Q6uttEZpmyuDJJ2Lr7hzXWm09VKDu2wx4mmyvhiWW225YjQF/kheiXikyExbS5+3RZ6l
	svcztvtFMuYxZag6FewVJY0kAr/5Ba1tRniXq19Y713T5NU4Ra1sKhbsoF/JGDE2ZgtP
	Xuv4GkWX+LDp9yphucKB3fCE61a/11aKYyXIIc1MVz+YcW8an8ksKkjjgIqDimRFtd5R
	o9ywnEqf2uUaxpRanSTK/Hp8uVz/j7AAwTaB7SK8sl9XgXLMxAITygqgAKiB/Kng0y3R
	LH7g==
X-Gm-Message-State: AIVw113yg6M6Soi7FUFlYp5eT2h44PWQqu9TX0mXVRbjdcWf26fxSsnM
	9S1FOJ5eLj1c39XEHDUCuw==
X-Received: by 10.55.150.193 with SMTP id y184mr11483qkd.113.1500358877578;
	Mon, 17 Jul 2017 23:21:17 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:54 -0300
Message-Id: <20170718061005.29518-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 18/29] nios2: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:20 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2f3c2e5dfb..250ac9cce5 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -925,7 +925,7 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 
     for (i = 0; i < NUM_CORE_REGS; i++) {
         cpu_fprintf(f, "%9s=%8.8x ", regnames[i], env->regs[i]);
-        if ((i + 1) % 4 == 0) {
+        if (QEMU_IS_ALIGNED(i + 1, 4)) {
             cpu_fprintf(f, "\n");
         }
     }
-- 
2.13.2



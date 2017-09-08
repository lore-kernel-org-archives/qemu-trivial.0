Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqN8M-0002jv-W9
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:32:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8K-0002et-Uc
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8J-0004IQ-II
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:32:00 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8J-0004II-Eo; Fri, 08 Sep 2017 13:31:59 -0400
Received: by mail-qk0-x242.google.com with SMTP id o77so1907849qke.2;
	Fri, 08 Sep 2017 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WQfU7A5lU/yJT+aaarfC0QUkD/YRvh20owQ164qo1Mw=;
	b=O6W+F6iivsG1h2+20+fGLVwa+GnaLQsqFnH5CblcZDSB/HEo3NNrsZovLDxnv1KTae
	YIIAwZ8oEVknju6wEbiGtoUqETZyPSKEphcTYohyReZmFdDFav0xiV3p9aJ66BYdF7VA
	WrP3svHxZ8rehuQacYZwPRr4Pn6JTeXMu3fuOJpxIaQWZ1TZCsOmd2l6I0hl0Mogr0ff
	YF8jEztDkjkduH5seqPblP9Mdi80zwZh8tlGaLEMf995v4Z3WxR27VPKRKiL5SqQ9T3x
	tweugGG5XdlOWoo64qFfxMmTxgJ5gJZd/x0XkGbt3JQLlHSu0Mtu4UyUiIjsRAGHmgDZ
	i70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WQfU7A5lU/yJT+aaarfC0QUkD/YRvh20owQ164qo1Mw=;
	b=KbFatDXraVqnDBz2fUQ4TQdpgc8IVJ4/af4XFOTfqGSGcANaCYL9R0aXzfOE44RU6M
	4/LEoou5gIx30eBVll1mPM8MW1NLazzZKNBCRu6Kr77vuj9+U/RF/+CdMxHIdS6GWHsh
	J20BxluVOqGcuxHk8+W1Tcd6GvlPEa3Tf2NngEIVR8Mvl4bpOAMx++JgrqDrRctEQYeL
	mXkqRq1Z3gUPnB8TxRlKxWUv2c8e1CwAc/BJbNiO5OLBLTLnZ7/sC8wzoZUwj+cdMJXN
	Y+/1YLqQ/+AWk4CzEdy9RRog8nd6yaRdIRHKblCC9iEsNNT6dmhTqVzIQ6SK+fTzDaxC
	LUxQ==
X-Gm-Message-State: AHPjjUjj8GKGomWfc29Ivu0XwPdbV4bkD50YQfe3+sxrtd4LYN8u86Yh
	l8wtfr6+lM3nc8zwnf5Q6g==
X-Google-Smtp-Source: AOwi7QDMqq7c6a/oGFTgJWsbiPWU1kaglmIDyHbZ1oyyoZlE8o/AbuWexFbywEf/WsU/Kgvb0c1jcg==
X-Received: by 10.55.81.134 with SMTP id f128mr1989855qkb.107.1504891918628;
	Fri, 08 Sep 2017 10:31:58 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 13sm1671505qtp.74.2017.09.08.10.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:31:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 14:31:32 -0300
Message-Id: <20170908173146.6446-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
References: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 01/15] MAINTAINERS: add missing ARM entries
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
X-List-Received-Date: Fri, 08 Sep 2017 17:32:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36eeb42d19..35c8c9c752 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -380,6 +380,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/char/pl011.c
+F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: hw/dma/pl330.c
@@ -403,13 +404,15 @@ F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
 F: hw/timer/a9gtimer*
-F: hw/timer/arm_*
-F: include/hw/arm/arm.h
+F: hw/timer/arm*
+F: include/hw/arm/arm*.h
 F: include/hw/intc/arm*
 F: include/hw/misc/a9scu.h
 F: include/hw/misc/arm11scu.h
 F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
+F: include/hw/timer/armv7m_systick.h
+F: tests/test-arm-mptimer.c
 
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
@@ -512,6 +515,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/versatile*
+F: hw/misc/arm_sysctl.c
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
2.14.1



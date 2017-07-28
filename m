Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxwx-0003yD-W8
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxws-0003ur-Ox
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwr-0002tf-Vs
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:30 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwp-0002r5-RA; Fri, 28 Jul 2017 01:36:27 -0400
Received: by mail-qt0-x242.google.com with SMTP id i19so11806972qte.1;
	Thu, 27 Jul 2017 22:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5cmeS5eQ5lUiIR4OIGCUylj6OJg0ex+IV26QCYh2rnc=;
	b=ZHhEojZbYZfbrXUR658g+d7dKiO9FOrYD43U/ik2XHA0o5xFCShZJ/veFSw45D4E3r
	QABLsou/qb9cgawQYFFj2NBBcFpSDlZ2Z48UDsBnpeH4TCumRWA7O1T9Rv/UB0JkdGZ/
	6MkV2pXLdxpTZaTUSjW085CKE9TjhehZUbwhbJZsa1CCMuMPSK4lwsptm/EkP0eM+efo
	9WMOOjk3dS5jXIrpFxhfQ1G+7P2ZR2i4Xs9k7+JPQMq07Og16/nNXtLB2FmnFY8gWvq0
	7WjQS02GQv2b5CC+hzfeE0L28xFdtR7cIwfnUngSX/L4jBOAB8NMp187CHkX+IQudtkb
	FDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5cmeS5eQ5lUiIR4OIGCUylj6OJg0ex+IV26QCYh2rnc=;
	b=lYIR/8VqWioGj9+G+VLKJf48zWK+P/1tTqYA7XPBBsQFPaZz1cmOU3UFrH4JGsFgMK
	MOfA2Q3tVAsXnrO0oWJqna3jhaW2P9jK2fLKijxq3QPyMRQbJSnTkt9n2jMLnmgTkBdc
	ZIMph48tj6baXAx21WWpmpypeHiCa20u7g89tSG3xgRbZBlBedQA4mG+QPCqLhIfe1XG
	RhapmdohkQ3dWDVOIXh0N+H6J8NBm0vzbqgbDPpiAk/7tz90c32yw8b6HOOlg1gNKw2Z
	8Wyd1+dXegnyon9G6gC9xOxcHdH3gn/HNzmUtmeLcmpBkjP7kbTGpeM0D1egP0Dzk9mq
	9F4Q==
X-Gm-Message-State: AIVw111YGXWDKNdReYcNjMwRwxEhO9d3V9aGHV30gZvbJe/1ck9buZrh
	e1IVB9Lkdaf8Gw==
X-Received: by 10.200.4.4 with SMTP id v4mr9364624qtg.23.1501220187340;
	Thu, 27 Jul 2017 22:36:27 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 28 Jul 2017 02:35:25 -0300
Message-Id: <20170728053610.15770-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 02/47] MAINTAINERS: add missing ARM entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:33 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 972118e70b..795f89f709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,6 +120,8 @@ F: include/hw/cpu/a*mpcore.h
 F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
+F: default-configs/arm-softmmu.mak
+F: default-configs/aarch64-softmmu.mak
 
 CRIS
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -380,6 +382,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/char/pl011.c
+F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: hw/dma/pl330.c
@@ -402,14 +405,19 @@ F: hw/intc/arm*
 F: hw/intc/gic_internal.h
 F: hw/misc/a9scu.c
 F: hw/misc/arm11scu.c
+F: hw/misc/arm_sysctl.c
 F: hw/timer/a9gtimer*
 F: hw/timer/arm_*
+F: hw/timer/armv7m_systick.c
 F: include/hw/arm/arm.h
+F: include/hw/arm/armv7m*.h
 F: include/hw/intc/arm*
 F: include/hw/misc/a9scu.h
 F: include/hw/misc/arm11scu.h
 F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
+F: include/hw/timer/armv7m_systick.h
+F: tests/test-arm-mptimer.c
 
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
-- 
2.13.3



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxf-0005CY-OL
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxd-0005AY-K8
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxc-0007Vs-Rd
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:45 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxa-0007RW-3e; Wed, 30 Aug 2017 17:55:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id u11so6269513qtu.2;
	Wed, 30 Aug 2017 14:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i7DICPMjD1LkEeBKl04nBKD47wy864nsi72KEboM26o=;
	b=jeh3tYU5epWh1U64H/vTahGgKgs+DJG6mmQxFBOr210l6E6NQlu7L2IyenFwj8Ye9F
	7yTXuKiS2gAEu4Rawupf5u0Gl/ktL7Z7GalfrjqMKCbf1Q2oR+rrVR9xmZ/Fg+YFoJ3v
	aYteg3ZsGNNQ1LSt9CDP+OLce43FvgWMYN4MG23RjFvZ8vv/sxji1ZaTERZ4PnOUpWdS
	yQFmT1nKuzAGY7vnBDw2PnI1H05+DfssdUdTeaN7BkyIVa74+YdbXrWECw2bkWw7Mq7N
	qg2k3k28bK9D1fKqtOS+82aRwqOdEZI8gYRgYArcD+KeyuRK173jU07mdWpdZwbvbNHT
	Rjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=i7DICPMjD1LkEeBKl04nBKD47wy864nsi72KEboM26o=;
	b=uEN0e1oLYJ2DHWr359ybdA1cxEceBZCFeR1X7hih8X6w6ZvEOSPoNbwoMewkDVFClX
	HUDKPnGMYCtvbGaHFb3/6yH4+w2tigX7a6Ie/AcmaA14YpIMFV6Bu2AVz/b8dzGIeQ5x
	KEoiRviRjuSQOyw6w/1FNrP99PY1i3LYeOr+19rX2GBk2VykKMiZh2wlFodpsvumrc/+
	oygYzA7MJSv1Uix+A6IuucfvaLx5PQGwv3wNCXSr/p6Nr07PhZQoRVm8UZOP8FvrkisD
	ZNqBu6aQ3VZMUfjvlC0iaZoAaOXBqlw5C5OZG8Lb0u/zQqNgqr96DCRjOg7Z02YG6VEp
	0TuQ==
X-Gm-Message-State: AHYfb5hIsyZZ9I0uvoCLBuiZ2ItN8ztjn9Fym/jHupIDI01qul/rmjmT
	tWrfb1bYVKv0zA==
X-Received: by 10.200.22.34 with SMTP id p31mr4388556qtj.310.1504130141468;
	Wed, 30 Aug 2017 14:55:41 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 30 Aug 2017 18:55:07 -0300
Message-Id: <20170830215523.25278-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 01/17] MAINTAINERS: add missing ARM entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:55:46 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccee28b12d..b363e1b9c9 100644
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
-- 
2.14.1



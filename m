Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgv4-0005y3-68
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:44:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgv2-0005wE-BA
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgv1-0005aH-Iq
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:16 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePguz-0005YF-Eb; Thu, 14 Dec 2017 22:44:13 -0500
Received: by mail-qt0-x244.google.com with SMTP id u10so10640921qtg.2;
	Thu, 14 Dec 2017 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qQySGZRWitYLjldBg/lCrO9TdSWZkl5tDmjIwefvZoc=;
	b=MpyOyP9M1lVNPOL4ZpfQ4Taim0gqHatQM5z9OrHrGrBzWid6tKn+6yyNQlJ34PmB7J
	8YTLwqxWHZmAhqrrlpcNnxqDldedzlXAd70YV78UP12eGAexHFdO/dQwVTdOY1FvfXOO
	+sNVMAZs6mUBWr7X4j+6mi6oqO8QVUgjpk0NotNXjjwlYB47/sBnuRrrdGA+hShbDvv0
	TagF/xD5iMQMFRMzPByygy9QSJJodRGN+1e11dsIVx/Wn2PF4KDDl0ZKcXp8NNZ2GvMn
	S/sLryscSf7JRsuS/PoGzTz8qrOP9dcBltfrs7xyzOEmPNDpzSczffYauig/Wvw1ZLVS
	YIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qQySGZRWitYLjldBg/lCrO9TdSWZkl5tDmjIwefvZoc=;
	b=FfTdMnCDocyePgoueGS7Yge3MDSGpfOwDjJa9yPMzubIwR4P5A2LsnawcFm7XIerpK
	TWOQXj41PJphp9AYj4j3v5x2PbfoS+QPOKPLtj4ejwp2Gq69h43nYUWVNK6vWMHq13aD
	E2evilOgxSbGsgS9gtMrRzRnMt493oTKTibRsSbyssPf7duEgqrxfOX63hW9aFEmOq84
	fx1KJdmplRXSb+VL1pNI1M5q/MUQXHB/s7va51Aej8Ex7wXUnyFqM3Apc0Jq4n5vCtm4
	mkoPV9qlENNLLggQnfYEd6gCJ6+rvebj93N80+od6kOVhgbxfxm273ZvNyem5ej0xw9b
	WWjA==
X-Gm-Message-State: AKGB3mLGc94hCxq1e/ZHK62++BIGo6N+sAsC8yDxZBd5zbRW6K+e6JCt
	Iq6e7/wOgVIbh7eqXZDPBs0=
X-Google-Smtp-Source: ACJfBotqVXZBO6nRByCJJmupxGxT6d3TLLqTLyg9OhG8O1GQi4ozO+xGz+mU7F9ZZ7Z8XdD8A0rXvA==
X-Received: by 10.200.1.20 with SMTP id e20mr18722667qtg.97.1513309452928;
	Thu, 14 Dec 2017 19:44:12 -0800 (PST)
Received: from x1.local ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id n3sm3543633qte.14.2017.12.14.19.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:44:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 15 Dec 2017 00:43:56 -0300
Message-Id: <20171215034356.4449-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215034356.4449-1-f4bug@amsat.org>
References: <20171215034356.4449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v5 2/2] misc: drop old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:44:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/char/debugcon.c      | 1 -
 hw/intc/lm32_pic.c      | 1 -
 hw/moxie/moxiesim.c     | 1 -
 hw/sparc/sun4m.c        | 1 -
 hw/watchdog/wdt_ib700.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 95ccec6f8b..e2abc61b04 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -29,7 +29,6 @@
 #include "hw/hw.h"
 #include "chardev/char-fe.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
 #define ISA_DEBUGCON_DEVICE(obj) \
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 09e15115fb..db6c7afc2f 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "trace.h"
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3ba58481d0..3c3ba9d8c5 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -30,7 +30,6 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 24c2b8a555..e71648404c 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -36,7 +36,6 @@
 #include "net/net.h"
 #include "hw/boards.h"
 #include "hw/scsi/esp.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "hw/nvram/sun_nvram.h"
 #include "hw/nvram/chrp_nvram.h"
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 532afe89e7..d045032bf4 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -25,7 +25,6 @@
 #include "sysemu/watchdog.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 /*#define IB700_DEBUG 1*/
 
-- 
2.15.1



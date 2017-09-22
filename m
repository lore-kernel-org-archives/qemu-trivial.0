Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQQb-00088k-Kr
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:03:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQQU-00080m-QS
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:03:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQQP-0001M8-84
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:03:38 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQQI-0001Ie-SB; Fri, 22 Sep 2017 12:03:26 -0400
Received: by mail-qk0-x242.google.com with SMTP id c69so906096qke.5;
	Fri, 22 Sep 2017 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yl19dps+PSo1kGhMPSwnC7jkUvs+YiVcAYYTG4plnKk=;
	b=h6xCyvWbqSRtBbMU+eEnz/OEtHT00grixasTidVNTItzSp7GMkseo49GgECGiFBKMB
	fb9pwne0JOoJv6H5RhwUmSBmhTg2i/FtBrproXAv7ESjElsp0yH4lfz/m3ytfjiC6La2
	YUOER36gQgwdTnQCm6cjNfhMlOHtH7OQEX2tzRbvK6QsFfVYNKg4Q3vQrade1Tkvk/cf
	UfdJTp/gal9wq3Qvhjj33Ol/dH3hqlxxmrL4YTeO7zhzj4OdIrcBDZLS8fnntk+PJxam
	DR/+EQRgDrCy7geu7M+HUhf4RpV2TRQ9ynZt9tkrckKJKw0q72f9uTI6YMvciqdr9ynE
	714Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=yl19dps+PSo1kGhMPSwnC7jkUvs+YiVcAYYTG4plnKk=;
	b=E2sxYKr0leE3TZRvKlWEpPZD94FcUQOTbyMjyJGAPpGJzp/5AXOjgyDLiU1bHwG5eg
	lcoXu0F+aEicV7QCVbgEUK4v1MEs1xVBhlN5UspcEgD0Z1AlMt8mHh0pkbV+u68t1Eoz
	sEcbeYOx0fu/0/h4NMTtZjXgTE+31ElxtJAraLT7yAXClzg9ZkhH1iLF9tFzdYR3+25h
	nrhd2xI3+pJBSHsM8lmpGSs0duCTY6zGqljwynnGzy+JztbBgsQcPNVQrkTOaaBxqmJp
	WobaDm73Nyg5PcxjQUimZ4nfjXktEEQYp2n11T6KV0sWH9OA9RqB2Xz1xd4e+3s5NwxA
	MBZA==
X-Gm-Message-State: AHPjjUh+LnNdvYrG2KIHQ+bmqk8bzw4fGdrPZawp4HIKh7SSxM4dvYR+
	j/0oBAg4Peq++eILURt/b7k=
X-Google-Smtp-Source: AOwi7QDQam/6Ak582pY/e3gP68w43VMC8HioTtH9VrGQlDfVLmmOng+wp8k2gDfQ1wP8zGDL4oit4Q==
X-Received: by 10.55.97.198 with SMTP id v189mr8707447qkb.79.1506096206311;
	Fri, 22 Sep 2017 09:03:26 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.03.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:03:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Nefedov <anton.nefedov@virtuozzo.com>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Kirill Batuzov <batuzovk@ispras.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:11 -0300
Message-Id: <20170922160111.31885-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 34/34] misc: drop old i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 16:03:43 -0000

while here, add an entry for wdt_ib700 in MAINTAINERS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/debugcon.c      | 1 -
 hw/intc/lm32_pic.c      | 1 -
 hw/moxie/moxiesim.c     | 1 -
 hw/sparc/sun4m.c        | 1 -
 hw/watchdog/wdt_ib700.c | 1 -
 MAINTAINERS             | 1 +
 6 files changed, 1 insertion(+), 5 deletions(-)

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
index 5ea8dd3a93..5c9a4211ac 100644
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
index a4ba3d2917..f6fda6eb13 100644
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
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 37917af0f0..3b767e4012 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -852,6 +852,7 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: hw/watchdog/wdt_ib700.c
 F: include/hw/dma/i8257_dma.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
-- 
2.14.1



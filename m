Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWS-0007HJ-Tw
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWQ-0007EE-EG
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWP-0004xS-Be
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:14 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:54187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWN-0004vl-2K; Mon, 16 Oct 2017 20:14:11 -0400
Received: by mail-qt0-x243.google.com with SMTP id n61so43023qte.10;
	Mon, 16 Oct 2017 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8ROr7wKR1HNM3arK+N3XS2nqKzhARhHINhAJSV6TCM0=;
	b=UqXtY9TVcKiJ4FGzS24ekzVI8d6S2oHsBCz+VEVVomtc8jBWIBpux3MXC2fycdzYc4
	06zQR6Zy1BsJCLYdwLU37bB56NAoL2EGOz7TixpMshyLNRmZruCwkt+fHi7ywZE/HKUU
	tyYD9D7x607a3uXHHSON55pI0aWZrK6eaoeI1+Fk74jiGCgGZN/71A0pKaXDif13yI83
	ATl28+g4Zjyj2mKKCuWfsJjpgYQC8iJ/VNL5yQoMl6N2uO+6oBLmZ5ZaZ5n/fV026hzS
	nHgI7raijHxwkYQ5KdkCPYX/yzzKFD+ZY04D70yWOtADHyxQ/HFZZXpfg5QJaXG4REyl
	XI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8ROr7wKR1HNM3arK+N3XS2nqKzhARhHINhAJSV6TCM0=;
	b=o1mdVaLKvpsjZ0q0opksSEScKrQvDrLHlPTUF09QbRLh5kvEvB3TCOU5/yXLOZLOzR
	imRq7kZuXr1gsfJtuG/I5+hZb90IWF2Rx/2rCC0k66ZnwQKk/WRMWFnVacI8ao77vZ3F
	PpTNLIxshzGa0Ur/lIq+NSVyz3IxrlFXxNV7fJyhU6teR9oeCrXsKFiKJVictkRUW3jB
	lOzgOu8vyC2haGMxfY+d9WQgiv1DZEcrIjeVRBCVTK5tYhjYvemxplrvgb9+OEi7ImXr
	R1EeppiOE/RsNs1BBvvgc88InBan5/iufmapDZ/kG51qY4AQ1aulMN9HpkZDjd7buH9I
	FwRw==
X-Gm-Message-State: AMCzsaWA0ImDFcEOujQaNQQpfz3iLkZu1takZQK0C/ZLdnqjDeicH7Yp
	8CkUPm1G1gwQS0x6TOLwHonS0IC/
X-Google-Smtp-Source: ABhQp+RVWbQZTQyShnTkcAe1KqftxoxxL/htKXqASs77mGTOPIvMbeW02nkijnbx3bSWJMyhkFsMyQ==
X-Received: by 10.200.36.68 with SMTP id d4mr4228744qtd.180.1508199250658;
	Mon, 16 Oct 2017 17:14:10 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:04 -0300
Message-Id: <20171017001209.32276-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 34/39] misc: drop old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:15 -0000

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
index e1bdd4828d..93424b186f 100644
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
2.15.0.rc0



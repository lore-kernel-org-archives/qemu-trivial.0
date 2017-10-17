Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1X-0003Jl-5d
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1U-0003Gg-8t
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1T-0003xd-6P
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:20 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:54646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1Q-0003wV-HU; Tue, 17 Oct 2017 12:47:16 -0400
Received: by mail-qt0-x241.google.com with SMTP id z19so4900839qtg.11;
	Tue, 17 Oct 2017 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8ROr7wKR1HNM3arK+N3XS2nqKzhARhHINhAJSV6TCM0=;
	b=HeqFcnx7wVPgiTKeHUZiIoCQMNxiMXgRUriroE5p3Tlzh8sIqHcGnp0XsIl9N6AaKA
	51gakPehql+EmmvLst0JHq2KETQpaWjdt5XI3c1+HrwMJ7ZmXulu2eYt9CFnkpj7easQ
	9aYiyvUBDhuUF8r8j6/yOcNq6gaSSjseocVimeJ8VXLhJOtwLSlg1GuG/HfeTfgBPbvs
	jCHtYnNJgLlbEMQsCA+XVHNJontXY0WZGfa/vPQ7GaAXKOt2iBQngJMs0azWvrl/fSQX
	wrKzq2ZXw1DBZxQu23WGovLLZ54WmOQvOgfERFCfOgSdqVrD1DecKWTRZm07JM+yFgy3
	NFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8ROr7wKR1HNM3arK+N3XS2nqKzhARhHINhAJSV6TCM0=;
	b=KW81earPuHiFg3RFdy5a1S5FT57NlQhfE+hoWoHxVGTZ/CAh/fNdKi0Bo13BDTH2Mj
	1vAsiox1ATq7goULomjiILqq/pDmIi8LCUBiGY5c0f9p3ydq40ZiwicNjrB2CmS4kebW
	T0je+RBv1RT3/i49KpW1hwDvKpX/367TU9IrsY0YAHOJJ6U1hiA6w2hP/4vxVmZj6d52
	4F+7MSWWLeIX5XYsYgoTrpD8J3i0hbnWLBDKg8hWGgVig4ZnCoHQp9BCGw/fmlNjflW9
	KigvgfNpG8IXKWuEDKZ+4VEDnOYRYIyvRyFtZhoVVbDix4oTAhVA/68O7CJ6DwO75Pu0
	kIog==
X-Gm-Message-State: AMCzsaUlGeHyyLBVqovt4kBGwhnhW63Clhba4p53aB/ejidIHFKw7bok
	2cjSUm4snmEVSbn/2+ZuhufbVo9P
X-Google-Smtp-Source: AOwi7QAgfjWRC+sOx4bYUd8YwmVRUBH3cuatMvjicQuWiyVrhuhix3uQLMSDlwIoaPUsVz0AdQ9xuQ==
X-Received: by 10.200.26.146 with SMTP id x18mr21068847qtj.145.1508258836001; 
	Tue, 17 Oct 2017 09:47:16 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.47.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:47:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:26 -0300
Message-Id: <20171017164426.25277-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 42/42] misc: drop old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:21 -0000

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



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJa-0004y7-Ht
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJX-0004uf-Gz
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJW-0000cZ-Kd
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:07 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJW-0000cH-Fv; Sun, 15 Apr 2018 19:44:06 -0400
Received: by mail-qt0-x242.google.com with SMTP id p9so11258018qtn.0;
	Sun, 15 Apr 2018 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wfE08QERhvnOpLI0Z9XXk7B21pUNOogK4ifVxyskcpE=;
	b=trG69pP8LKKh1iyKj+nhspAlHomWY2dp4toB/ck2cUG5TXxZ+DgRb9LN9elwq9UkcE
	SD3UIV+4qPl65m++hCW0HxTLte1XaPMkMHLJF05BSLJEy6vQeqAA9jfWuMinEVE9+TW9
	4HPQzboL6+jPib89z3c1y7O7FRtY14W108XgAhJFnZ2WqOQryXboxixg7MLlABdl/Qkd
	sIkkbTwSSisaU6V9bUA2WQPTlUBflNw0rbB9rLtWCMvSQWfcdxRg9N2pPpKTpaLAVB0y
	V44nXGjg4JjyPHv+7W05KaXgjjlA7E/E52PMJGixBzNfOs6PeyTYTnu9cYCejqYOK6vP
	RUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wfE08QERhvnOpLI0Z9XXk7B21pUNOogK4ifVxyskcpE=;
	b=R9jN1oEA0cnXMsnozLzLQL3rxm8zPwCdp4g5QnRsKSDL2LOO4c78UQNQxjwWfwHCLv
	+WM0rxCLwfgVgvEm7J6EVLQo3S4g1plKI1K/N4BBkxH5ICiQK3v6P3SgMq+oY4PM69kH
	YYokkA44guT2teYrqIej8ijj7pfdKiOECI7VnQwp81hT1/MiSdz9THyJUOt7TBidquPE
	dU4jy4lkHyrjZhKN4u/Sb0zMOKDEeA7fY+XVaduHSI8jkBL+sBDH6IbjWjBMZqSIzTZB
	NhgbjpbUGW2xf03AkJjxhqa5Veaq1J86YSoUR4ISoTuySLv5Dby0LO8VbQ1reSZiLRAR
	xOzQ==
X-Gm-Message-State: ALQs6tB9ObqD05yfW3VVs5blqSG1amylLUGie9OzbBWGGf6hju3TGoGT
	+BWbsiM14yXhkgSOBcEfFOMY/rhZ
X-Google-Smtp-Source: AIpwx4+h59tRmvv7yWXO7dT/Ku3OWtcwStLycshtmQhwKY/yGc/SsUKVX5CKZzfEKXKUttNgblIR7w==
X-Received: by 10.200.80.89 with SMTP id h25mr14101724qtm.31.1523835845817;
	Sun, 15 Apr 2018 16:44:05 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Jiri Slaby <jslaby@suse.cz>
Date: Sun, 15 Apr 2018 20:42:41 -0300
Message-Id: <20180415234307.28132-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 15/41] hw/misc: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:08 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 3 ++-
 hw/misc/edu.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b4cacd664b..0252c72654 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
@@ -68,7 +69,7 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 
     /* Memory related. */
     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
-    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", (1 << 20));
+    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 1 * M_BYTE);
     address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
     return bus;
 }
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 34eb05d213..ceaa2e1679 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "qemu/timer.h"
@@ -357,7 +358,7 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
                        edu, QEMU_THREAD_JOINABLE);
 
     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
-                    "edu-mmio", 1 << 20);
+                    "edu-mmio", 1 * M_BYTE);
     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
 }
 
-- 
2.17.0



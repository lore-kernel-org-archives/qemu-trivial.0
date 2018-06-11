Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBS2-0005hi-RQ
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRz-0005eX-5U
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRy-0003Gj-8c
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:51 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:45916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRt-0003E6-6I; Sun, 10 Jun 2018 21:16:45 -0400
Received: by mail-qk0-x241.google.com with SMTP id c198-v6so12053851qkg.12;
	Sun, 10 Jun 2018 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UgJJeYeaXPCZUqjxc71j6DF0zNq6Jhprq8N0w50klp0=;
	b=SdHhqT0UOSDs0SJaIAM4CZSgZHqO363dBcp64Fow+SN3FCmw6pVjX37doh4fCg0ho4
	yJYjLPGx8761TVgpqL4ZbLim6VDlm853cIJXbfDVhYEfO+5xTPAa8rRcdAyGJ4+XVXgw
	mrb7ozvIAPMmWCrxp9vbvQWAaHBqoXpM1aenyrKMPhVCl4pJKMy1mxp8K+z56h4UjBe+
	hfCcT6Lb3xhrh5NVfe3v482rF4lFDjb+PAPiEPou+Qt4+J6gOYsaSRsFpxDiqZOeAiMO
	mDPWWL1/zWOoTpLjtBqr7yzU1Q66Ot7ysV9QJCvgqPod1f+YKcn/cvtcD7MsdgDCkqZP
	Um0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UgJJeYeaXPCZUqjxc71j6DF0zNq6Jhprq8N0w50klp0=;
	b=ahbCRdGo/Z/OIP0NzwuTWvv1ErZbeLg/YsvA4+5WBn/2vwcHvSsLDchTzYIPZfZS9u
	iqotRYSjd1w7Rg2sRAd15pr2jRrIz5wtUOnDWWaSZAymuhl34d7jVoexjniQtlZYHM9v
	KgjrzDdY4WvLqvUHqNQnWfaXhNwVowqrtaOOJQafOWZmrFWjOofheN4V/FiDRd8Uwckd
	7wbeWvOWDEDW1RxAnXv9eyme3UU/PWH03SSASgnEnVt94oUkrgNuF0m9uJ03GJ9dpv3R
	tw+1UD12atNHjyHRCLouIF1tx5a4oVjUXmbzcq1iu6TYwQaJcbcp/yIdDQBXf85OO1KD
	Tt8w==
X-Gm-Message-State: APt69E1+9FE4JD2/tlviQ0MlOLvBk0mOqb7YshsPLh2heX9JEGzjf9ff
	3305t8rKHXCL84i7m3HUAJg=
X-Google-Smtp-Source: ADUXVKJwUhU0XDJ6d+dkNO2l8H53NecmpuTh4+24j/QugiXW2jFi1E70QPDpEETuWpkMnUKUAcixTw==
X-Received: by 2002:a37:6b44:: with SMTP id
	g65-v6mr12676474qkc.357.1528679804739; 
	Sun, 10 Jun 2018 18:16:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Sun, 10 Jun 2018 22:14:43 -0300
Message-Id: <20180611011501.10235-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 22/40] hw/alpha: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:53 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/typhoon.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 6a40869488..f42b706a08 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -812,8 +813,6 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
                      qemu_irq *p_rtc_irq,
                      AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
 {
-    const uint64_t MB = 1024 * 1024;
-    const uint64_t GB = 1024 * MB;
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
     TyphoonState *s;
@@ -854,30 +853,30 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
     /* Pchip0 CSRs, 0x801.8000.0000, 256MB.  */
     memory_region_init_io(&s->pchip.region, OBJECT(s), &pchip_ops, s, "pchip0",
-                          256*MB);
+                          256 * MiB);
     memory_region_add_subregion(addr_space, 0x80180000000ULL,
                                 &s->pchip.region);
 
     /* Cchip CSRs, 0x801.A000.0000, 256MB.  */
     memory_region_init_io(&s->cchip.region, OBJECT(s), &cchip_ops, s, "cchip0",
-                          256*MB);
+                          256 * MiB);
     memory_region_add_subregion(addr_space, 0x801a0000000ULL,
                                 &s->cchip.region);
 
     /* Dchip CSRs, 0x801.B000.0000, 256MB.  */
     memory_region_init_io(&s->dchip_region, OBJECT(s), &dchip_ops, s, "dchip0",
-                          256*MB);
+                          256 * MiB);
     memory_region_add_subregion(addr_space, 0x801b0000000ULL,
                                 &s->dchip_region);
 
     /* Pchip0 PCI memory, 0x800.0000.0000, 4GB.  */
-    memory_region_init(&s->pchip.reg_mem, OBJECT(s), "pci0-mem", 4*GB);
+    memory_region_init(&s->pchip.reg_mem, OBJECT(s), "pci0-mem", 4 * GiB);
     memory_region_add_subregion(addr_space, 0x80000000000ULL,
                                 &s->pchip.reg_mem);
 
     /* Pchip0 PCI I/O, 0x801.FC00.0000, 32MB.  */
     memory_region_init_io(&s->pchip.reg_io, OBJECT(s), &alpha_pci_ignore_ops,
-                          NULL, "pci0-io", 32*MB);
+                          NULL, "pci0-io", 32 * MiB);
     memory_region_add_subregion(addr_space, 0x801fc000000ULL,
                                 &s->pchip.reg_io);
 
@@ -898,13 +897,13 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
     /* Pchip0 PCI special/interrupt acknowledge, 0x801.F800.0000, 64MB.  */
     memory_region_init_io(&s->pchip.reg_iack, OBJECT(s), &alpha_pci_iack_ops,
-                          b, "pci0-iack", 64*MB);
+                          b, "pci0-iack", 64 * MiB);
     memory_region_add_subregion(addr_space, 0x801f8000000ULL,
                                 &s->pchip.reg_iack);
 
     /* Pchip0 PCI configuration, 0x801.FE00.0000, 16MB.  */
     memory_region_init_io(&s->pchip.reg_conf, OBJECT(s), &alpha_pci_conf1_ops,
-                          b, "pci0-conf", 16*MB);
+                          b, "pci0-conf", 16 * MiB);
     memory_region_add_subregion(addr_space, 0x801fe000000ULL,
                                 &s->pchip.reg_conf);
 
-- 
2.17.1



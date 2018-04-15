Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJw-0005Nw-GI
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJt-0005JJ-Dx
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJs-0000tI-2X
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:29 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJr-0000t2-TA; Sun, 15 Apr 2018 19:44:27 -0400
Received: by mail-qk0-x244.google.com with SMTP id f9so6881060qkm.12;
	Sun, 15 Apr 2018 16:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wHXkPGIa530WojrbOFi9Lqpqs6254CPKzcjs2oxJZM4=;
	b=iJ9U2oQs69H7xrq90d8Iny6n+BPP6bHxNLSvXX6Qa0XLiTAswhgXQQ7uXYEaEg6Qci
	LBm9wpM2CIBea3mQYvPzZZtRUTA4na5GgNoHJw8Vn70A57zMxqTgJDB4ey9BMefA/c6F
	Jzhx6uydvIgp4GuUkw7ADWoaGg1OULah/kyz0XTJOt4ydM1rqjl4H+yKPoTtU8m9wjmM
	qvIkjM15yZ+he3+RHYKAyft+eWDPt0FO6Mkne0ZK9oZOX32+ZkCZRmIVLV2wOlxscgsc
	A7AwVr1FKUJwLNLhIG4QgJinzAeQqQ7LYX6mAUo5AvGh9O5vmZ/a1C3W7WBHSG4fVEu5
	aEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wHXkPGIa530WojrbOFi9Lqpqs6254CPKzcjs2oxJZM4=;
	b=QlwiCB/uolSCzXz4dgj5lQ4sGB4fssL75nVnFkIAZq4xusUkFPo5y4NVaZ9ekmdX9K
	Dsf2OpiojwIKdEHWz2A6xZ384E61Z7hlJlMk1zk+xBw/daEw58456twOrc52HLTMBsk8
	5tZC6XLPg/R0iII6rc7jHsOJnEwWw+/Iy888elrQYUiHwL67q6TQ9zCGFEw2K9PP474F
	UqCYSwv5XSZvWBaGDNyGirM30QKjsEoSAfcYtJ0EnV+TfeKqpnKnWDd7P0qNCzJpQNrI
	vS/yhjJldHp/6+H7z4hhogsICW9SJGaZCupkVSdJUJ7n0yldG2deBFSHjiEbI7N20uX0
	GXSg==
X-Gm-Message-State: ALQs6tDMShty9Ikm1EEZ867+8rqJqTS5skF08HqyRngAHRex8mNP/rU/
	R6E5HWRLS/mZ3yxWWvliQC4DLoem
X-Google-Smtp-Source: AIpwx48ztyEZtiUWYw9dZpdR3RItGDUiXnPbOYbi7NdcTW0xQxlm2HrPS1Q5rfmZs0P4Kv3yMSZLDA==
X-Received: by 10.55.132.132 with SMTP id g126mr14774771qkd.108.1523835867239; 
	Sun, 15 Apr 2018 16:44:27 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Date: Sun, 15 Apr 2018 20:42:48 -0300
Message-Id: <20180415234307.28132-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 22/41] hw/alpha: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:31 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/typhoon.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 6a40869488..85fe072063 100644
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
+                          256 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x80180000000ULL,
                                 &s->pchip.region);
 
     /* Cchip CSRs, 0x801.A000.0000, 256MB.  */
     memory_region_init_io(&s->cchip.region, OBJECT(s), &cchip_ops, s, "cchip0",
-                          256*MB);
+                          256 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x801a0000000ULL,
                                 &s->cchip.region);
 
     /* Dchip CSRs, 0x801.B000.0000, 256MB.  */
     memory_region_init_io(&s->dchip_region, OBJECT(s), &dchip_ops, s, "dchip0",
-                          256*MB);
+                          256 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x801b0000000ULL,
                                 &s->dchip_region);
 
     /* Pchip0 PCI memory, 0x800.0000.0000, 4GB.  */
-    memory_region_init(&s->pchip.reg_mem, OBJECT(s), "pci0-mem", 4*GB);
+    memory_region_init(&s->pchip.reg_mem, OBJECT(s), "pci0-mem", 4 * G_BYTE);
     memory_region_add_subregion(addr_space, 0x80000000000ULL,
                                 &s->pchip.reg_mem);
 
     /* Pchip0 PCI I/O, 0x801.FC00.0000, 32MB.  */
     memory_region_init_io(&s->pchip.reg_io, OBJECT(s), &alpha_pci_ignore_ops,
-                          NULL, "pci0-io", 32*MB);
+                          NULL, "pci0-io", 32 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x801fc000000ULL,
                                 &s->pchip.reg_io);
 
@@ -898,13 +897,13 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
     /* Pchip0 PCI special/interrupt acknowledge, 0x801.F800.0000, 64MB.  */
     memory_region_init_io(&s->pchip.reg_iack, OBJECT(s), &alpha_pci_iack_ops,
-                          b, "pci0-iack", 64*MB);
+                          b, "pci0-iack", 64 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x801f8000000ULL,
                                 &s->pchip.reg_iack);
 
     /* Pchip0 PCI configuration, 0x801.FE00.0000, 16MB.  */
     memory_region_init_io(&s->pchip.reg_conf, OBJECT(s), &alpha_pci_conf1_ops,
-                          b, "pci0-conf", 16*MB);
+                          b, "pci0-conf", 16 * M_BYTE);
     memory_region_add_subregion(addr_space, 0x801fe000000ULL,
                                 &s->pchip.reg_conf);
 
-- 
2.17.0



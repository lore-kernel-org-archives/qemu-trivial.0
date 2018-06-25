Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQr0-0001wY-3G
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqw-0001uL-2P
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqt-0007zg-0O
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:18 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqq-0007xs-A1; Mon, 25 Jun 2018 08:44:12 -0400
Received: by mail-qt0-x243.google.com with SMTP id b20-v6so2516792qtp.1;
	Mon, 25 Jun 2018 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kueQLUvLnaySKJL8JQ+5t8+YdWy7dKb/5gLlqfsMVaA=;
	b=sFdQhqCMaKz7it5TswCJZ7s2FUrngYtyMGC4BMipejQAFM28dyREdJTXLxSOK8ckAD
	Lgm3QMCtRfI7EoAmnEbEkkXEX9t8QK0L9mDH+F8THdPSl0l5Hm+CLGZe/jXPUtsRy6hJ
	+zq5Kwoas7r7tykcxKBB2XAzDa//p8scRLvJxZorOkI+6KJkcyzvMTlZ8LzMWNN54XiT
	Of5CNY8YAzjVy3NQBsXA879UeWmaWQeUhC8Q40NbakbVR2X8d+Me9R3wqzdEYlsxNfw8
	/KhE96HXmhFhu3N4nC4jgYNCqp/RYQDmD7nxl/TWhcpi9o7FA/TVS63Bfq04Wux/OAfN
	S07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kueQLUvLnaySKJL8JQ+5t8+YdWy7dKb/5gLlqfsMVaA=;
	b=ubobe417ZhOADylxZtXDxK2KR6xTTqqVmhKLmulU7yKi3EV5tEsNjmxCHRKCNRQEsI
	oBSsIOaBmmF99XCWvs0kiE959E6UCLjRpd1NKPIbnsyYSfCw81sK/RxuildlZ4kbh40O
	zkWA6EtYAvfx7WMnizFwnW4/dhFD/1qaIg8yNYjJZl11OXU+e0Ed3/tAolpumPxmiH86
	TnNMLQwisu4tmdSVIbBs5q4P2VhqKkXiqsK/uu+NFLOtcL5RL7oT9zV4VYxDzAD5f4Lk
	613CXIJZMTdpKSPQXLl4AT5hzY4ficd0qxXrafNFWHKc5NzQsk7uS4XyV8WQUm9V4VzF
	Z87w==
X-Gm-Message-State: APt69E0TCpIftMBda+LHtLDfRc0Phqiouupln0x3UNkENKplXHyO058b
	ycAV6SE+A/xn7pZFNisw+lY=
X-Google-Smtp-Source: ADUXVKIrQOnU/DhSXyYxLCRBQTpqIy2/nYagoIInwghoiotkZk7C4pPsCI0uAgGAFF9p9tOmv0rqxw==
X-Received: by 2002:ac8:5144:: with SMTP id
	h4-v6mr5240259qtn.115.1529930651735; 
	Mon, 25 Jun 2018 05:44:11 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Mon, 25 Jun 2018 09:42:14 -0300
Message-Id: <20180625124238.25339-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v5 22/46] hw/alpha: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:20 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/typhoon.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index d3ed7cdbe8..d74b5b55e1 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -813,8 +814,6 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
                      qemu_irq *p_rtc_irq,
                      AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
 {
-    const uint64_t MB = 1024 * 1024;
-    const uint64_t GB = 1024 * MB;
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
     TyphoonState *s;
@@ -855,30 +854,30 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
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
 
@@ -899,13 +898,13 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
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
2.18.0



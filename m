Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHp-0003cF-4d
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHh-0003UL-Hh
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHg-0006zP-Eg
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:01 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:34522)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHg-0006z9-81; Mon, 05 Mar 2018 06:28:00 -0500
Received: by mail-wr0-x244.google.com with SMTP id o8so5353742wra.1;
	Mon, 05 Mar 2018 03:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8859JAFfvgR0CHN9Au1q8ZmVRu+VggFIrlOIOMlt8Tk=;
	b=qPmFHHAymXIUwf69ZctfL8F33R0sA/3xHTgknVOvSb0cfB//+DlbBHRDGjMc8pDNlo
	NgK+2j83N9yIUUZT6rInbV78t1b1oSQiRAVn5aagLUuSHyjlOQIjGD+LhF+soYZU+UUk
	/CPjIuPOMRfig341mInVLRljNjEVw5wZcV98msrVHWfQWo86gZYWyVZvRLlTF8RJFeWt
	kOaLxHn7HVgdl5WA9RroTE9gbxJwHbhCHYIvP6bEGA7id5aCzjo56IjcrHrdAIh4fRSU
	PARQwo2rU0KBlHJOpi7NTVSl2y6Xg/D1xvR8IoLK+PcIpMWuYv1zCdz2kcm+yHV7el8j
	YNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8859JAFfvgR0CHN9Au1q8ZmVRu+VggFIrlOIOMlt8Tk=;
	b=s+/zx8/guYxLHVFv9L7DqJYHIQ7Qb2LPUbGDPJMmOwAGLbRTuYSSUNhyc8pLRTUaJF
	beebvHb2q4TNQlhI+Vuw6LpZULVuzcBJuJw5ht1YC7KEPmS6JmqFzRSqmN5bLHiWgta0
	jENIQD1QaxHXNRuqGOhibybF7SpZbAVP2ZUVWzFvUxej1zATOl2dfHJNVYMcUHrnAx5Y
	0h/6lyUOnUxNenRDrbTOeeHKzCNWC/SOQ24K7k3Vp8ZrbHO/Q0x2pnq+gk18v5cfi4Ph
	yrk7bz/a1ckNtt3YFQIGph/svxFg/y5ElUiRGdgMsZtGSm/8B/7kSRjRq6bEcQVxJqQC
	X0yA==
X-Gm-Message-State: APf1xPC1uEGuKawPaXwYvW7p6sdLbFeJxr1NnP5SDTXbhcOQDSWQPuTR
	rF7q8FXdjUPJA9ow22+jsP8lZHUl
X-Google-Smtp-Source: AG47ELt1IJ10xTMZi5ElIfK1PQyqPudZ0q+Ebb+gqANOiAJVreBr0PdvIylVb5CZLLuGaw/Z6dihRA==
X-Received: by 10.223.148.37 with SMTP id 34mr13153118wrq.243.1520249279041;
	Mon, 05 Mar 2018 03:27:59 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Date: Mon,  5 Mar 2018 08:27:16 -0300
Message-Id: <20180305112732.26471-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-trivial] [PATCH v2 14/30] hw/alpha: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:03 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/typhoon.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 6a40869488..0acfb4b1d0 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -812,8 +812,6 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
                      qemu_irq *p_rtc_irq,
                      AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
 {
-    const uint64_t MB = 1024 * 1024;
-    const uint64_t GB = 1024 * MB;
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
     TyphoonState *s;
@@ -854,30 +852,30 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
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
 
@@ -898,13 +896,13 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
 
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
2.16.2



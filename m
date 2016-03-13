Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afCoZ-0007ti-EN
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 16:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBDb-0000Kw-TB
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBDa-0001tO-7k
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:58:23 -0400
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>)
	id 1afBDV-0001t4-BI; Sun, 13 Mar 2016 14:58:17 -0400
Received: by mail-pa0-x242.google.com with SMTP id fl4so12814409pad.2;
	Sun, 13 Mar 2016 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kQ44LbzdVQRt71kiVB2a0GPzaxibG44JCSTfyWK/bjA=;
	b=00ojWG9q20NbIzrx2ABuANnCC2qTnimUAwoiJDa8kQwpTpuOsPl3CxY6RKuqFXWCBG
	ZlN25r1ehEyJl9t+ng/zY7fr41Kt9Oq3ejkZ8HWl9uXrC+pin61RHSm6Uf1ocxtjNOy9
	ygTB/N+GU/WVENqogUyYXtW1tRhzbhP+7jaHxZoXJJyNFUdj37k8NG3Nt/IJliAB4UYQ
	Albsnpq6kLUMXwjFGm+KYYsWFFBXjfrMLLUid8Zi9gngbj6TXQsWK3dAX+PF84++X+T1
	NZlhjTPOXAA2JBPI2KOHROvUdzEqXk82ofKQVIJFv2v87sTws3qNBfj4DARUKnSK0Zwl
	9Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kQ44LbzdVQRt71kiVB2a0GPzaxibG44JCSTfyWK/bjA=;
	b=htaapdK2/ZZTcCpewfgt1pxBTF7oY19WpMSaK1fe+AeUNqPpIBoTzfGggFEoixizcd
	mV1C29EcqdLz5Zx6BnJPeU58mXWl+VKHWeLndXoE93r/oElImdGGwg9vMl/tg+GC41Gx
	tET0RzSssyC+oEq+ipN+ofXG16IcQkKFHR1lcc4+o50oeeH4bcwTJnT/K503iSf+CP4O
	5oz5eE4KazBnAjbTkrShOau541d/MlmTRvv9+1MsaFDf7NCxnwgbk93heTgd7aTsMakq
	yoK9j/kU5JBe/HY9kFp5GYeJQGuZvgLQgHgryGFELfMxUoPR7HTOBx5mwOljc9XGPvHy
	h8BQ==
X-Gm-Message-State: AD7BkJJYDiS2V44OPN7izqCzuWZsUxaGJfelc716L24qdKSkgSL+1W/ECpbD90WoIUt0SQ==
X-Received: by 10.66.124.130 with SMTP id mi2mr32104886pab.106.1457895496490; 
	Sun, 13 Mar 2016 11:58:16 -0700 (PDT)
Received: from localhost.localdomain (us-vpn.mytunneling.com. [192.81.211.71])
	by smtp.gmail.com with ESMTPSA id
	wh9sm26683470pab.8.2016.03.13.11.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 11:58:15 -0700 (PDT)
From: Mriyam Tamuli <mbtamuli@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Mar 2016 00:26:46 +0530
Message-Id: <1457895406-22196-1-git-send-email-mbtamuli@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
X-Mailman-Approved-At: Sun, 13 Mar 2016 16:40:36 -0400
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Mriyam Tamuli <mbtamuli@gmail.com>, jan.kiszka@web.de, balrogg@gmail.com
Subject: [Qemu-trivial] [PATCH 2/5] address_space: replaced function calls
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Mar 2016 18:58:25 -0000

replaced calls named cpu_physical_memory_* with address_space_*

hw/arm/armv7m.c
hw/arm/boot.c
hw/arm/musicpal.c
hw/arm/nseries.c
---
 hw/arm/armv7m.c   | 18 +++++++++---------
 hw/arm/boot.c     |  8 ++++----
 hw/arm/musicpal.c | 14 +++++++-------
 hw/arm/nseries.c  |  8 ++++----
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ed7d97f..5275e3a 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -31,7 +31,7 @@ static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
 static uint32_t bitband_readb(void *opaque, hwaddr offset)
 {
     uint8_t v;
-    cpu_physical_memory_read(bitband_addr(opaque, offset), &v, 1);
+    address_space_read(bitband_addr(opaque, offset), &v, 1);
     return (v & (1 << ((offset >> 2) & 7))) != 0;
 }
 
@@ -43,12 +43,12 @@ static void bitband_writeb(void *opaque, hwaddr offset,
     uint8_t v;
     addr = bitband_addr(opaque, offset);
     mask = (1 << ((offset >> 2) & 7));
-    cpu_physical_memory_read(addr, &v, 1);
+    address_space_read(addr, &v, 1);
     if (value & 1)
         v |= mask;
     else
         v &= ~mask;
-    cpu_physical_memory_write(addr, &v, 1);
+    address_space_write(addr, &v, 1);
 }
 
 static uint32_t bitband_readw(void *opaque, hwaddr offset)
@@ -59,7 +59,7 @@ static uint32_t bitband_readw(void *opaque, hwaddr offset)
     addr = bitband_addr(opaque, offset) & ~1;
     mask = (1 << ((offset >> 2) & 15));
     mask = tswap16(mask);
-    cpu_physical_memory_read(addr, &v, 2);
+    address_space_read(addr, &v, 2);
     return (v & mask) != 0;
 }
 
@@ -72,12 +72,12 @@ static void bitband_writew(void *opaque, hwaddr offset,
     addr = bitband_addr(opaque, offset) & ~1;
     mask = (1 << ((offset >> 2) & 15));
     mask = tswap16(mask);
-    cpu_physical_memory_read(addr, &v, 2);
+    address_space_read(addr, &v, 2);
     if (value & 1)
         v |= mask;
     else
         v &= ~mask;
-    cpu_physical_memory_write(addr, &v, 2);
+    address_space_write(addr, &v, 2);
 }
 
 static uint32_t bitband_readl(void *opaque, hwaddr offset)
@@ -88,7 +88,7 @@ static uint32_t bitband_readl(void *opaque, hwaddr offset)
     addr = bitband_addr(opaque, offset) & ~3;
     mask = (1 << ((offset >> 2) & 31));
     mask = tswap32(mask);
-    cpu_physical_memory_read(addr, &v, 4);
+    address_space_read(addr, &v, 4);
     return (v & mask) != 0;
 }
 
@@ -101,12 +101,12 @@ static void bitband_writel(void *opaque, hwaddr offset,
     addr = bitband_addr(opaque, offset) & ~3;
     mask = (1 << ((offset >> 2) & 31));
     mask = tswap32(mask);
-    cpu_physical_memory_read(addr, &v, 4);
+    address_space_read(addr, &v, 4);
     if (value & 1)
         v |= mask;
     else
         v &= ~mask;
-    cpu_physical_memory_write(addr, &v, 4);
+    address_space_write(addr, &v, 4);
 }
 
 static const MemoryRegionOps bitband_ops = {
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 8ba0e42..c89b533 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -281,8 +281,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
         int cmdline_size;
 
         cmdline_size = strlen(info->kernel_cmdline);
-        cpu_physical_memory_write(p + 8, info->kernel_cmdline,
-                                  cmdline_size + 1);
+        address_space_write(p + 8, info->kernel_cmdline,
+                            cmdline_size + 1);
         cmdline_size = (cmdline_size >> 2) + 1;
         WRITE_WORD(p, cmdline_size + 2);
         WRITE_WORD(p, 0x54410009);
@@ -296,7 +296,7 @@ static void set_kernel_args(const struct arm_boot_info *info)
         atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
         WRITE_WORD(p, (atag_board_len + 8) >> 2);
         WRITE_WORD(p, 0x414f4d50);
-        cpu_physical_memory_write(p, atag_board_buf, atag_board_len);
+        address_space_write(p, atag_board_buf, atag_board_len);
         p += atag_board_len;
     }
     /* ATAG_END */
@@ -372,7 +372,7 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
     }
     s = info->kernel_cmdline;
     if (s) {
-        cpu_physical_memory_write(p, s, strlen(s) + 1);
+        address_space_write(p, s, strlen(s) + 1);
     } else {
         WRITE_WORD(p, 0);
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 54548f3..e624d51 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -175,12 +175,12 @@ static void eth_rx_desc_put(uint32_t addr, mv88w8618_rx_desc *desc)
     cpu_to_le16s(&desc->buffer_size);
     cpu_to_le32s(&desc->buffer);
     cpu_to_le32s(&desc->next);
-    cpu_physical_memory_write(addr, desc, sizeof(*desc));
+    address_space_write(addr, desc, sizeof(*desc));
 }
 
 static void eth_rx_desc_get(uint32_t addr, mv88w8618_rx_desc *desc)
 {
-    cpu_physical_memory_read(addr, desc, sizeof(*desc));
+    address_space_read(addr, desc, sizeof(*desc));
     le32_to_cpus(&desc->cmdstat);
     le16_to_cpus(&desc->bytes);
     le16_to_cpus(&desc->buffer_size);
@@ -203,8 +203,8 @@ static ssize_t eth_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         do {
             eth_rx_desc_get(desc_addr, &desc);
             if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >= size) {
-                cpu_physical_memory_write(desc.buffer + s->vlan_header,
-                                          buf, size);
+                address_space_write(desc.buffer + s->vlan_header,
+                                    buf, size);
                 desc.bytes = size + s->vlan_header;
                 desc.cmdstat &= ~MP_ETH_RX_OWN;
                 s->cur_rx[i] = desc.next;
@@ -229,12 +229,12 @@ static void eth_tx_desc_put(uint32_t addr, mv88w8618_tx_desc *desc)
     cpu_to_le16s(&desc->bytes);
     cpu_to_le32s(&desc->buffer);
     cpu_to_le32s(&desc->next);
-    cpu_physical_memory_write(addr, desc, sizeof(*desc));
+    address_space_write(addr, desc, sizeof(*desc));
 }
 
 static void eth_tx_desc_get(uint32_t addr, mv88w8618_tx_desc *desc)
 {
-    cpu_physical_memory_read(addr, desc, sizeof(*desc));
+    address_space_read(addr, desc, sizeof(*desc));
     le32_to_cpus(&desc->cmdstat);
     le16_to_cpus(&desc->res);
     le16_to_cpus(&desc->bytes);
@@ -256,7 +256,7 @@ static void eth_send(mv88w8618_eth_state *s, int queue_index)
         if (desc.cmdstat & MP_ETH_TX_OWN) {
             len = desc.bytes;
             if (len < 2048) {
-                cpu_physical_memory_read(desc.buffer, buf, len);
+                address_space_read(desc.buffer, buf, len);
                 qemu_send_packet(qemu_get_queue(s->nic), buf, len);
             }
             desc.cmdstat &= ~MP_ETH_TX_OWN;
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index d9e61f7..1745d21 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -990,8 +990,8 @@ static void n800_gpmc_init(struct n800_s *s)
             (1 << 6) |		/* CSVALID */
             (4 << 0);		/* BASEADDRESS */
 
-    cpu_physical_memory_write(0x6800a078,		/* GPMC_CONFIG7_0 */
-                              &config7, sizeof(config7));
+    address_space_write(0x6800a078, /* GPMC_CONFIG7_0 */
+                        &config7, sizeof(config7));
 }
 
 /* Setup sequence done by the bootloader */
@@ -1003,7 +1003,7 @@ static void n8x0_boot_init(void *opaque)
     /* PRCM setup */
 #define omap_writel(addr, val)	\
     buf = (val);			\
-    cpu_physical_memory_write(addr, &buf, sizeof(buf))
+    address_space_write(addr, &buf, sizeof(buf))
 
     omap_writel(0x48008060, 0x41);		/* PRCM_CLKSRC_CTRL */
     omap_writel(0x48008070, 1);			/* PRCM_CLKOUT_CTRL */
@@ -1381,7 +1381,7 @@ static void n8x0_init(MachineState *machine,
                             sdram_size - 0x400000);
 
         n800_setup_nolo_tags(nolo_tags);
-        cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
+        address_space_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
     }
 }
 
-- 
2.5.0



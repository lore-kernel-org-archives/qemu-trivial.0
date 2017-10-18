Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4bnw-0007gL-0O
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 20:01:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4bnu-0007f3-0S
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 20:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4bnt-00062o-2q
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 20:01:46 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4bnm-0005zN-QY; Tue, 17 Oct 2017 20:01:38 -0400
Received: by mail-qt0-x243.google.com with SMTP id 1so7363836qtn.3;
	Tue, 17 Oct 2017 17:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yF3Y4oUNWsvICizr0VkT8z4PewOAlVkV5mYuMVr3QQA=;
	b=gSXUchNy3gIx5/rrz3jbe1QhWLMqmXFnyfxfvVtIzX1vW8BDWOPW/+h1kiLJfbgAnt
	SowKSZua9b/9X/Sl4ddj4wepbpChvMfM8G09iGczVlv/4XkFecoyYOxrhM4rFWAONm13
	dMA7BPF+8uvXOd1nDILD+O88a1EbK4hE4wD1e2dt48+y+5gq8r+57qYk0ELMxaDWofPg
	AAp+emSwWMAlwms000aGdWUmNxIeSeGRoQ28evaaJsTDxgHbzcWuEQCOYyAWafY+i3Lo
	v9mYroo5CSiGkNU8MQr13hqdfl6zfH4OKFENh+2NrTptNYqCU2Q7inhNdt46leJfPOGY
	MEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=yF3Y4oUNWsvICizr0VkT8z4PewOAlVkV5mYuMVr3QQA=;
	b=VgGOtrnfpUdyDtoKnM8fHZKF1W4lW39X1JpLs8PI4H78/mVN8vkJSg+K0chrUt9Tmu
	OGQQ6TBSicqs3UcG/Rm8o3UV0TrHW/8nLVNje4WQ6qu0Fi78ShfVlsOa+vTkUvIERMMr
	/lWafP938fIHffwLNobz06qokNlzmOqZLtwXQVTNaT7KSLi1fvBHMpV7EAc8kj4qqOeC
	OGJfi/Z6FOW2Q5UMJwumyaPfvANQq0Qc2O4VcgNuIR5s2fm5wd/DlUnowMB/sXxTECDb
	DiQnZuJhOVJ9Zy55PdqNkl+0oMZ8jNRhIcoXm7pvYPb0X5xSiLh9KpLnv2iprAavSiJN
	P8jg==
X-Gm-Message-State: AMCzsaVn+locw7QwXVHl9x/XW1imiXl8Ln0XsQIq+FFNaj3odj75L3Hw
	ruyoMAlA+G+hlP6oKhontlE=
X-Google-Smtp-Source: ABhQp+TjhnRUV2WAaTvGvRGcrRmJHcwO0CVf58I+ITdFuB0FuFkfqBaEsSGfiNR2csLzrjAfhvMnpw==
X-Received: by 10.237.55.102 with SMTP id i93mr661637qtb.333.1508284897907;
	Tue, 17 Oct 2017 17:01:37 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	j141sm3861862qke.91.2017.10.17.17.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 17:01:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 21:00:53 -0300
Message-Id: <20171018000053.27348-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2] hw/alpha/typhoon: simplify using the
 "unimplemented" sysbus device
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
X-List-Received-Date: Wed, 18 Oct 2017 00:01:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: add spaces for checkpatch...

ERROR: spaces required around that '*' (ctx:VxV)
#82: FILE: hw/alpha/typhoon.c:880:
+    create_unimplemented_device("pci0-io", 0x801fc000000ULL, 32*MB);
                                                                ^
total: 1 errors, 0 warnings, 57 lines checked

 hw/alpha/alpha_sys.h |  1 -
 hw/alpha/pci.c       | 26 --------------------------
 hw/alpha/typhoon.c   |  6 ++----
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index b6d8369ed7..9e67f78c60 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -15,7 +15,6 @@ PCIBus *typhoon_init(ram_addr_t, ISABus **, qemu_irq *, AlphaCPU *[4],
                      pci_map_irq_fn);
 
 /* alpha_pci.c.  */
-extern const MemoryRegionOps alpha_pci_ignore_ops;
 extern const MemoryRegionOps alpha_pci_conf1_ops;
 extern const MemoryRegionOps alpha_pci_iack_ops;
 
diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
index 8dde637bfe..e0bcde9f70 100644
--- a/hw/alpha/pci.c
+++ b/hw/alpha/pci.c
@@ -14,32 +14,6 @@
 #include "trace.h"
 
 
-/* Fallback for unassigned PCI I/O operations.  Avoids MCHK.  */
-
-static uint64_t ignore_read(void *opaque, hwaddr addr, unsigned size)
-{
-    return 0;
-}
-
-static void ignore_write(void *opaque, hwaddr addr, uint64_t v, unsigned size)
-{
-}
-
-const MemoryRegionOps alpha_pci_ignore_ops = {
-    .read = ignore_read,
-    .write = ignore_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 8,
-    },
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 8,
-    },
-};
-
-
 /* PCI config space reads/writes, to byte-word addressable memory.  */
 static uint64_t bw_conf1_read(void *opaque, hwaddr addr,
                               unsigned size)
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index ae11e012c7..d8e2cac3f3 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -11,6 +11,7 @@
 #include "cpu.h"
 #include "hw/hw.h"
 #include "hw/devices.h"
+#include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
 #include "alpha_sys.h"
 #include "exec/address-spaces.h"
@@ -876,10 +877,7 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
                                 &s->pchip.reg_mem);
 
     /* Pchip0 PCI I/O, 0x801.FC00.0000, 32MB.  */
-    memory_region_init_io(&s->pchip.reg_io, OBJECT(s), &alpha_pci_ignore_ops,
-                          NULL, "pci0-io", 32*MB);
-    memory_region_add_subregion(addr_space, 0x801fc000000ULL,
-                                &s->pchip.reg_io);
+    create_unimplemented_device("pci0-io", 0x801fc000000ULL, 32 * MB);
 
     b = pci_register_bus(dev, "pci",
                          typhoon_set_irq, sys_map_irq, s,
-- 
2.15.0.rc0



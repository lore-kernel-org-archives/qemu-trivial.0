Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4ahK-0001uF-AI
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 18:50:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ahG-0001sz-0N
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 18:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ahF-0007XH-5A
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 18:50:50 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:50056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4ah8-0007R8-Qv; Tue, 17 Oct 2017 18:50:42 -0400
Received: by mail-qt0-x243.google.com with SMTP id k31so7069517qta.6;
	Tue, 17 Oct 2017 15:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2WQe5bbeeieIBL77DuJ1diozXnZqzRaSKuEgiNu8aNw=;
	b=vAlsAg1a6G7frJo5Xr86G2MrPRh5QN5t00DJZrXG1xPCgyruePR8eCjdzWQA65dItQ
	uUZo+a+mtcis1CmqACDoSBeyZXFDQwSgaEqZrONC0U+wZk7Hp1aKqczcrKkM8jkqs+Dt
	a/pu2nUgsFdcwXhA65Jvx6yrhEUK7G+tf2a/VtzwvFhWH6HsGKF285BztyNXC3jkEIkX
	kCjuVnrHSMMXPqUjQ3478nrPPAUiOaVmeSy0c3xc8pPh9IyKiNChKubf9SInxEeSqMmo
	+lW8o9BwaSXp8ZXij14uGm4Wkg6C1q3hfqGqMRrl9PCTV+okpCR0IXpYzuPp9a+clJXo
	Y/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=2WQe5bbeeieIBL77DuJ1diozXnZqzRaSKuEgiNu8aNw=;
	b=jCmlbfAJNfSlWBt53nTK0BijQ6pDSNSDffj7UKOX5KBBmDlqqN0BYMTVACfle/BkDz
	qArzc/HAr5IndWuGzYL2c8Xa1q19iwSznvXtdDhmg44TnhdmwGRgLKk/Xhxa1EZMTiUc
	E8k4oYHx5QLgMLm08YjKnlMG71nj6yLKwcNfC0Yz1td+pY2Ecxgm4Q3H02ZyMx0tdxLC
	CgvDCtL1c9lu7q7Ez4924uUaBxdtj5Zm/bEURT12J2brjC40oOqQ+fGcxjN9Mh/cDxgm
	8nk2fJjdGpWg+zHCZGMk5EaiZ3p0N2MVaJ2LI+dqtfMccsUUNAepBUllMsPN7pkgoKtf
	gRlQ==
X-Gm-Message-State: AMCzsaUmBYona65VBzzECQXp2MD5Um5j/WgZu+fYGHfNb1LxHkECv6KI
	kxwL2qbuMf6frnhyVWfHwYo=
X-Google-Smtp-Source: ABhQp+QFBJGWkq/IIuu24Dd6Fszq5cq+4pPs23bdm3F8/FlF77d8puvIioNbBHm5bIYdYbGR9TKkgA==
X-Received: by 10.200.15.118 with SMTP id l51mr450288qtk.181.1508280640944;
	Tue, 17 Oct 2017 15:50:40 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	h36sm6952451qtd.69.2017.10.17.15.50.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 15:50:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 19:50:25 -0300
Message-Id: <20171017225025.25451-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH] hw/alpha/typhoon: simplify using the
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
X-List-Received-Date: Tue, 17 Oct 2017 22:50:51 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
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
index ae11e012c7..5852d6c582 100644
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
+    create_unimplemented_device("pci0-io", 0x801fc000000ULL, 32*MB);
 
     b = pci_register_bus(dev, "pci",
                          typhoon_set_irq, sys_map_irq, s,
-- 
2.15.0.rc0



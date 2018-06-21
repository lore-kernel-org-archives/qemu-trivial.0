Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39M-0004z2-Pa
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39G-0004sT-9I
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39F-0002Aw-9E
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:30 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39D-00029R-0P; Thu, 21 Jun 2018 13:13:27 -0400
Received: by mail-qt0-x243.google.com with SMTP id z6-v6so3529237qti.2;
	Thu, 21 Jun 2018 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mDFsqTKP5o5farRoCBSHuRIHFmlPoGFGPoegeQW6YGg=;
	b=sIdJf0004lGpCZXl1k/jcp2EPEiKYN6tyh/2qkL4Be1BwlKltuug6Qy7a4vuOcl4/M
	Nk5JyVhV16jmJ0azUXFUobn8uEBqIJQZ0eEnlvoLyAcxcADHYpdNHCFd24VatBCXOCcm
	J2P7dDwBwgrRYgeP65R4ojeoGWU1QsouRGhjXhXJI9JdjyPHcF9TkAcpp2H3CYDnCItX
	u8U9n1utApStRrgWa292l0lYnDWxk8xGIpxtS/BNRJQkE3wemfE9xbwYMPcJB/U6ogvg
	8060MX/SRTPaxxeQcPROuAL7CsFh3LmQWLoQQCZHxZNpWYK58qHG0cUAJQ9SvuYg6Y40
	ZQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mDFsqTKP5o5farRoCBSHuRIHFmlPoGFGPoegeQW6YGg=;
	b=Jl+j7bWaVFJjbJE9dpYZNWMrmnuu5MeQMBhs6NObqHyfyCxPdsrZfRpfxEInsON3Nk
	PbZXZk9maiTQ0t6AkHGlQkSIuIToDQfh2EUSv0u4KIwoQ2wwY2cdQb0QLE0Uu5kcx9sz
	wIMJTvpOycgw5kgLhoTNFFxbIeNc6cxBr7xflwzHGad56v/pCBZj0FqqiaU8NsZeEHTs
	L1S+R0eLM5yI8fx2pII45VJz4T2HezuHUKXAXfuUSspTn2KJ7u2eQ7lfVrlMyLfDNe93
	vg2E7jMs+G2kGhUINYuaRQmJBjNF6B76QK4VtMZVo/4lZvOZoxETL5Zt/+dJA0nRLDTK
	fSyA==
X-Gm-Message-State: APt69E2stVplahj9iFQ+TESWMh7YSLY+9iF25MFM8400XvgyIs5CdT8a
	Ndngfm9rFcNBEdSklB59nuA=
X-Google-Smtp-Source: ADUXVKIcIOT2m55ugjIo+13mUcpsgwFF1xEkqHUY/78O4RXtYLNkJOM/GA9XKSR3ge9WTzhjsMWKag==
X-Received: by 2002:a0c:e8cf:: with SMTP id
	m15-v6mr23310371qvo.52.1529601206454; 
	Thu, 21 Jun 2018 10:13:26 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Jun 2018 14:12:53 -0300
Message-Id: <20180621171257.14897-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 07/11] hw/net/ne2000: Add trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/ne2000.c     | 17 ++++++++++++-----
 hw/net/trace-events |  4 ++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 3a9fc89e48..26b234b7eb 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -26,6 +26,7 @@
 #include "net/eth.h"
 #include "ne2000.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 /* debug NE2000 card */
 //#define DEBUG_NE2000
@@ -662,19 +663,24 @@ static uint64_t ne2000_read(void *opaque, hwaddr addr,
                             unsigned size)
 {
     NE2000State *s = opaque;
+    uint64_t val;
 
     if (addr < 0x10 && size == 1) {
-        return ne2000_ioport_read(s, addr);
+        val = ne2000_ioport_read(s, addr);
     } else if (addr == 0x10) {
         if (size <= 2) {
-            return ne2000_asic_ioport_read(s, addr);
+            val = ne2000_asic_ioport_read(s, addr);
         } else {
-            return ne2000_asic_ioport_readl(s, addr);
+            val = ne2000_asic_ioport_readl(s, addr);
         }
     } else if (addr == 0x1f && size == 1) {
-        return ne2000_reset_ioport_read(s, addr);
+        val = ne2000_reset_ioport_read(s, addr);
+    } else {
+        val = ((uint64_t)1 << (size * 8)) - 1;
     }
-    return ((uint64_t)1 << (size * 8)) - 1;
+    trace_ne2000_read(addr, val);
+
+    return val;
 }
 
 static void ne2000_write(void *opaque, hwaddr addr,
@@ -682,6 +688,7 @@ static void ne2000_write(void *opaque, hwaddr addr,
 {
     NE2000State *s = opaque;
 
+    trace_ne2000_write(addr, data);
     if (addr < 0x10 && size == 1) {
         ne2000_ioport_write(s, addr, data);
     } else if (addr == 0x10) {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 45c4e9fba0..95a1de01e9 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -23,6 +23,10 @@ mipsnet_read(uint64_t addr, uint32_t val) "read addr=0x%" PRIx64 " val=0x%x"
 mipsnet_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64
 mipsnet_irq(uint32_t isr, uint32_t intctl) "set irq to %d (0x%02x)"
 
+# hw/net/ne2000.c
+ne2000_read(uint64_t addr, uint64_t val) "read addr=0x%" PRIx64 " val=0x%" PRIx64
+ne2000_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64
+
 # hw/net/opencores_eth.c
 open_eth_mii_write(unsigned idx, uint16_t v) "MII[0x%02x] <- 0x%04x"
 open_eth_mii_read(unsigned idx, uint16_t v) "MII[0x%02x] -> 0x%04x"
-- 
2.18.0.rc2



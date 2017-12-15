Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjV-00036j-SZ
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjT-00034f-TU
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjT-0005zw-23
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:19 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:41163)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjQ-0005vU-EY; Thu, 14 Dec 2017 22:32:16 -0500
Received: by mail-qk0-x242.google.com with SMTP id r184so1187426qke.8;
	Thu, 14 Dec 2017 19:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rbEz566N8BOlBa7etIIEoYiO0cxsRdvu9jzahRnw99U=;
	b=I4r30eDvr4GUOSf8shb+uMCYaBSII/+9thY+vlNPZ9/M6yeJN2FBM6flrUlGvUA4YY
	62ValmpcN0QZdINgXp5ON5+ZOHVG8r3KAHw67TMWGn1DwGC3oHTn7V75bToVbIEy1pPQ
	wU12VrO+0WhI4kTd5A4exlioBKEVk1e+vuqMvSdYQYb9l8EjUDS2Z+vtRbIlJjtHO3Bc
	10VI5rWi4k/z9FkLK6gIk+534qTKnPdBn8qkROT2Fc2e2BtmOJ2kGW5vJ7AHJ5FkkSda
	TvJjTEHdYVEYCUWiqrSZH5Wt+5M1l1yHN0bYgEo/Aer1hheWvQ4wbDjyvJtLQTfP/oEc
	vSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rbEz566N8BOlBa7etIIEoYiO0cxsRdvu9jzahRnw99U=;
	b=EpH1ZpN+sJRiSw5frqZpXnyQTLL/bKaktGYyDZmvVv9vk0MA/0Wef9+kSOi6aFo87L
	rVeBM8QgedDc7T3fOHJUH1yAemQaxCQlMIMF3gaisS+QPKAs+B21gByxS/TPRlVfj1Yf
	DGNuCev8laclaEDgWXKUM9pog5TnxWJwPUZzJMH4gqRbzCw0lldCy/RRZe97E34GY2Wo
	n6+n525ob3QO7TqCtTc4ivcAHY7N1sL2VqG1p19lzFSsjsyuv78chQzHe4sJU7gI3FUl
	z6fVlPpJLi2qcPp563xRZPLYU0RI4mvOLWENkBsrhM89TKjr6WmAPjvtvrAi4Gd5M+V0
	jmRA==
X-Gm-Message-State: AKGB3mIq08f2yV82jfTq+wwzYX9cwwCLLgYZz0GH4gRAjQFbXsnczgCU
	epY+n1sPW6QZisbB/kOUCts=
X-Google-Smtp-Source: ACJfBos/qHGnApdAriKlOyKwuuOlNNByUFbpRE4dfJgNl+cMBg8Mz/Sg63yl6jjCN3a+6FIqHfQUuA==
X-Received: by 10.233.216.67 with SMTP id u64mr18178274qkf.220.1513308735945; 
	Thu, 14 Dec 2017 19:32:15 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:15 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Guan Xuetao <gxt@mprc.pku.edu.cn>
Date: Fri, 15 Dec 2017 00:30:02 -0300
Message-Id: <20171215033015.738-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 30/43] hw/unicore32: restrict hw addr
 defines to source file
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:21 -0000

and drop unused #includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/unicore32/puv3.h | 10 ----------
 hw/unicore32/puv3.c         | 15 ++++++++++-----
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/hw/unicore32/puv3.h b/include/hw/unicore32/puv3.h
index 5a4839f8df..f587a1f622 100644
--- a/include/hw/unicore32/puv3.h
+++ b/include/hw/unicore32/puv3.h
@@ -14,16 +14,6 @@
 
 #define PUV3_REGS_OFFSET        (0x1000) /* 4K is reasonable */
 
-/* PKUnity System bus (AHB): 0xc0000000 - 0xedffffff (640MB) */
-#define PUV3_DMA_BASE           (0xc0200000) /* AHB-4 */
-
-/* PKUnity Peripheral bus (APB): 0xee000000 - 0xefffffff (128MB) */
-#define PUV3_GPIO_BASE          (0xee500000) /* APB-5 */
-#define PUV3_INTC_BASE          (0xee600000) /* APB-6 */
-#define PUV3_OST_BASE           (0xee800000) /* APB-8 */
-#define PUV3_PM_BASE            (0xeea00000) /* APB-10 */
-#define PUV3_PS2_BASE           (0xeeb00000) /* APB-11 */
-
 /* Hardware interrupts */
 #define PUV3_IRQS_NR            (32)
 
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 1b39cc035b..db26959a1d 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -11,16 +11,11 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "cpu.h"
 #include "ui/console.h"
-#include "elf.h"
-#include "exec/address-spaces.h"
-#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/i386/pc.h"
-#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
 #undef DEBUG_PUV3
@@ -29,6 +24,16 @@
 #define KERNEL_LOAD_ADDR        0x03000000
 #define KERNEL_MAX_SIZE         0x00800000 /* Just a guess */
 
+/* PKUnity System bus (AHB): 0xc0000000 - 0xedffffff (640MB) */
+#define PUV3_DMA_BASE           (0xc0200000) /* AHB-4 */
+
+/* PKUnity Peripheral bus (APB): 0xee000000 - 0xefffffff (128MB) */
+#define PUV3_GPIO_BASE          (0xee500000) /* APB-5 */
+#define PUV3_INTC_BASE          (0xee600000) /* APB-6 */
+#define PUV3_OST_BASE           (0xee800000) /* APB-8 */
+#define PUV3_PM_BASE            (0xeea00000) /* APB-10 */
+#define PUV3_PS2_BASE           (0xeeb00000) /* APB-11 */
+
 static void puv3_intc_cpu_handler(void *opaque, int irq, int level)
 {
     UniCore32CPU *cpu = opaque;
-- 
2.15.1



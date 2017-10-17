Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0v-0002ct-Vm
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0r-0002Xr-Nz
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0q-0003dl-Um
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:41 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0o-0003b3-Tz; Tue, 17 Oct 2017 12:46:38 -0400
Received: by mail-qk0-x241.google.com with SMTP id r64so2848679qkc.1;
	Tue, 17 Oct 2017 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=76TQI2GD/XFkAeKQ2lVjXo/Im8dtOZf8D4GXri1sPQ0=;
	b=TIoYZQUNsG2q0OM2roDRvdsA00Y4FjK5vYKjC2JV0swcbkmqtXqI/gULfR/K/YxcgC
	4u3fGyHvUbey5IsIYV9X05ka3ytIppI0YOwzTdX3JNUuHqUJ5E/7Vb9HJn6AEhglZLmz
	XmKnZtr8NOD44281BNYXksc1PpYIZlXH//3erKFVyFfn95rZclCy7zI4e9y5h+Znuq4n
	ElbibwAH7Em7QxtmCcobA2M9fweW10gVxfnd8kyCCKsuEM8HBTX39vsFl4Ht7Z6G/VHF
	LjjlLjz5hWNPq9y2ArhihpfRiYaAIsIYTuGpOIozW3MaCnada6oCGpFyeJt6douovxOr
	2rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=76TQI2GD/XFkAeKQ2lVjXo/Im8dtOZf8D4GXri1sPQ0=;
	b=H08OfWCq2kQuX2bngPZmxOpo7vIjT/L90iLUrBWCzcHoALtq1n4oluip6ZvHuKiZXq
	R708CyRanyXFA4FK7ZUYN15+7CO95sVxDqH2uKtPG8yOhClm/Odfkoofpu14bKqYbgqT
	kg9Go2I+MPaLsiqzhgty/t0OqREZRvVlgHU5SES3qgwC+tsCF1rNeHVw1KyVaURSeSI3
	0FMlrYdR0VTnjntRNG5OTLGNQNpv7QcTurYNl7KbOz3OyxOfj3UZjKdK0Tj64U7VGB7i
	lp6Y7SeTPRZaS5Oi5OMuZ1+ktAnnP3DOVhVprU3WcdukeG7nMaDeDbGFDEkMyqHykmDC
	NBOg==
X-Gm-Message-State: AMCzsaXLbuhhwRHtGpT23ln2tPHrEtV9/trQHy1+x8sc7dIoTeVIIPmo
	mDzJzsNSjHDJi8yiHISXrZBOiJZa
X-Google-Smtp-Source: ABhQp+RzWKj/dHIzCkYXXXHcyIcrtsscR30ehRoJpceG7Xxb9jr7gNtUaluLKEMXyFCmwpO7Dle5bw==
X-Received: by 10.55.137.196 with SMTP id l187mr14030114qkd.134.1508258795870; 
	Tue, 17 Oct 2017 09:46:35 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:14 -0300
Message-Id: <20171017164426.25277-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 30/42] hw/unicore32: restrict hw addr
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:42 -0000

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
index 504ea46211..11fbd3cb0d 100644
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
2.15.0.rc0



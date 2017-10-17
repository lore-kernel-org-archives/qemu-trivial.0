Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FW4-0006r6-8l
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW1-0006oB-Fh
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW0-0004fA-Fp
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:49 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:49565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVy-0004da-4m; Mon, 16 Oct 2017 20:13:46 -0400
Received: by mail-qk0-x243.google.com with SMTP id q83so22759qke.6;
	Mon, 16 Oct 2017 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=haF+m8roxWJbqA8wTOEcMllGF/d3Z8gp2Ia7Bxv5STw=;
	b=M8HuEmw+2bt57DlciMI6IJWNjZgJuKQLhcNgATYl6Y1xJfY9R7PsuQlcHCM6yrMQiv
	WS1YiHdL+xAvmwWG7sOZKUOOZWrdoQXwHKf0PxtYt/SSv1UZLMN5vd39My/P3feIdu3X
	D0oj1lTE8c3KVaYpWfG2/5TTcQl+0sXYXe1Riv+YEdMbAPWy1FrwFMgoYqGmx3b7TEGO
	wnglBwATDpuqj8mIGHyoLp2VC26vZe2I61hwNtvg1ovhHaA0OHbNHCYjMvzszHxcY1cK
	0UC0CAGugE/4HSIEXDXJIntnl6CuorP5VN4eYDy7m90zoVY3BHRfBP95j3UKOgBh9zdS
	akVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=haF+m8roxWJbqA8wTOEcMllGF/d3Z8gp2Ia7Bxv5STw=;
	b=Kq4YmiTyAFIBtQMycLvuPyj3gtIxt/dETDyWSaPh+x6GdnHmzzKicBeQopmPhflrCp
	WFcEAlQVoNs163V0zMinpmZJs0KC9jlDOcKZiV97pkLMrlHFPkItOtS8REdsQqubsEJo
	dpfr7yDOKZJyVO0U+/a3Whzw5/W5XoIU8nl9kuwGxi+ysW76551t/rfY4VkXgpY5d6Q/
	xDYb7sfLXio7cdBHhy4j0pjr7jxfoJUPj5d5UEOlCiU31Y0ky3pLOR7IN4uXiZN4WRMj
	xWmZr3Wl8AZmWKnxqvVQgnQxik/pCEq6A7GsHcazC/n+qwbH4+niDW58/svhn6AGO6HI
	MPwQ==
X-Gm-Message-State: AMCzsaX2ZuCouvFt4YVquVsuave3PoIVTnfVlsCTnQXm7y5keDHLkZ04
	D2RjXuGg4ggc65Frb0+vvS16pGz3
X-Google-Smtp-Source: ABhQp+TLkGEAnd3KYnx9Y1YE9NJf/YGYIuSYOfiOVC9g2FJp3lgF7WQ9p94vN3+AsD/AfXZI86weDA==
X-Received: by 10.55.91.199 with SMTP id p190mr16627253qkb.291.1508199225637; 
	Mon, 16 Oct 2017 17:13:45 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:57 -0300
Message-Id: <20171017001209.32276-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 27/39] hw/unicore32: restrict hw addr
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:50 -0000

and drop unused #includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/unicore32/puv3.h | 10 ----------
 hw/unicore32/puv3.c         | 16 ++++++++++------
 2 files changed, 10 insertions(+), 16 deletions(-)

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
index 504ea46211..6849bac59c 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -11,16 +11,10 @@
 
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
-#include "hw/i386/pc.h"
-#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
 #undef DEBUG_PUV3
@@ -29,6 +23,16 @@
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



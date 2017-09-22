Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ5E-0005Ef-Gj
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5C-0005Cv-VN
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ59-0003We-Tb
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:39 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ55-0003Sv-Fa; Fri, 22 Sep 2017 11:41:31 -0400
Received: by mail-qt0-x241.google.com with SMTP id o3so882268qte.5;
	Fri, 22 Sep 2017 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=giCF0bY5YniJgFPw2GzNEhwxxcZO6CxOYYAFIN4Zrbw=;
	b=QGzyRb/Z9Z1mi2kfG3ioSvOyOxHYAK3vvrE0iSBhCQmRzNRM1MSxnNPan3wkLzfSSz
	GzmFFUrg+kGXfs588otfyvP1n6HaqklYEXKRKI8QGh3Hm4Nq0ebbzKenpYV4jYnzhlYZ
	q2Qyw/nKUyGLsj2uSkZ3Ktp4U6EHVWxyQitQj7x52x3Yqra/58J08wAWSSlgQrr1zFMH
	27eyVYc4w3wRQ3mBAC5jCE4E+RnlE/bRq+1Ncqafd6FtUzaLNbjEx/qCMHyavDrAxV1X
	3cdZ2MJyEykQN7rX00PuRRB8Ln50VFdegh6OpGYzXexhk3OXC7dMOIZWEgVb0xEz4+2O
	I4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=giCF0bY5YniJgFPw2GzNEhwxxcZO6CxOYYAFIN4Zrbw=;
	b=YXH7vwVSUZWPhiw/8FlWoyCQI5EXVbga2pwztgEFU8oqb9L55Zt2X7Z/a3d0nWWAzh
	0O9Zj1UfOvY0AeHGhib6nHQaELEGOhOvnI3YQut9zEvo4e1CkXfmijuu1vjJhfOS1ffe
	nEYnk/jQUi6oM0GJIAjkPTM7ItRAW9mHxkrKiN50Zif3O/s5tH3QpxMQirdWfyuFoPuM
	SgAc1dHOGQQJUU7k08OcCKAfJhSrROdYCaA7AeDz2lG/OA6gakFI7uaLuiHKR7rIpfvB
	A76hBg2+adayZWqys9G4+zH6AqpFHgDGFdF8F7/eSMAjYXuZGDbgd7jmMvcEDskpAI6W
	vVqw==
X-Gm-Message-State: AHPjjUgEFbsj3VRPSNR4ndRxV09+BF3t/xIw47Fbl990F1rBn4oZ1jpe
	vDqo5onQXJXLkV6VZH6ZJAI=
X-Google-Smtp-Source: AOwi7QBA/o4UcFpUyCpxx5sNz1UZcoXfouGsIZV887lIwnjMPa13e1F4xMxg66yeFbrA2EnTpiGzhA==
X-Received: by 10.200.9.61 with SMTP id t58mr8944612qth.337.1506094890981;
	Fri, 22 Sep 2017 08:41:30 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:58 -0300
Message-Id: <20170922154014.29350-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 18/34] hw/unicore32: restrict hw addr defines
 to source file
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:40 -0000

and drop unused #includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.14.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYiLl-0000wD-RF
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jul 2024 04:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYfxP-0000aw-0w
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 02:03:36 -0400
Received: from smtpcmd0987.aruba.it ([62.149.156.87])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYfxK-0005Vs-On
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 02:03:33 -0400
Received: from localhost.localdomain ([93.48.145.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YfxHsxLqUcvwVYfxHsOTOb; Tue, 30 Jul 2024 08:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1722319407; bh=Tvbf28qA9MBLLj+jr2qMi+M5DKY5MhWJE5Q1kMhnhYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=F2aucR8drF/yPoE15FWD6DZqA1J6zyarU0wS0b49MdR1PPnQuSuCIV4QQzwZEFfEb
 ICB5Hl5hOdl4hgaB6ajQT81YjIxjBo6saCVLbPGZ6zlxiguj65ky87gVCvXoT4RwQG
 G2ErwHHHycURKWGxCBQ4uJ6d8S5FG7afdRvpjkX9HaYAyTUoRXzj+rXc30B80t9/D2
 YvgiHX+EDUMoGNGY8CI+eWyNJ4ocjWf4awNyM/dqnFhf3NR1mVLjVKIVNp7TlFeyL3
 pZ1DlyT4FdAQchLVWP/8zWkZbcR0SVNxFP4lCe4xEleVvqr/PgMLKXlF26VJ1LQF4g
 qXjqtNrsmn5kA==
From: marco@palumbi.it
To: qemu-arm@nongnu.org
Cc: Marco Palumbi <Marco.Palumbi@tii.ae>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
Date: Tue, 30 Jul 2024 06:03:18 +0000
Message-ID: <20240730060322.72966-1-marco@palumbi.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM6AjDsTt4c7ONUayVJdS2eUWB2HYvluTnXIlC4SeWmtWrsWXjJQTd5LYe/zsOq7ZT2LBjSt+VK5xg+PmOPLISG6RmFprFOrlSa3BquXjH4eGkxJysf8
 uqOaqROY/Z2G+jghud/lcWNizp9btR0tzzYfbF5XXOUB/I5OkWHEXcySZO6Tx1PYlaaO7xWzq5W0yEoQSJYFoYHKOCUs07ph8AD8CWoDIksYT0QomEvyi1/f
 ryLd6MVzp6jPznMhzC9KIzawyOfFSxIZO/wjzXVq562yN8oOCF2UXW5KbEMCapFkwBry8SSn5VIw1jdPo03eLroJcngrt+SIPXOAW0fIEwo=
Received-SPF: pass client-ip=62.149.156.87; envelope-from=marco@palumbi.it;
 helo=smtpcmd0987.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Jul 2024 04:36:52 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2024 06:03:37 -0000

From: Marco Palumbi <Marco.Palumbi@tii.ae>

The order of the RX and TX interrupts are swapped.
This commit fixes the order as per the following documents:
 * https://developer.arm.com/documentation/dai0505/latest/
 * https://developer.arm.com/documentation/dai0521/latest/
 * https://developer.arm.com/documentation/dai0524/latest/
 * https://developer.arm.com/documentation/dai0547/latest/

Signed-off-by: Marco Palumbi <Marco.Palumbi@tii.ae>
---
 hw/arm/mps2-tz.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index a2d18afd79..aec57c0d68 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -435,7 +435,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size,
                                const int *irqs, const PPCExtraData *extradata)
 {
-    /* The irq[] array is tx, rx, combined, in that order */
+    /* The irq[] array is rx, tx, combined, in that order */
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
@@ -447,8 +447,8 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->apb_periph_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[0]));
     sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2));
     sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 + 1));
     sysbus_connect_irq(s, 4, get_sse_irq_in(mms, irqs[2]));
-- 
2.43.0



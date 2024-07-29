Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sYiLl-0000vZ-MO
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jul 2024 04:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYesj-0004cv-60
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 00:54:41 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marco@palumbi.it>) id 1sYesf-0001Rm-Sr
 for qemu-trivial@nongnu.org; Tue, 30 Jul 2024 00:54:40 -0400
Received: from localhost.localdomain ([93.48.145.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YX0gsBXiIegg3YX0gs6la7; Mon, 29 Jul 2024 22:30:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1722285022; bh=Tvbf28qA9MBLLj+jr2qMi+M5DKY5MhWJE5Q1kMhnhYc=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZJ2pSEtQCugYyjzzlHfrMS0xwd2n6cb/75UjQIAIpVov0yG6kKotahlpD9mOtyftW
 gar+M4tKijQnujdO2lT1n0QxDkRwS2kBuy+BT1Rowxtxy/6TSejfvC/JUaj4LqivGR
 24+54pAlgu+F+vZSfcKkiV+xol221NpNSuVjVSTJFsDtQaZwpKR03PAGz5TbaAXeq4
 093xDUDnKISDBl4og8NPwGOZsEDtql90ogTCjRUz49s64Q2tTtEVMIuN0HMtYwdTFt
 PHbZuRY4EqL/Mg0tc3EoOaPk6AdMSs5sDesamrY8MfWZA27MqgLtvKOIfCpEaVWnr1
 rChEjI29CxL6g==
From: marco@palumbi.it
To: qemu-arm@nongnu.org
Cc: Marco Palumbi <Marco.Palumbi@tii.ae>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: fix RX/TX interrupts order
Date: Mon, 29 Jul 2024 20:30:16 +0000
Message-ID: <20240729203020.72937-1-marco@palumbi.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEidVWUwyBQEgMX2gMq5c67nHro0koOox+iRxqAMA+56sO8o3ZRl07b8VYgN5KsDeqNcbPhvzQ7OzmdYBhmAgJW9t3Lh9LNRnN64q0ntb0l3tHoJ03Ft
 AT9l+dFq3DLoDSLCXEQsLd0n3ZI5YvXMxaX5g+sxGUmh3XBuYY1WxVOUyK9aHGpFrDsXxpkhTNTADDxoXeljKwWeeh2J9iFh424EXssDg9FeW1MxDthNG/cZ
 eO0SFoE8hmwSQDLJ7KYTatQAyREuGK0eNrAzQffMVAgNi2cz72va7vi3rzedO8E8seO2NJKELwTMOnHJaojRyLpuPJYUgrdnEWgSlmcRemk=
Received-SPF: pass client-ip=62.149.156.101; envelope-from=marco@palumbi.it;
 helo=smtpcmd10101.aruba.it
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
X-List-Received-Date: Tue, 30 Jul 2024 04:54:41 -0000

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



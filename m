Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnke-0006fO-5i
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkb-0006av-Lq
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0000of-Az
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkU-0000hZ-Jz; Sat, 08 Oct 2016 05:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F17CC40ED7;
	Sat,  8 Oct 2016 12:16:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 083E0B33;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19225 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:48 +0300
Message-Id: <a1c2bbc87b227dbf8e00b9684544eff9c861fcf7.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/26] bt-hci-csr: drop unused argument
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:02 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/nseries.c | 3 +--
 hw/bt/hci-csr.c  | 2 +-
 include/hw/bt.h  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index fea911e..c86cf80 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -786,8 +786,7 @@ static void n8x0_cbus_setup(struct n800_s *s)
 
 static void n8x0_uart_setup(struct n800_s *s)
 {
-    CharDriverState *radio = uart_hci_init(
-                    qdev_get_gpio_in(s->mpu->gpio, N8X0_BT_HOST_WKUP_GPIO));
+    CharDriverState *radio = uart_hci_init();
 
     qdev_connect_gpio_out(s->mpu->gpio, N8X0_BT_RESET_GPIO,
                     csrhci_pins_get(radio)[csrhci_pin_reset]);
diff --git a/hw/bt/hci-csr.c b/hw/bt/hci-csr.c
index d688372..b77c036 100644
--- a/hw/bt/hci-csr.c
+++ b/hw/bt/hci-csr.c
@@ -458,7 +458,7 @@ qemu_irq *csrhci_pins_get(CharDriverState *chr)
     return s->pins;
 }
 
-CharDriverState *uart_hci_init(qemu_irq wakeup)
+CharDriverState *uart_hci_init(void)
 {
     struct csrhci_s *s = (struct csrhci_s *)
             g_malloc0(sizeof(struct csrhci_s));
diff --git a/include/hw/bt.h b/include/hw/bt.h
index 963f330..2fa22bd 100644
--- a/include/hw/bt.h
+++ b/include/hw/bt.h
@@ -128,7 +128,7 @@ enum {
     __csrhci_pins,
 };
 qemu_irq *csrhci_pins_get(CharDriverState *chr);
-CharDriverState *uart_hci_init(qemu_irq wakeup);
+CharDriverState *uart_hci_init(void);
 
 /* bt-l2cap.c */
 struct bt_l2cap_device_s;
-- 
2.1.4



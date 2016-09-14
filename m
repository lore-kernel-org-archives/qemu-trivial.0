Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6yA-0005Hf-R9
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:59:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bk6y9-0005GM-9Z
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bk6y8-0000Y1-CO
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:59:05 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bk6y2-0000TK-3m; Wed, 14 Sep 2016 05:58:58 -0400
Received: by mail-wm0-f66.google.com with SMTP id c131so1735089wmh.2;
	Wed, 14 Sep 2016 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SCa5f4/eI0fpXwGDeKCooVHlEymVqAQLOf3Ela9T6w8=;
	b=rXcpU5IyvEp6V4mY/BH9GlokTAMj1UVgal3mr7bFTW63Rlc0J8PEdbMNkHympF5Nli
	GFLpOwirfOfJ3c0NZpvLhRr7hZ9qyFTPhGxIhWrWh3VydUJHWJQDUVCeZacrpKtFkbKH
	EpLkbs+AYs35zIV7QHlidAmNj8yHKLQQ4/bAY1RGSjUNepEu5kNLUXBboMsMRbf65Yhu
	dJriPZNw4r5Wd0GVe2DnSXSQkimNLsvwFE2xuFzjVy1ZtVcCDmJfDcVGAUYXm0D77ZsZ
	DZEiyX1UU4RDN6BGhuEoqqOL/wPzvpMeyzgTT1oQOu1AfvzLkGWGz9nERE5urbcAuN+U
	mEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=SCa5f4/eI0fpXwGDeKCooVHlEymVqAQLOf3Ela9T6w8=;
	b=N4xCPLSrOJyull84V3RO08rnoPEgX0+ojfRrXL8Km45gUWYqUAe0d/TQ8pObWyRAA8
	LGOXpAXcY5f6kyZR7SMg8uf4zUaklgIw0Sp69ecPk0bnaDP+6mhUnTEft11raiGDSPKP
	4coByHNFdtRwKFh9/gB3uW7Hoqb+AnoyH8xKUShwxwg4mauUvbMx2YgLYOH8W/j+ZU2F
	KjkPNuqvRpanXaE4pCwzZcYCXjJ0+2M9jVB1xBxVRiBhAYOJ8Yp2Q+T47jybvbBvLcWs
	gSp/Y43z20VCBXJgBWuDH1ZLk4Oyq9ycSm5ydmPDhMBD5xqvJ2/xPKm0yp0+yg4faF39
	wFuQ==
X-Gm-Message-State: AE9vXwN0I3J9EBi11NkpivEiW2fkKgsxc7+5x8YMVY9JNFHJRBJswWqbpnAXFrQDauf/MQ==
X-Received: by 10.194.161.166 with SMTP id xt6mr1843741wjb.165.1473847077184; 
	Wed, 14 Sep 2016 02:57:57 -0700 (PDT)
Received: from donizetti.lan (94-39-176-182.adsl-ull.clienti.tiscali.it.
	[94.39.176.182]) by smtp.gmail.com with ESMTPSA id
	137sm9892412wmi.16.2016.09.14.02.57.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 02:57:56 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed, 14 Sep 2016 11:57:53 +0200
Message-Id: <1473847073-20930-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: [Qemu-trivial] [PATCH] bt-hci-csr: drop unused argument
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
X-List-Received-Date: Wed, 14 Sep 2016 09:59:06 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 185e79d..03124dc 100644
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
2.7.4



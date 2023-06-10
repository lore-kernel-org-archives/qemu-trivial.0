Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q7sYl-0002u7-Dc
	for mharc-qemu-trivial@gnu.org; Sat, 10 Jun 2023 02:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1q7sYf-0002oj-Co; Sat, 10 Jun 2023 02:58:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1q7sYd-0005xT-Pt; Sat, 10 Jun 2023 02:58:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6D38ABE2B;
 Sat, 10 Jun 2023 09:58:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E9CA9B298;
 Sat, 10 Jun 2023 09:58:00 +0300 (MSK)
Received: (nullmailer pid 1107526 invoked by uid 1000);
 Sat, 10 Jun 2023 06:57:58 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 11/16] hw/usb/hcd-ehci-pci: Simplify using DEVICE_GET_CLASS()
 macro
Date: Sat, 10 Jun 2023 09:57:49 +0300
Message-Id: <4c030dd00f617b432524f7f9627192cb9b328bcb.1686379708.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1686379708.git.mjt@tls.msk.ru>
References: <cover.1686379708.git.mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sat, 10 Jun 2023 06:58:48 -0000

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-ehci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 4c37c8e227..345444a573 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -74,7 +74,7 @@ static void usb_ehci_pci_realize(PCIDevice *dev, Error **errp)
 
 static void usb_ehci_pci_init(Object *obj)
 {
-    DeviceClass *dc = OBJECT_GET_CLASS(DeviceClass, obj, TYPE_DEVICE);
+    DeviceClass *dc = DEVICE_GET_CLASS(obj);
     EHCIPCIState *i = PCI_EHCI(obj);
     EHCIState *s = &i->ehci;
 
-- 
2.39.2



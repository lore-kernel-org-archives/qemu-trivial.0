Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08gu-00087R-TP
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:26:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gr-00081L-Bv
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08gq-0005w6-DL
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:26:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08gk-0005rS-Ua; Wed, 03 Jun 2015 09:26:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C9EE64076E;
	Wed,  3 Jun 2015 16:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 340CEA6B;
	Wed,  3 Jun 2015 16:08:55 +0300 (MSK)
Received: (nullmailer pid 27463 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:45 +0300
Message-Id: <26c8acb3f326166bf9dc60c3e8184f4b862e8451.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 25/30] hw/display/tc6393xb.c: Fix misusing
	qemu_allocate_irqs for single irq
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2015 13:26:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/tc6393xb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 66b7ade..f5f3f3e 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -571,7 +571,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
 
-    s->l3v = *qemu_allocate_irqs(tc6393xb_l3v, s, 1);
+    s->l3v = qemu_allocate_irq(tc6393xb_l3v, s, 0);
     s->blanked = 1;
 
     s->sub_irqs = qemu_allocate_irqs(tc6393xb_sub_irq, s, TC6393XB_NR_IRQS);
-- 
2.1.4



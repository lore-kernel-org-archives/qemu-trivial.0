Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoa2-0001Sp-JN
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZw-0001EY-8K
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZt-0005dc-5K
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZk-0005WI-O5; Mon, 27 Jul 2015 16:00:41 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EFF68425B6;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 837C0A6E;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9517 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:04 +0300
Message-Id: <be66680e8320d612f1c96096a217e642e458f47b.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PULL 01/10] hw/acpi/ich9: clear smi_en on reset
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:54 -0000

From: Laszlo Ersek <lersek@redhat.com>

Otherwise on reboot firmware might think (due to APMC_EN remaining set
from the previous boot) that SMI support is absent.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/ich9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index f04f6dc..8da5a2d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -221,6 +221,7 @@ static void pm_reset(void *opaque)
     acpi_pm_tmr_reset(&pm->acpi_regs);
     acpi_gpe_reset(&pm->acpi_regs);
 
+    pm->smi_en = 0;
     if (!pm->smm_enabled) {
         /* Mark SMM as already inited to prevent SMM from running. KVM does not
          * support SMM mode. */
-- 
2.1.4



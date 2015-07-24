Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIhW9-0004Uz-V2
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2015 14:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZIhW6-0004Ms-8H
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 14:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZIhW5-0001hy-9f
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 14:16:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1ZIhW2-0001g0-0P; Fri, 24 Jul 2015 14:16:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B291E2CD814;
	Fri, 24 Jul 2015 18:16:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com ([10.10.116.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6OIG8dh020543; Fri, 24 Jul 2015 14:16:11 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jul 2015 20:16:00 +0200
Message-Id: <1437761762-19798-2-git-send-email-lersek@redhat.com>
In-Reply-To: <1437761762-19798-1-git-send-email-lersek@redhat.com>
References: <1437761762-19798-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH for-2.4-rc3 1/3] hw/acpi/ich9: clear smi_en
	on reset
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
X-List-Received-Date: Fri, 24 Jul 2015 18:16:19 -0000

Otherwise on reboot firmware might think (due to APMC_EN remaining set
from the previous boot) that SMI support is absent.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
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
1.8.3.1




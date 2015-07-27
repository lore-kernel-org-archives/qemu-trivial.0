Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoTp-0003HX-Ey
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-00033c-BS
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTj-0002bz-J1
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoTe-0002a1-E8; Mon, 27 Jul 2015 15:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BDE07425AF;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A1156A66;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: (nullmailer pid 9519 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:05 +0300
Message-Id: <f3c30aeaa7888aee96a1fa28f259fb8312d47ab2.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PULL 02/10] hw/acpi/ich9: clean up stale comment
	about KVM not supporting SMM
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
X-List-Received-Date: Mon, 27 Jul 2015 19:54:29 -0000

From: Laszlo Ersek <lersek@redhat.com>

Commit fba72476c6 ("ich9: add smm_enabled field and arguments") detached
SMM availability from kvm_enabled(). However, the comment in pm_reset()
was not updated; let's do it now.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/acpi/ich9.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 8da5a2d..1c7fcfa 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -223,8 +223,7 @@ static void pm_reset(void *opaque)
 
     pm->smi_en = 0;
     if (!pm->smm_enabled) {
-        /* Mark SMM as already inited to prevent SMM from running. KVM does not
-         * support SMM mode. */
+        /* Mark SMM as already inited to prevent SMM from running. */
         pm->smi_en |= ICH9_PMIO_SMI_EN_APMC_EN;
     }
     pm->smi_en_wmask = ~0;
-- 
2.1.4



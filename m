Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHyW-0006si-VE
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyR-0006ma-Mk
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyQ-0003TC-SE
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHyL-0003Nu-4G; Wed, 12 Jul 2017 09:46:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4262740F68;
	Wed, 12 Jul 2017 16:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B374AAD1;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: (nullmailer pid 29040 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:01 +0300
Message-Id: <667675623dc20b8d2f9ec2eff8a1c7eafcc86e19.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/13] hw/pci: define msi_nonbroken in pci-stub
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
X-List-Received-Date: Wed, 12 Jul 2017 13:46:41 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The kludged field 'msi_nonbroken' is declared in "hw/pci/msi.h" and defin=
ed in
hw/pci/msi.c.
When using an ARM config with CONFIG_PCI disabled, hw/pci/msi.c is not in=
cluded.
Without being PCI-related, the files hw/intc/arm_gicv[23*].c do access th=
is
field (to enable the kludge if PCI is enabled).
The final link fails since hw/pci/msi.c is not included.
Defining this field in pci-stub is safe enough for configs without CONFIG=
_PCI.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci/pci-stub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 36d2c430c5..ecad664946 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -24,6 +24,9 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "qmp-commands.h"
+#include "hw/pci/msi.h"
+
+bool msi_nonbroken;
=20
 PciInfoList *qmp_query_pci(Error **errp)
 {
--=20
2.11.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQh3Y-000344-Aq
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:05:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3T-0002yV-BY
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3S-00068o-Co
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQh3O-00067H-Lp; Sun, 17 Dec 2017 17:05:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4618741177;
	Mon, 18 Dec 2017 01:04:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 38EBDD63;
	Mon, 18 Dec 2017 00:25:50 +0300 (MSK)
Received: (nullmailer pid 30951 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:38 +0300
Message-Id: <0ea07192c4cb4238a00c7d0df62ebc8344cdbe4f.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 33/61] ppc: remove duplicated includes
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
X-List-Received-Date: Sun, 17 Dec 2017 22:05:08 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

applied using ./scripts/clean-includes

not needed since 7ebaf795560

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 1 -
 target/ppc/kvm.c     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index be22a6b289..51eba52e86 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -13,7 +13,6 @@
 #include "trace.h"
 #include "kvm_ppc.h"
 #include "hw/ppc/spapr_ovec.h"
-#include "qemu/error-report.h"
 #include "mmu-book3s-v3.h"
=20
 struct SPRSyncState {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 9d57debf0e..4664a3ce9d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -47,9 +47,6 @@
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
 #include "qemu/mmap-alloc.h"
-#if defined(TARGET_PPC64)
-#include "hw/ppc/spapr_cpu_core.h"
-#endif
 #include "elf.h"
 #include "sysemu/kvm_int.h"
=20
--=20
2.11.0



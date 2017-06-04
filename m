Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpb-0006wC-Kc
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006sJ-EA
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005BD-Ph
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004yM-8J; Sun, 04 Jun 2017 11:52:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 81919404E7;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 06B7F5E9;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16383 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:18 +0300
Message-Id: <2283adfb0aa1ccc70c4a4a951423343dcb9e94d9.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/22] hw/mips: add missing include
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
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/mips/mips.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index e0065ce808..16412dc150 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -6,6 +6,7 @@
 #define INITRD_PAGE_MASK (~((1 << 16) - 1))
=20
 #include "exec/memory.h"
+#include "hw/irq.h"
=20
 /* gt64xxx.c */
 PCIBus *gt64120_register(qemu_irq *pic);
--=20
2.11.0



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4Gjf-0005vh-TH
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jul 2013 16:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4Gjd-0005r2-DB
	for qemu-trivial@nongnu.org; Tue, 30 Jul 2013 16:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4Gjc-000773-1B
	for qemu-trivial@nongnu.org; Tue, 30 Jul 2013 16:41:33 -0400
Received: from [2a03:4000:2:362::1] (port=40067
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V4GjY-00074t-P2; Tue, 30 Jul 2013 16:41:28 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 61D91183F6E; Tue, 30 Jul 2013 22:41:24 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Tue, 30 Jul 2013 22:41:23 +0200
Message-Id: <1375216883-23969-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.a@redhat.com>
Subject: [Qemu-trivial] [PATCH for 1.6] tci: Fix broken build (compiler
	warning caused by redefined macro BIT)
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
X-List-Received-Date: Tue, 30 Jul 2013 20:41:34 -0000

The definition of macro BIT in tci/tcg-target.c now conflicts with the
definition of the same macro in includes qemu/bitops.h.

This conflict was triggered by a recent change in the include chain of
tcg.c (probably commit 949fc82314cc84162e64a5323764527a542421ce).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tci/tcg-target.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
index d1241b5..e118bc7 100644
--- a/tcg/tci/tcg-target.c
+++ b/tcg/tci/tcg-target.c
@@ -34,9 +34,6 @@
         tcg_abort(); \
     } while (0)
 
-/* Single bit n. */
-#define BIT(n) (1 << (n))
-
 /* Bitfield n...m (in 32 bit value). */
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
1.7.10.4



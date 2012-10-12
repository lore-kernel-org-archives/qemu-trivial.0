Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMjWc-0003uj-M5
	for mharc-qemu-trivial@gnu.org; Fri, 12 Oct 2012 13:59:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TMjWa-0003rL-Ta
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 13:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TMjWZ-0005qw-U5
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 13:59:52 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:50933
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TMjWX-0005ps-0x; Fri, 12 Oct 2012 13:59:49 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TMjWS-0003P3-H3; Fri, 12 Oct 2012 18:59:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Oct 2012 18:59:44 +0100
Message-Id: <1350064784-13058-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Avi Kivity <avi@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] targphys.h: Don't define target_phys_addr_t
	for user-mode emulators
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
X-List-Received-Date: Fri, 12 Oct 2012 17:59:53 -0000

Commit 4be403c accidentally defined the target_phys_addr_t type when
building user-mode emulators. Since the type doesn't really make
any sense except for system emulators, avoid defining it when building
in user mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
cf brief discussion earlier:
http://lists.gnu.org/archive/html/qemu-devel/2012-10/msg01138.html

 targphys.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/targphys.h b/targphys.h
index 08cade9..50911fd 100644
--- a/targphys.h
+++ b/targphys.h
@@ -3,6 +3,8 @@
 #ifndef TARGPHYS_H
 #define TARGPHYS_H
 
+#ifndef CONFIG_USER_ONLY
+
 #define TARGET_PHYS_ADDR_BITS 64
 /* target_phys_addr_t is the type of a physical address (its size can
    be different from 'target_ulong').  */
@@ -18,3 +20,5 @@ typedef uint64_t target_phys_addr_t;
 #define TARGET_PRIXPHYS PRIX64
 
 #endif
+
+#endif
-- 
1.7.9.5



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WGwAm-0007La-Ol
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2014 14:54:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGwAl-0007Jv-1J
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:54:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGwAk-0006MA-71
	for qemu-trivial@nongnu.org; Fri, 21 Feb 2014 14:54:10 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:43222
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WGwAe-0006Kp-79; Fri, 21 Feb 2014 14:54:04 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 99C7B17F70D; Fri, 21 Feb 2014 20:54:01 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 21 Feb 2014 20:54:01 +0100
Message-Id: <1393012441-4112-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] libvixl: Fix typo in comment
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
X-List-Received-Date: Fri, 21 Feb 2014 19:54:11 -0000

* substract -> subtract

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/libvixl/a64/constants-a64.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/libvixl/a64/constants-a64.h b/disas/libvixl/a64/constants-a64.h
index 2e0336d..3d7b3c1 100644
--- a/disas/libvixl/a64/constants-a64.h
+++ b/disas/libvixl/a64/constants-a64.h
@@ -71,7 +71,7 @@ V_(ImmDPShift, 15, 10, Bits)                                                   \
 V_(ImmAddSub, 21, 10, Bits)                                                    \
 V_(ShiftAddSub, 23, 22, Bits)                                                  \
                                                                                \
-/* Add/substract extend */                                                     \
+/* Add/subtract extend */                                                      \
 V_(ImmExtendShift, 12, 10, Bits)                                               \
 V_(ExtendMode, 15, 13, Bits)                                                   \
                                                                                \
-- 
1.7.10.4



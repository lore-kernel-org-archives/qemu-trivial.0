Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCuME-0004HJ-KT
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCuM9-0004AI-FJ
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCuM6-0000HT-9E
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:37:01 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59457 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCuLy-0000Cv-2i; Fri, 23 Aug 2013 12:36:50 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCuLw-0002Lu-LD; Fri, 23 Aug 2013 17:36:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2013 17:36:48 +0100
Message-Id: <1377275808-9017-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] slirp/arp_table.c: Avoid shifting into sign
	bit of signed integers
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
X-List-Received-Date: Fri, 23 Aug 2013 16:37:04 -0000

"0xf << 28" shifts right into the sign bit, since 0xf is a signed
integer. Use the 'U' suffix to force an unsigned shift to avoid
this undefined behaviour and a clang sanitizer warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 slirp/arp_table.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/slirp/arp_table.c b/slirp/arp_table.c
index bf698c1..ecdb0ba 100644
--- a/slirp/arp_table.c
+++ b/slirp/arp_table.c
@@ -38,7 +38,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
                 ethaddr[3], ethaddr[4], ethaddr[5]));
 
     /* Check 0.0.0.0/8 invalid source-only addresses */
-    if ((ip_addr & htonl(~(0xf << 28))) == 0) {
+    if ((ip_addr & htonl(~(0xfU << 28))) == 0) {
         return;
     }
 
@@ -74,7 +74,7 @@ bool arp_table_search(Slirp *slirp, uint32_t ip_addr,
     DEBUG_ARG("ip = 0x%x", ip_addr);
 
     /* Check 0.0.0.0/8 invalid source-only addresses */
-    assert((ip_addr & htonl(~(0xf << 28))) != 0);
+    assert((ip_addr & htonl(~(0xfU << 28))) != 0);
 
     /* If broadcast address */
     if (ip_addr == 0xffffffff || ip_addr == broadcast_addr) {
-- 
1.7.9.5



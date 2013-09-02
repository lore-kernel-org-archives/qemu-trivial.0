Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2p-00015C-B3
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2j-0000te-Fm
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2f-00008J-DK
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-0008Vh-1v; Mon, 02 Sep 2013 07:11:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C4BA40240;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BAB64211;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14633 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:25 +0400
Message-Id: <1378119695-14568-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 05/15] slirp/arp_table.c: Avoid shifting into
	sign bit of signed integers
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:42 -0000

From: Peter Maydell <peter.maydell@linaro.org>

"0xf << 28" shifts right into the sign bit, since 0xf is a signed
integer. Use the 'U' suffix to force an unsigned shift to avoid
this undefined behaviour and a clang sanitizer warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
1.7.10.4



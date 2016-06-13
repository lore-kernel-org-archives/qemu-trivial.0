Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCOQo-00008r-OD
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 05:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOQm-00006v-Fe
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bCOQl-0002xz-HT
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 05:45:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52483)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bCOQh-0002ou-12; Mon, 13 Jun 2016 05:45:11 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4C50341126;
	Mon, 13 Jun 2016 12:44:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AA915AAB;
	Mon, 13 Jun 2016 12:44:58 +0300 (MSK)
Received: (nullmailer pid 29397 invoked by uid 1000);
	Mon, 13 Jun 2016 09:44:58 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 12:44:57 +0300
Message-Id: <1465811098-29354-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial 1/2] hw/bt/hci: spelling fix:
 endianness
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
X-List-Received-Date: Mon, 13 Jun 2016 09:45:17 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/bt/hci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 7d52205..963f683 100644
--- a/hw/bt/hci.c
+++ b/hw/bt/hci.c
@@ -421,7 +421,7 @@ static void bt_submit_raw_acl(struct bt_piconet_s *net, int length, uint8_t *dat
 
 /* HCI layer emulation */
 
-/* Note: we could ignore endiannes because unswapped handles will still
+/* Note: we could ignore endianness because unswapped handles will still
  * be valid as connection identifiers for the guest - they don't have to
  * be continuously allocated.  We do it though, to preserve similar
  * behaviour between hosts.  Some things, like the BD_ADDR cannot be
-- 
2.1.4



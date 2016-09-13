Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqVm-0006cF-7N
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:24:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVj-0006Y5-QB
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVh-0001kw-TT
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58079)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqVa-0001QH-Of; Tue, 13 Sep 2016 12:24:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 365BD416E5;
	Tue, 13 Sep 2016 19:24:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E05DAB0D;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: (nullmailer pid 31888 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 13 Sep 2016 19:04:41 +0300
Message-Id: <270a4b6739462d30a63033aa29e983c03d5104df.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/16] hw/bt/hci: spelling fix: endianness
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
X-List-Received-Date: Tue, 13 Sep 2016 16:24:40 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/bt/hci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/hci.c b/hw/bt/hci.c
index 351123f..476ebec 100644
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



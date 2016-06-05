Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9T0K-0001tu-94
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:01:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0H-0001qr-Pt
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0C-00084g-T1
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9T06-00082P-Kp; Sun, 05 Jun 2016 04:01:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 78FCB40916;
	Sun,  5 Jun 2016 11:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B55C5B0B;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1176 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:19 +0300
Message-Id: <da39ede7a38ad2a3e482a2f92b708d5a22284f10.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 42/52] crypto: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 08:01:50 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 crypto/block-luks.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 17c4300..63649f1 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -1081,8 +1081,7 @@ qcrypto_block_luks_create(QCryptoBlock *block,
         luks->header.key_slots[i].key_offset =
             (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
              QCRYPTO_BLOCK_LUKS_SECTOR_SIZE) +
-            (ROUND_UP(((splitkeylen + (QCRYPTO_BLOCK_LUKS_SECTOR_SIZE - 1)) /
-                       QCRYPTO_BLOCK_LUKS_SECTOR_SIZE),
+            (ROUND_UP(DIV_ROUND_UP(splitkeylen, QCRYPTO_BLOCK_LUKS_SECTOR_SIZE),
                       (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
                        QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) * i);
     }
@@ -1182,8 +1181,7 @@ qcrypto_block_luks_create(QCryptoBlock *block,
     luks->header.payload_offset =
         (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
          QCRYPTO_BLOCK_LUKS_SECTOR_SIZE) +
-        (ROUND_UP(((splitkeylen + (QCRYPTO_BLOCK_LUKS_SECTOR_SIZE - 1)) /
-                   QCRYPTO_BLOCK_LUKS_SECTOR_SIZE),
+        (ROUND_UP(DIV_ROUND_UP(splitkeylen, QCRYPTO_BLOCK_LUKS_SECTOR_SIZE),
                   (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
                    QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) *
          QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
-- 
2.1.4



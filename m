Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mf2-0005H5-0U
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mex-0005Ca-Ig
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mer-0003ID-Qr
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mem-0003H9-Qy; Tue, 31 May 2016 12:36:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66DEE7DCEA;
	Tue, 31 May 2016 16:36:40 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QK011053; Tue, 31 May 2016 12:36:36 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Tue, 31 May 2016 18:35:55 +0200
Message-Id: <1464712565-14857-7-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 May 2016 16:36:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 06/16] crypto: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:36:54 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5



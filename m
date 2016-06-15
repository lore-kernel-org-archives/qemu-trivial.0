Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDTv-00069p-P9
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:15:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTt-00067T-KM
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDTo-0003xQ-RV
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:15:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTi-0003uB-Dr; Wed, 15 Jun 2016 12:15:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17D773B730;
	Wed, 15 Jun 2016 16:15:42 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUt011275; Wed, 15 Jun 2016 12:15:40 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Wed, 15 Jun 2016 18:14:36 +0200
Message-Id: <1466007277-17525-7-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 15 Jun 2016 16:15:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 6/7] crypto: remove useless casts
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
X-List-Received-Date: Wed, 15 Jun 2016 16:15:54 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 crypto/cipher-builtin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
index 88963f6..d791c80 100644
--- a/crypto/cipher-builtin.c
+++ b/crypto/cipher-builtin.c
@@ -132,7 +132,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx = ctx;
 
-    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
+    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc,
                                    src, dst, length);
 }
 
@@ -144,7 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx = ctx;
 
-    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
+    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec,
                                    src, dst, length);
 }
 
-- 
2.5.5



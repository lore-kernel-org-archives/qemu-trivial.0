Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVtQq-0000Lu-Vq
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2020 05:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jVtQo-0000Kg-PP; Tue, 05 May 2020 05:00:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3677 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jVtQn-0001Sn-9K; Tue, 05 May 2020 05:00:02 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3F71355260504B10DAE6;
 Tue,  5 May 2020 16:59:55 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 5 May 2020
 16:59:49 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <berrange@redhat.com>, <laurent@vivier.eu>,
 <zhang.zhanghailiang@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>, "Euler
 Robot" <euler.robot@huawei.com>
Subject: [PATCH v2] crypto: Redundant type conversion for AES_KEY pointer
Date: Tue, 5 May 2020 16:59:40 +0800
Message-ID: <20200505085940.28592-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 04:59:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2020 09:00:03 -0000

We can delete the redundant type conversion if
we set the the AES_KEY parameter with 'const' in
qcrypto_cipher_aes_ecb_(en|de)crypt() function.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
v1->v2:
Cc: "Daniel P. Berrangé" <berrange@redhat.com>

Modify the AES_KEY parameter with 'const' in
qcrypto_cipher_aes_ecb_(en|de)crypt() methods.
(Base on Daniel P. Berrangé's suggestion)

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00515.html

---
 crypto/cipher-builtin.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
index bf8413e71a..35cf7820d9 100644
--- a/crypto/cipher-builtin.c
+++ b/crypto/cipher-builtin.c
@@ -74,7 +74,7 @@ static void qcrypto_cipher_free_aes(QCryptoCipher *cipher)
 }
 
 
-static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key,
+static void qcrypto_cipher_aes_ecb_encrypt(const AES_KEY *key,
                                            const void *in,
                                            void *out,
                                            size_t len)
@@ -100,7 +100,7 @@ static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key,
 }
 
 
-static void qcrypto_cipher_aes_ecb_decrypt(AES_KEY *key,
+static void qcrypto_cipher_aes_ecb_decrypt(const AES_KEY *key,
                                            const void *in,
                                            void *out,
                                            size_t len)
@@ -133,8 +133,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx = ctx;
 
-    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc, src, dst, length);
 }
 
 
@@ -145,8 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx = ctx;
 
-    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec, src, dst, length);
 }
 
 
-- 
2.23.0




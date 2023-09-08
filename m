Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeYFT-0002oa-DS
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 05:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeYF6-0002GH-7Y; Fri, 08 Sep 2023 05:57:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeYF2-00076O-42; Fri, 08 Sep 2023 05:57:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 36A70200DC;
 Fri,  8 Sep 2023 12:56:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 42A5F26923;
 Fri,  8 Sep 2023 12:56:00 +0300 (MSK)
Received: (nullmailer pid 276000 invoked by uid 1000);
 Fri, 08 Sep 2023 09:55:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 20/23] target/ppc: use g_free() in test_opcode_table()
Date: Fri,  8 Sep 2023 12:55:17 +0300
Message-Id: <20230908095520.275866-21-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908095520.275866-1-mjt@tls.msk.ru>
References: <20230908095520.275866-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2023 09:57:54 -0000

From: Daniel Henrique Barboza <danielhb413@gmail.com>

table[i] is allocated in create_new_table() using g_new().

Use g_free(table[i]) instead of free(table[i]) to comply with QEMU low
level memory management guidelines.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
[Mjt: minor commit comment tweak]
---
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 6b242ae0a6..5c28afbbb8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7158,7 +7158,7 @@ static int test_opcode_table(opc_handler_t **table, int len)
                 tmp = test_opcode_table(ind_table(table[i]),
                     PPC_CPU_INDIRECT_OPCODES_LEN);
                 if (tmp == 0) {
-                    free(table[i]);
+                    g_free(table[i]);
                     table[i] = &invalid_handler;
                 } else {
                     count++;
-- 
2.39.2



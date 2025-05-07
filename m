Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCj8W-0008Gd-38
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 14:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCj8J-0008Ds-LT; Wed, 07 May 2025 14:04:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCj8G-0008C7-69; Wed, 07 May 2025 14:04:39 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6C67E11FEFF;
 Wed, 07 May 2025 21:04:00 +0300 (MSK)
Received: from think4mjt.origo (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3EB4C206704;
 Wed,  7 May 2025 21:04:13 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 10/21] hw/net/e1000: Remove stray empty comment in header
Date: Wed,  7 May 2025 21:04:01 +0300
Message-Id: <20250507180412.182797-11-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507180412.182797-1-mjt@tls.msk.ru>
References: <20250507180412.182797-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 07 May 2025 18:04:41 -0000

From: Gustavo Romero <gustavo.romero@linaro.org>

In the header file, remove a stray empty comment in the Offload Context
Descriptor struct.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/e1000x_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index cd896fc0ca..e9a74de6f4 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -900,7 +900,7 @@ struct e1000_context_desc {
             uint16_t tucse;     /* TCP checksum end */
         } tcp_fields;
     } upper_setup;
-    uint32_t cmd_and_length;    /* */
+    uint32_t cmd_and_length;
     union {
         uint32_t data;
         struct {
-- 
2.39.5



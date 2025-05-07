Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCj9O-0001Px-RV
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 14:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCj9J-0000um-GQ; Wed, 07 May 2025 14:05:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCj9H-0008Rn-6w; Wed, 07 May 2025 14:05:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F11E211FF07;
 Wed, 07 May 2025 21:04:00 +0300 (MSK)
Received: from think4mjt.origo (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id C455120670C;
 Wed,  7 May 2025 21:04:13 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-trivial@nongnu.org
Subject: [PULL 18/21] qapi/qom.json: fix "the the" typo in comment
Date: Wed,  7 May 2025 21:04:09 +0300
Message-Id: <20250507180412.182797-19-mjt@tls.msk.ru>
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
X-List-Received-Date: Wed, 07 May 2025 18:05:43 -0000

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/qom.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 28ce24cd8d..04c118e4d6 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -871,7 +871,7 @@
 #     link characteristics read from PCIe Configuration space.
 #     To get the full path latency from CPU to CXL attached DRAM
 #     CXL device:  Add the latency from CPU to Generic Port (from
-#     HMAT indexed via the the node ID in this SRAT structure) to
+#     HMAT indexed via the node ID in this SRAT structure) to
 #     that for CXL bus links, the latency across intermediate switches
 #     and from the EP port to the actual memory.  Bandwidth is more
 #     complex as there may be interleaving across multiple devices
-- 
2.39.5



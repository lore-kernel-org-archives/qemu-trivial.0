Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfJKx-0008Sb-HZ
	for mharc-qemu-trivial@gnu.org; Sat, 08 May 2021 05:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lfJKw-0008O6-46; Sat, 08 May 2021 05:33:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lfJKt-0006YI-Us; Sat, 08 May 2021 05:33:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3668D4008B;
 Sat,  8 May 2021 12:33:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 8110470;
 Sat,  8 May 2021 12:33:21 +0300 (MSK)
Received: (nullmailer pid 393842 invoked by uid 1000);
 Sat, 08 May 2021 09:33:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial] qapi: spelling fix (addtional)
Date: Sat,  8 May 2021 12:33:15 +0300
Message-Id: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 08 May 2021 09:33:26 -0000

Fixes: 3d0d3c30ae3a259bff176f85a3efa2d0816695af
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..40d70c434a 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -251,8 +251,8 @@
 #
 # @max_queue_size: the maximum number of packets to keep in the queue for
 #                  comparing with incoming packets from @secondary_in.  If the
-#                  queue is full and addtional packets are received, the
-#                  addtional packets are dropped. (default: 1024)
+#                  queue is full and additional packets are received, the
+#                  additional packets are dropped. (default: 1024)
 #
 # @vnet_hdr_support: if true, vnet header support is enabled (default: false)
 #
-- 
2.30.2



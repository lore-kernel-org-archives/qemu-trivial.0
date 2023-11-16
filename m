Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3X5A-0008Tp-TI
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 02:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X4v-0007Ts-Qk; Thu, 16 Nov 2023 02:46:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X4t-0005gH-VR; Thu, 16 Nov 2023 02:46:21 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0F81933BEE;
 Thu, 16 Nov 2023 10:45:04 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 9B9F135854;
 Thu, 16 Nov 2023 10:44:42 +0300 (MSK)
Received: (nullmailer pid 3202550 invoked by uid 1000);
 Thu, 16 Nov 2023 07:44:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PULL 21/27] include/hw/hyperv/dynmem-proto.h: spelling fix: nunber,
 atleast
Date: Thu, 16 Nov 2023 10:44:35 +0300
Message-Id: <20231116074441.3202417-22-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116074441.3202417-1-mjt@tls.msk.ru>
References: <20231116074441.3202417-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Nov 2023 07:46:25 -0000

Fixes: 4f80cd2f033e "Add Hyper-V Dynamic Memory Protocol definitions"
Acked-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/hyperv/dynmem-proto.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/hyperv/dynmem-proto.h b/include/hw/hyperv/dynmem-proto.h
index d0f9090ac4..a657786a94 100644
--- a/include/hw/hyperv/dynmem-proto.h
+++ b/include/hw/hyperv/dynmem-proto.h
@@ -232,7 +232,7 @@ struct dm_capabilities_resp_msg {
  * num_committed: Committed memory in pages.
  * page_file_size: The accumulated size of all page files
  *                 in the system in pages.
- * zero_free: The nunber of zero and free pages.
+ * zero_free: The number of zero and free pages.
  * page_file_writes: The writes to the page file in pages.
  * io_diff: An indicator of file cache efficiency or page file activity,
  *          calculated as File Cache Page Fault Count - Page Read Count.
@@ -275,7 +275,7 @@ struct dm_balloon {
  *
  * reservedz: Reserved; must be set to zero.
  * more_pages: If FALSE, this is the last message of the transaction.
- * if TRUE there will atleast one more message from the guest.
+ * if TRUE there will be at least one more message from the guest.
  *
  * range_count: The number of ranges in the range array.
  *
@@ -296,7 +296,7 @@ struct dm_balloon_response {
  * to the guest to give guest more memory.
  *
  * more_pages: If FALSE, this is the last message of the transaction.
- * if TRUE there will atleast one more message from the guest.
+ * if TRUE there will be at least one more message from the guest.
  *
  * reservedz: Reserved; must be set to zero.
  *
-- 
2.39.2



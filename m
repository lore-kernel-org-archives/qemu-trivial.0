Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2wln-0008ED-KD
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 12:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wlk-000872-0s; Tue, 14 Nov 2023 12:00:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wlU-000556-M3; Tue, 14 Nov 2023 12:00:07 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7678633274;
 Tue, 14 Nov 2023 19:59:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 45290351FB;
 Tue, 14 Nov 2023 19:58:43 +0300 (MSK)
Received: (nullmailer pid 2949114 invoked by uid 1000);
 Tue, 14 Nov 2023 16:58:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Jeuk Kim <jeuk20.kim@samsung.com>
Subject: [PATCH trivial 14/21] include/block/ufs.h: spelling fix: setted
Date: Tue, 14 Nov 2023 19:58:27 +0300
Message-Id: <20231114165834.2949011-15-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114165834.2949011-1-mjt@tls.msk.ru>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Nov 2023 17:00:09 -0000

Fixes: bc4e68d362ec "hw/ufs: Initial commit for emulated Universal-Flash-Storage"
Cc: Jeuk Kim <jeuk20.kim@samsung.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/block/ufs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/ufs.h b/include/block/ufs.h
index 0b6ec0814d..d61598b8f3 100644
--- a/include/block/ufs.h
+++ b/include/block/ufs.h
@@ -657,7 +657,7 @@ typedef struct QEMU_PACKED UtpTaskReqDesc {
 #define UFS_UPIU_MAX_WB_LUN_ID 8
 
 /*
- * WriteBooster buffer lifetime has a limit setted by vendor.
+ * WriteBooster buffer lifetime has a limit set by vendor.
  * If it is over the limit, WriteBooster feature will be disabled.
  */
 #define UFS_WB_EXCEED_LIFETIME 0x0B
-- 
2.39.2



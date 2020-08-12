Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5r01-0003xa-CM
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 09:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5non-0008Eh-Ss; Wed, 12 Aug 2020 06:17:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4232 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5noj-00033b-RF; Wed, 12 Aug 2020 06:17:13 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0C8A410C4F72EE9C2150;
 Wed, 12 Aug 2020 18:17:05 +0800 (CST)
Received: from localhost (10.174.187.253) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 12 Aug 2020
 18:16:56 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
CC: <qemu-devel@nongnu.org>, zhaolichang <zhaolichang@huawei.com>
Subject: [PATCH RFC 09/10] qapi/: fix some comment spelling errors
Date: Wed, 12 Aug 2020 18:14:59 +0800
Message-ID: <20200812101500.2066-10-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200812101500.2066-1-zhaolichang@huawei.com>
References: <20200812101500.2066-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.253]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:17:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Aug 2020 09:41:00 -0400
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
X-List-Received-Date: Wed, 12 Aug 2020 10:17:15 -0000

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the qapi folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
---
 qapi/block-core.json | 4 ++--
 qapi/crypto.json     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 197bdc1..b0ef7c1 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1790,7 +1790,7 @@
 #
 # @block-backend: corresponds to BlockBackend
 #
-# @block-job: corresonds to BlockJob
+# @block-job: corresponds to BlockJob
 #
 # @block-driver: corresponds to BlockDriverState
 #
@@ -2061,7 +2061,7 @@
 # @target: name of the destination dirty bitmap
 #
 # @bitmaps: name(s) of the source dirty bitmap(s) at @node and/or fully
-#           specifed BlockDirtyBitmap elements. The latter are supported
+#           specified BlockDirtyBitmap elements. The latter are supported
 #           since 4.1.
 #
 # Since: 4.0
diff --git a/qapi/crypto.json b/qapi/crypto.json
index bb7930d..2aebe6f 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -336,7 +336,7 @@
 #                 written into added active keyslots
 #
 # @old-secret:    Optional (for deactivation only)
-#                 If given will deactive all keyslots that
+#                 If given will deactivate all keyslots that
 #                 match password located in QCryptoSecret with this ID
 #
 # @iter-time:     Optional (for activation only)
@@ -354,7 +354,7 @@
 #                 keyslot to deactivate
 #
 # @secret:        Optional. The ID of a QCryptoSecret object providing the
-#                 password to use to retrive current master key.
+#                 password to use to retrieve current master key.
 #                 Defaults to the same secret that was used to open the image
 #
 #
-- 
2.26.2.windows.1




Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcOV8-000435-Li
	for mharc-qemu-trivial@gnu.org; Mon, 18 Oct 2021 05:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mcOUz-00041k-Cy; Mon, 18 Oct 2021 05:00:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:31409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mcOUu-0004MU-Ov; Mon, 18 Oct 2021 05:00:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="228084845"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="228084845"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 01:59:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="443325876"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 01:59:49 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Xie Changlong <xiechanglong.d@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>, qemu-trivial@nongnu.org
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH] docs/block-replication.txt: Fix replication top-id command
 demo
Date: Mon, 18 Oct 2021 16:50:44 +0800
Message-Id: <20211018085044.2788276-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 09:00:08 -0000

This demo not correct, the original childs1 can't pass the
the bdrv_is_root_node check in replcation_start().
Keep consistent with docs/COLO-FT.txt

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 docs/block-replication.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 108e9166a8..66ad540676 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -179,7 +179,7 @@ Primary:
 
 Secondary:
   -drive if=none,driver=raw,file.filename=1.raw,id=colo1 \
-  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=childs1
+  -drive if=none,id=childs1,driver=replication,mode=secondary,top-id=top-disk1
          file.file.filename=active_disk.qcow2,\
          file.driver=qcow2,\
          file.backing.file.filename=hidden_disk.qcow2,\
-- 
2.25.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp552-0007Dc-Mp
	for mharc-qemu-trivial@gnu.org; Wed, 19 Apr 2023 06:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp550-0007Bg-MV
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 06:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp54z-0001Ie-BX
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 06:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681900224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kWhWVtgv8hizIGuRbMSJDS/paTccrWWvwt4qHT9zCQU=;
 b=U0mHr+EQ87jPo+rnYyxLr8WEpuAG0ipUM6aJkpr6ormiJxv2srUWQV+xqqz9hH0tahlk4p
 gcAkbySwJzL/W3Rxik2Koroh3Xz/MobAsfYsFhVWFFVCZUcjQFQ3bExUi6Qzm7/RV4k9eY
 +u3U9X9iYS/fLmVat1A6rHVW2iFULrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-gRGtMFFCML2_tf00tCxV2w-1; Wed, 19 Apr 2023 06:30:21 -0400
X-MC-Unique: gRGtMFFCML2_tf00tCxV2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE6E8996E0;
 Wed, 19 Apr 2023 10:30:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 159205AB7A;
 Wed, 19 Apr 2023 10:30:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] hw/rdma: Remove unused macros PG_DIR_SZ and PG_TBL_SZ
Date: Wed, 19 Apr 2023 12:30:18 +0200
Message-Id: <20230419103018.627115-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 19 Apr 2023 10:30:27 -0000

They have apparently never been used.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rdma/rdma_rm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
index cfd85de3e6..038d564433 100644
--- a/hw/rdma/rdma_rm.c
+++ b/hw/rdma/rdma_rm.c
@@ -23,10 +23,6 @@
 #include "rdma_backend.h"
 #include "rdma_rm.h"
 
-/* Page directory and page tables */
-#define PG_DIR_SZ { TARGET_PAGE_SIZE / sizeof(__u64) }
-#define PG_TBL_SZ { TARGET_PAGE_SIZE / sizeof(__u64) }
-
 void rdma_format_device_counters(RdmaDeviceResources *dev_res, GString *buf)
 {
     g_string_append_printf(buf, "\ttx               : %" PRId64 "\n",
-- 
2.31.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp6K6-00051n-Od
	for mharc-qemu-trivial@gnu.org; Wed, 19 Apr 2023 07:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp6Js-00050N-Pr
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 07:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp6Jl-0005cc-GF
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 07:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681904984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VnYUxPYyHyDz6UB7VbhcaGzgjifxGJV8PKgW0i/YCJU=;
 b=ZMMu9o1Xbf+KSAaskUia51MDFpD2tzDzw+BHZzB8wgdG4JhWERjSthzPm02o7lelcqrGpv
 9IQr1z7vrwafZWPsgyAQ4C+b6vlPU43MDbcPYqcuhssgszu/EPcf1kU5KzuADnt1XEM8nx
 AEacZDrMBj70dMMI/rXMvftOnWm/a50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-hT41vD4ZNPagcx7JwejAqg-1; Wed, 19 Apr 2023 07:49:40 -0400
X-MC-Unique: hT41vD4ZNPagcx7JwejAqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DA25884EC3;
 Wed, 19 Apr 2023 11:49:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01941410F1C;
 Wed, 19 Apr 2023 11:49:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] hw/rdma: Compile target-independent parts of the rdma code
 only once
Date: Wed, 19 Apr 2023 13:49:37 +0200
Message-Id: <20230419114937.667221-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 19 Apr 2023 11:50:00 -0000

Some files of the rdma code do not depend on any target specific
macros. Compile these only once to safe some time during the build.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rdma/meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/rdma/meson.build b/hw/rdma/meson.build
index 7325f40c32..fc7917192f 100644
--- a/hw/rdma/meson.build
+++ b/hw/rdma/meson.build
@@ -1,10 +1,12 @@
-specific_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+softmmu_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
   'rdma.c',
   'rdma_backend.c',
-  'rdma_rm.c',
   'rdma_utils.c',
+  'vmw/pvrdma_qp_ops.c',
+))
+specific_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+  'rdma_rm.c',
   'vmw/pvrdma_cmd.c',
   'vmw/pvrdma_dev_ring.c',
   'vmw/pvrdma_main.c',
-  'vmw/pvrdma_qp_ops.c',
 ))
-- 
2.31.1



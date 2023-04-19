Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp5kw-00020b-5E
	for mharc-qemu-trivial@gnu.org; Wed, 19 Apr 2023 07:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp5ku-00020L-Ef
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 07:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp5kt-0000Lx-3h
 for qemu-trivial@nongnu.org; Wed, 19 Apr 2023 07:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681902822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/9d8W2Vu4bzdnGIDdCwY8lJ/ZPFpJHqvhtlttv6W7ao=;
 b=cMKjHwnybATxMQUEhwBU0WG1SCVdj152RnF+sHoU8ftTto0B/p/4YcGkq0j2Mm8EEieUap
 iE3NVkEMlfAuZ1ZDM53Rziy7YunRRTTpkuVbcFiyCDwqAkdhXXna6SKkalv2rXr/4xMw/d
 yZ1LquKbne+WIFRECPp4LId73+x+1cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-bxK1GxaWOSK2rNa3daX8XA-1; Wed, 19 Apr 2023 07:13:40 -0400
X-MC-Unique: bxK1GxaWOSK2rNa3daX8XA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4912E85A5B1;
 Wed, 19 Apr 2023 11:13:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72F791121314;
 Wed, 19 Apr 2023 11:13:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] hw/rdma: VMW_PVRDMA should depend on VMXNET3_PCI
Date: Wed, 19 Apr 2023 13:13:37 +0200
Message-Id: <20230419111337.651673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-List-Received-Date: Wed, 19 Apr 2023 11:13:44 -0000

The "pvrdma" device is only usable in conjunction with the "vmxnet3"
NIC - see the check for TYPE_VMXNET3 in pvrdma_realize().

By adding this dependency, the amount of total files that have to
be compiled for a configuration with all targets decreases by 64
files (!), since the rdma code is marked as target specific and thus
got recompiled for all targets that enable PCI so far.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rdma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/Kconfig b/hw/rdma/Kconfig
index 8e2211288f..840320bdc0 100644
--- a/hw/rdma/Kconfig
+++ b/hw/rdma/Kconfig
@@ -1,3 +1,3 @@
 config VMW_PVRDMA
     default y if PCI_DEVICES
-    depends on PVRDMA && PCI && MSI_NONBROKEN
+    depends on PVRDMA && MSI_NONBROKEN && VMXNET3_PCI
-- 
2.31.1



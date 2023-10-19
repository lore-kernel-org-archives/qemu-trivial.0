Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtVQB-0005Lf-2L
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2023 11:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVQ9-0005K0-JS
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 11:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVQ8-0001yB-09
 for qemu-trivial@nongnu.org; Thu, 19 Oct 2023 11:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZcOP1lA8HWTfx+Eo3ICubUBQXDWQYDG5uQalFHTKJAc=;
 b=XnroE+p8ANOPND5d0PVAH8X+uCmcf/ZpxWkACFCs28WJLTng+REmC88K6xzhbjBALrmdSI
 ATlzMg8V/U0H2JUaHnet4yn1l0focVRDdpTM7R8wYHtV5v9NyJXYMegWp6F60VZLBV+NPc
 nAzwedBHLZNOWKh8mCZev7d/q8A14U0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-wZKDcaIQP_KGZbhCJE8kAg-1; Thu, 19 Oct 2023 11:58:27 -0400
X-MC-Unique: wZKDcaIQP_KGZbhCJE8kAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 747761C29B08;
 Thu, 19 Oct 2023 15:58:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E35C82026D66;
 Thu, 19 Oct 2023 15:58:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH] MAINTAINERS: Fix typo in openpic_kvm.c entry
Date: Thu, 19 Oct 2023 17:58:22 +0200
Message-ID: <20231019155822.499027-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Oct 2023 15:58:49 -0000

It's a .c file, not a header!

Fixes: ff8cdbbd7e ("MAINTAINERS: Add information for OpenPIC")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c12511c73b..a110a0c7a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1418,7 +1418,7 @@ F: hw/pci-host/ppce500.c
 F: include/hw/ppc/ppc_e500.h
 F: include/hw/pci-host/ppce500.h
 F: pc-bios/u-boot.e500
-F: hw/intc/openpic_kvm.h
+F: hw/intc/openpic_kvm.c
 F: include/hw/ppc/openpic_kvm.h
 F: docs/system/ppc/ppce500.rst
 
-- 
2.41.0



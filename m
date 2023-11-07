Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r0JCt-00086l-Ea
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2023 05:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JCr-0007wS-Ox
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JCp-0004vm-4I
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699352469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PZBT1WSvf2Ad2NeWw4psMG6meTAINfdAPmSHjICDBok=;
 b=OKFZRSEuvLZ8gp0WeqCeL0hdrgtnIb6/bpxYqquy4oIwFef3PYDPj28EJOyatta0iPrEGu
 qP0eW5xZmEPSAUrYPrH02K/T6XezBf42tK890zcs1DaZICAslbDaUTTagseZ5a1dUqhvVW
 vpccLl/sRiSabjOHmdSzG0pAMNLfSSQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-xvwOjVu2OhmC7PZQmUzdgw-1; Tue, 07 Nov 2023 05:21:06 -0500
X-MC-Unique: xvwOjVu2OhmC7PZQmUzdgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29606848C08;
 Tue,  7 Nov 2023 10:21:06 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 604541C060AE;
 Tue,  7 Nov 2023 10:21:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add include/hw/xtensa/mx_pic.h to the XTFPAG
 machine section
Date: Tue,  7 Nov 2023 11:21:04 +0100
Message-ID: <20231107102104.14342-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 07 Nov 2023 10:21:14 -0000

These machines are the only user of the mx_pic code, so the
header (which is currently "unmaintained" according to the
MAINTAINERS file) should be added to this section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48a6507759..215d97e58f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1870,6 +1870,7 @@ M: Max Filippov <jcmvbkbc@gmail.com>
 S: Maintained
 F: hw/xtensa/xtfpga.c
 F: hw/net/opencores_eth.c
+F: include/hw/xtensa/mx_pic.h
 
 Devices
 -------
-- 
2.41.0



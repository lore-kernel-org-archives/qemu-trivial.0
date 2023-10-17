Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qsmDb-0002VZ-2m
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2023 11:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qsmDZ-0002Tw-1C
 for qemu-trivial@nongnu.org; Tue, 17 Oct 2023 11:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qsmDX-0001i0-I2
 for qemu-trivial@nongnu.org; Tue, 17 Oct 2023 11:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697557366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PeBNEg8nEJJb5i3FS1x/XYZ2iBeeWgNN3h8iLXdJvbQ=;
 b=BDL5R99P5sBvkHd5TrkwBIfB/wqtMTvK3o3vuJtrSRt2bqIrudZlaHG/J2Am132Dhia3YQ
 FIXy9exh/yiKQuWlAbRfubBerCm6H6+CofqDcLzXyWGnAwyi8WWlKsiE38EeE7QPmfwb5P
 kRmfh7iMLvKq0bPDYyEge0fnhHJtB28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-JJgY6wpsPZ6jmGx0Tdz7dA-1; Tue, 17 Oct 2023 11:42:44 -0400
X-MC-Unique: JJgY6wpsPZ6jmGx0Tdz7dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 746D2805B3E;
 Tue, 17 Oct 2023 15:42:44 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A4212026D6F;
 Tue, 17 Oct 2023 15:42:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stafford Horne <shorne@gmail.com>
Cc: qemu-trivial@nongnu.org,
	Jia Liu <proljc@gmail.com>
Subject: [PATCH] MAINTAINERS: Add include/hw/openrisc/ to the OpenRISC section
Date: Tue, 17 Oct 2023 17:42:42 +0200
Message-ID: <20231017154242.234133-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Oct 2023 15:42:49 -0000

hw/openrisc/ is already listed here, so we should mention
the folder for the headers here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d9767b80f7..60cec3f701 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -309,6 +309,7 @@ S: Odd Fixes
 F: docs/system/openrisc/cpu-features.rst
 F: target/openrisc/
 F: hw/openrisc/
+F: include/hw/openrisc/
 F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
-- 
2.41.0



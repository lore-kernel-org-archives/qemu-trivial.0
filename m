Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqqDu-0005m8-29
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 03:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqqDs-0005lh-KL
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 03:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqqDr-0004wm-0i
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 03:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697096105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I8fBOeR8xrv+qgc0LrhF3Z38u3u6aHlmcVco6jUBuCk=;
 b=fyS3AlAmb4CpI2F3Evtc5SIlHWMwdi4UuD88FmsBZufkizvMU9XvS0LUBq6X6A9rSP2NM6
 VY1KQsXBiIrBm+a37QJCEQ2JNRbRrl8l0+3bCsbcZZqbKyc4ZWr+hWUcvFkfsAWmKu9fk8
 gto48FB5vvi5C3ZoH06tjbXlU6Qwess=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-YSJbBOiWNW6Ak6fYct1DVw-1; Thu, 12 Oct 2023 03:35:00 -0400
X-MC-Unique: YSJbBOiWNW6Ak6fYct1DVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FB01805940;
 Thu, 12 Oct 2023 07:35:00 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A03C1C060AE;
 Thu, 12 Oct 2023 07:34:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the include/hw/arm/
 folder
Date: Thu, 12 Oct 2023 09:34:58 +0200
Message-ID: <20231012073458.860187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-List-Received-Date: Thu, 12 Oct 2023 07:35:08 -0000

The file is obviously related to the raspberrypi machine, so
it should reside in hw/arm/ instead of hw/misc/. And while we're
at it, also adjust the wildcard in MAINTAINERS so that it covers
this file, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                    | 2 +-
 include/hw/{misc => arm}/raspberrypi-fw-defs.h | 0
 hw/misc/bcm2835_property.c                     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename include/hw/{misc => arm}/raspberrypi-fw-defs.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71af9633c6..b55aaa2fe2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -897,7 +897,7 @@ S: Odd Fixes
 F: hw/arm/raspi.c
 F: hw/arm/raspi_platform.h
 F: hw/*/bcm283*
-F: include/hw/arm/raspi*
+F: include/hw/arm/rasp*
 F: include/hw/*/bcm283*
 F: docs/system/arm/raspi.rst
 
diff --git a/include/hw/misc/raspberrypi-fw-defs.h b/include/hw/arm/raspberrypi-fw-defs.h
similarity index 100%
rename from include/hw/misc/raspberrypi-fw-defs.h
rename to include/hw/arm/raspberrypi-fw-defs.h
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 4ed9faa54a..ff55a4e2cd 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -12,7 +12,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
-#include "hw/misc/raspberrypi-fw-defs.h"
+#include "hw/arm/raspberrypi-fw-defs.h"
 #include "sysemu/dma.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-- 
2.41.0



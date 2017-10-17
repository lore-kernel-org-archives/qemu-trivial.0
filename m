Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVm-0006Yg-RR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVj-0006VU-LL
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVi-0004TY-Qd
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:31 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46923)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVh-0004QL-0P; Mon, 16 Oct 2017 20:13:29 -0400
Received: by mail-qk0-x243.google.com with SMTP id k123so29546qke.3;
	Mon, 16 Oct 2017 17:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XNzx5LObWYOMQx0d38am65vxcoQsD71JBoZeNRExPgU=;
	b=GK5x1Lq5YZPvWR93ouG59TmGhi/ISWFBhD1vbGyS04fyC2EJ75TuXrSjf611bQQzOv
	E0C91sPXYljknlBYQSELqY4PA0RLwaeOf3CE4ZNPELMo5RzE8a6pYgIbbBo6YuEE34Pg
	8/tAnEU4Rpc6SUjMdCp4Fp2fGmZ2cu4qzoiLcnLxh4pgAlcwKK6+AuNkvs92NcmwfDLo
	GJ+YlDWXSkXxZTI8pD+sOD1kphHVdkKLv3rvuv80wtQ1hmKhiUwaPAYt4BAn2I6XiTk2
	N0mxXJWoBNaeUX5vQzOPrjybimWQLFQRfiFBWNWEcJowYnx+ulR1xT9CQ/0hvaseTQMj
	slnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XNzx5LObWYOMQx0d38am65vxcoQsD71JBoZeNRExPgU=;
	b=cM6O8w+BKFQ1bygdmlZ630IDYXvP/s76KT8Ks0XWAV4D4M3dbSTUIlwQQnImcBGyql
	99wNTHRh1xeCVIr8FUFc65AIXs63Zi3ApIBQiCYBuuWusPVeIinizf/bYNRa96Z5/x3M
	UrIkLq1X0fgMyGbtungdh9WLsVcdXBMkIkXg8U//gE5AL749hSfb7Bmteur44loHSwt7
	Rj1XBtvjl03nmSJbzAHPICXj3e7UQiYSE4xZoUUaa8hdK/TT5Dw9e+2eZVqQiQtsUWOw
	OyoYSKEyK3i8vupdSnG/zIS4XrQy0WNPAPcCEzH64siG7eo4m2qztUcK//yy1l1s6+3W
	k31w==
X-Gm-Message-State: AMCzsaVpqHIQtx1xO/Ruo5aiIyyVDsQL+sqEWP9DnbZYx/b2ofyhMRtR
	4alIqqEKUlg31AJJPbUYWOg=
X-Google-Smtp-Source: ABhQp+SY9P3VIj3AeaIRGXhuLeu5Gy9ilxx7IadyT1Q9pbJQTbAQRAFOAXTeVcWZ22HhvATqD1ooRA==
X-Received: by 10.55.177.129 with SMTP id a123mr15245548qkf.162.1508199208608; 
	Mon, 16 Oct 2017 17:13:28 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:50 -0300
Message-Id: <20171017001209.32276-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 20/39] amd_iommu: avoid needless includes
 in header file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 00:13:32 -0000

instead move them to the source file

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/amd_iommu.h | 5 -----
 hw/i386/amd_iommu.c | 5 ++++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index d370ae3549..aeef802364 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -23,11 +23,6 @@
 
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/msi.h"
-#include "hw/sysbus.h"
-#include "sysemu/dma.h"
-#include "hw/i386/pc.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/i386/x86-iommu.h"
 
 /* Capability registers */
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ad8155ca4c..eeaf0e0aa8 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -20,7 +20,10 @@
  * Cache implementation inspired by hw/i386/intel_iommu.c
  */
 #include "qemu/osdep.h"
-#include "hw/i386/amd_iommu.h"
+#include "hw/i386/pc.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/pci_bus.h"
+#include "amd_iommu.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "trace.h"
-- 
2.15.0.rc0



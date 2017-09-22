Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4p-0004nb-BC
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4m-0004k9-BY
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4l-0003HO-Ia
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:12 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:32890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4g-0003Di-RD; Fri, 22 Sep 2017 11:41:06 -0400
Received: by mail-qk0-x244.google.com with SMTP id g128so879025qke.0;
	Fri, 22 Sep 2017 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jykksLgZSb+7WhicF+r3LxKm9PwQjlcx2MM1jGOtmYM=;
	b=tka4e0vS8T6WcGS6pQyB0NfbS5IRC9ZkpO0hPgbMtJRddSRCSQXIJ74mIr4IfeI8l8
	yTd+NCxwUnr42mLuc8i8dyh7jRFEERVapDD4orE+IE2sMAjLYrngmcAfTEXu9Vfobjcb
	wTu8mAW1uyAOSF7Z1mOPSC+eG8/KZqyLJ+C7KhB3BOjFU2f5uM7FHbadD6ixC1Y9jpzg
	kroKEziut/sKTP2ByHvUZG3Fa/xGFYpcBTVlann881efFarn8JaRrVBDWhQFWL6caxuf
	Br9YOdtOec2XlBtt71n2bQJhYemn2QcWSZYk4StvVTg+r56YJpN1bbrsyoI6Fl5bXP3W
	Xt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jykksLgZSb+7WhicF+r3LxKm9PwQjlcx2MM1jGOtmYM=;
	b=GmuLs0bYdOrsn19LpWzX+KJm64kmYhfGgLR0RJMJXtNtWXbEvCzajHXB5BRW9LjnG1
	jmyyl4nfslEswgQhuKIKq3bekqQ4RKIQNvmE4eg9oK+FgZk7t9Bni6q7ndyCfLCn9g3N
	EjjfkYgbbxzVCP34MazuFmAUlslz3R0pb83cC7vhIW4s96ZxGC0XMNbkrKJnW/h0LpKk
	1xbikT4ZaDoWumkBtMc75etX2yqv45QKOkxuUja8je0lU9hifgu/cvKhqWDOW6S1MpbF
	9iyrUrLb2qIhs37i4nGJYnnVjsDW2z6Xq4SmFl1McBT4qmou8eswyYhsQ2lU+yAeKoea
	CenQ==
X-Gm-Message-State: AHPjjUgQLae7RM5xxsFjdR/W7Bb6+GDaCK9MgEsox6mNem0qunsL1MKF
	6jXpmLD/yB9ewACXeYFjahM=
X-Google-Smtp-Source: AOwi7QD7meXYBbPCTQUzimS57J9jRbDVFQ9Nvau5UigXGmDJpL/ke9f6RNz9AqQZEbu/mccq6UjCmw==
X-Received: by 10.55.130.197 with SMTP id e188mr7918358qkd.203.1506094866276; 
	Fri, 22 Sep 2017 08:41:06 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:50 -0300
Message-Id: <20170922154014.29350-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 10/34] amd_iommu: avoid needless includes in
 header file
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:13 -0000

instead move them to the source file

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 334938a280..e1bf9c5329 100644
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
2.14.1



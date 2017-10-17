Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0f-0002GR-Fw
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0b-0002CT-A9
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0a-0003WQ-G3
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:25 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:54635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0V-0003U6-3n; Tue, 17 Oct 2017 12:46:19 -0400
Received: by mail-qt0-x242.google.com with SMTP id z19so4894464qtg.11;
	Tue, 17 Oct 2017 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XNzx5LObWYOMQx0d38am65vxcoQsD71JBoZeNRExPgU=;
	b=cp9UXf1hXuezDZy5BZ7fHnn2tkJUmHIABhAyL5M0UAWsQFa+OxX4INHGQqSOEB6HGn
	Ac0NmivDKumRBetJz+/Z7h07B7sPT1F3XPonPKqTLPNnU09I+k40R3tnHiYVu1/XG9fD
	rF0QlKCCJoeAEeD74WaehTJiV6o+eC91r8vzUflguxzn22mse+dyVjZJEACx0PRx9XYj
	hkpQVr7U2UqaAPdFNjJM7+hSj2Oyfftr7AKyeYSkIHx7hOUvkm1kWVfB6QUNcuZ51zm2
	/t1bwx3ttIbJqpGpYeLuRi6FgIQVVf3Z62tf9L/CP/k2OKhfecrSw4jLPoJz4vlFlkRn
	DtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XNzx5LObWYOMQx0d38am65vxcoQsD71JBoZeNRExPgU=;
	b=LaPZfVL26P9nchdJfk7ovorslquathHi9qbTmDSlG6NFy0IAmYGTsslgEMXkFhW9eS
	nZDUeEIjMzwpag/b0c/fgQvPFvAThMBTXmCitTWETkp9GUXkkjFbX89TQvmxmGe4EllD
	qM9d9L7Y6kC00V5GvwPO4JNsNKx3m5ZChKBeDG3FowzG/3VffcP7C7Qhbaf5vz0Wl5sA
	MNN7cctFsgq50zBwUstgPL1pAKUYzG9i44SqBa64cNdiHZ6zGYe01VzWAYEtH0TNllyx
	ehRtWFGktJ36wNN6UJ+XDwxa5KDvotjfHntaZhDdsIGxtH5yn5bgud6RmfPH3MfimINI
	HpaA==
X-Gm-Message-State: AMCzsaVVX9ck4Xopp2dIdwlQmBVeXoNvTrYY79vKWMGDj6BC1qZLnJKL
	LO2QyQSA+SFcyenfEzjz0ps=
X-Google-Smtp-Source: ABhQp+RJ4SDXDixMNsxBue6QTY5rPfCNkKNgYJ8XB1J1PPyWIvTctAMGuC6XDWYXlUBzj8eJHK9eBQ==
X-Received: by 10.200.20.146 with SMTP id l18mr3605624qtj.189.1508258778642;
	Tue, 17 Oct 2017 09:46:18 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:07 -0300
Message-Id: <20171017164426.25277-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 23/42] amd_iommu: avoid needless includes
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:29 -0000

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



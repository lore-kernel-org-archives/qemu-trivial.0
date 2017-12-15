Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgj6-0002kw-P3
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj4-0002iN-4W
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj3-0005Lc-9X
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:54 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:41161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgj1-0005IQ-86; Thu, 14 Dec 2017 22:31:51 -0500
Received: by mail-qk0-x244.google.com with SMTP id r184so1186454qke.8;
	Thu, 14 Dec 2017 19:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SI2LTzR+mEBAMhn6e44ziKrEnaDXOliNM7VafgtW66k=;
	b=o0XhjchbqWGslUqMk1k71r9AvEMAvBAzsAf7Bey+wvh/l1csFbIRn7Ikf1W70zyfU8
	cWvA3ZgcXbtsrvhpLfC/hgjqlAGbHQkMaMyhuxwSkL2pVglwhCjvF5R0BiRc46Yomt2b
	2Fh6kzUXpS0vwWPuMbntHvCET+kDYvRrHx/eo11sRpCeDFeoulPMg4CRzwbzAc6fh3eN
	uWIzp+HQL6f1arny6uBzBt2+/CzhLm33cGCwVyHJK1Un/AfaBViW51cawRw9NP5/TwwN
	JwMMCByNgEx8ImMnj47JHsndLVPamEVQ9ZQQs/Rc1DXwozNq/cuCkmrIBg9BvDB7RG3t
	LzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=SI2LTzR+mEBAMhn6e44ziKrEnaDXOliNM7VafgtW66k=;
	b=GfOyLhlfA78NiBOmJDH26kt4VBfiOWyX1DBb4PZE6NlPtq+xNrEJmM+/iGIzs5qhmW
	/6Wh9QRJ+OI+IPsik/z3YOnWe+xb3n0aek+qbIJp+LdyrEJmQbG2F9dIJjkjs/dg2MA4
	V9xyyfvBvWcNht5+1+k3YRIEEqigcmpFjmbN1kvKvNdzdh+THjfQw2s+d3g1JVUARC1p
	M81t4qYq49ipIu3bvzg7CJLfSwKHyC1sRrrrbkoHWFqyx7eK2IGXODiwzcQizM8fkw8W
	XMDwTC6VwWOhZYAmphCuQ1IXZMclNRMWxpcxPwIR3UhJW//oyt3f5qtzow+ehW/19xje
	OJHQ==
X-Gm-Message-State: AKGB3mKjOcNRla0fpUZuQedFbZ8IhifQK9Os+fA4ZEcLlj2U/+6ArD+G
	jKzwYFCFqqXnmR4UMVRDtzE=
X-Google-Smtp-Source: ACJfBovngjAHorWLagvhq/wQXLH8+mpwEJ7iVrPSocdFukWlxdh4gewUaLXl4twBNJZ+O/RwmvkWNA==
X-Received: by 10.55.18.230 with SMTP id 99mr1017366qks.115.1513308710777;
	Thu, 14 Dec 2017 19:31:50 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:50 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:29:55 -0300
Message-Id: <20171215033015.738-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 23/43] amd_iommu: avoid needless includes
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:55 -0000

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
2.15.1



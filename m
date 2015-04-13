Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YhgI2-0003xR-Ku
	for mharc-qemu-trivial@gnu.org; Mon, 13 Apr 2015 11:28:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YhgHx-0003qn-Ia
	for qemu-trivial@nongnu.org; Mon, 13 Apr 2015 11:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YhgHw-00041d-Ku
	for qemu-trivial@nongnu.org; Mon, 13 Apr 2015 11:28:41 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:34285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YhgHr-00040Z-UR; Mon, 13 Apr 2015 11:28:36 -0400
Received: by widjs5 with SMTP id js5so67409206wid.1;
	Mon, 13 Apr 2015 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=iuStJDbmp0Ad4b7bkByJfAll2SdjlpUagOFS/8q8HXY=;
	b=ozVZxePFBU0Is3N88Lb1rxgpRqquveqLfdvZey5kY6zIqfO5GA+LjUVscsVY+fWEw8
	2VXRGYjQLDQW/TCfac1CJd4n5JoQuR6kaSgX4mMbV3IEbgnpKQmI09kfBbOdtsjEDcdO
	7qDyRa95xBUrr4meOzyR3N0FHCWxVVnCZqnS0VLp5fy8hEo7nkZfjFZ6YflkhJ4Ccu63
	xlLUg38OkWEc98XLmFf8wT8IMJ7E9o7uzz4gnvudbN5xioaocM02Gpy5wOjADoIESNYd
	imdFzhLYcO8vY8Emwr29mm6BkjzAFXrmuNayPWjBGCbLGCU2gBlR4YcJRHwphcjzfJY+
	d8rg==
X-Received: by 10.194.177.167 with SMTP id cr7mr27650038wjc.19.1428938915235; 
	Mon, 13 Apr 2015 08:28:35 -0700 (PDT)
Received: from localhost.localdomain (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41]) by mx.google.com with ESMTPSA id
	es5sm11962299wjc.30.2015.04.13.08.28.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 08:28:33 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Apr 2015 17:28:26 +0200
Message-Id: <1428938907-93135-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.3.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] range: remove useless inclusions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2015 15:28:45 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 dma-helpers.c             | 1 -
 hw/acpi/pcihp.c           | 1 -
 hw/i386/acpi-build.c      | 1 -
 include/hw/i386/ich9.h    | 1 -
 include/hw/pci-host/q35.h | 1 -
 5 files changed, 5 deletions(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index 6918572..f43a5a7 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -10,7 +10,6 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/dma.h"
 #include "trace.h"
-#include "qemu/range.h"
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 612fec0..422603d 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -31,7 +31,6 @@
 #include "hw/pci/pci.h"
 #include "hw/acpi/acpi.h"
 #include "sysemu/sysemu.h"
-#include "qemu/range.h"
 #include "exec/ioport.h"
 #include "exec/address-spaces.h"
 #include "hw/pci/pci_bus.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e761005..420e30a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -26,7 +26,6 @@
 #include "qemu-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/osdep.h"
-#include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
 #include "qom/cpu.h"
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 59ea25b..c171578 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -2,7 +2,6 @@
 #define HW_ICH9_H
 
 #include "hw/hw.h"
-#include "qemu/range.h"
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 025d6e6..96d4cdc 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -23,7 +23,6 @@
 #define HW_Q35_H
 
 #include "hw/hw.h"
-#include "qemu/range.h"
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
-- 
2.3.0



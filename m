Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0C-0000sy-VT
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh06-0000eW-6Z
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000dl-V8
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzx-0000bI-B3; Thu, 30 Apr 2015 01:26:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7840F42B84;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F142494D;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4310 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:22 +0300
Message-Id: <2332c85765cf90c958df0fb54d6cf12d6ad9f483.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/42] range: remove useless inclusions
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:07 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 dma-helpers.c             | 1 -
 hw/acpi/pcihp.c           | 1 -
 hw/i386/acpi-build.c      | 1 -
 include/hw/i386/ich9.h    | 1 -
 include/hw/pci-host/q35.h | 1 -
 5 files changed, 5 deletions(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index 33b1983..4b51425 100644
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
index 77e1126..1e11af9 100644
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
2.1.4



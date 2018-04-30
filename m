Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fD3Ii-0002xj-CD
	for mharc-qemu-trivial@gnu.org; Mon, 30 Apr 2018 03:32:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fD3Id-0002wX-Sc
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 03:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fD3Id-0005W3-1k
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 03:32:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51846 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fD3IY-0005Tl-QE; Mon, 30 Apr 2018 03:32:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A54F8FF3;
	Mon, 30 Apr 2018 07:32:30 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-117-41.ams2.redhat.com [10.36.117.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C602F7C4C;
	Mon, 30 Apr 2018 07:32:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Date: Mon, 30 Apr 2018 09:32:19 +0200
Message-Id: <1525073539-27991-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 30 Apr 2018 07:32:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 30 Apr 2018 07:32:30 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] trivial: Do not include pci.h if it is not
 necessary
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
X-List-Received-Date: Mon, 30 Apr 2018 07:32:40 -0000

There is no need to include pci.h in these files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/ppc/ppc4xx.h            | 2 --
 include/hw/virtio/virtio-balloon.h | 1 -
 include/hw/virtio/virtio-gpu.h     | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index cb0bb55..3a2a04c 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -25,8 +25,6 @@
 #ifndef PPC4XX_H
 #define PPC4XX_H
 
-#include "hw/pci/pci.h"
-
 /* PowerPC 4xx core initialization */
 PowerPCCPU *ppc4xx_init(const char *cpu_model,
                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 1ea13bd..e0df352 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -17,7 +17,6 @@
 
 #include "standard-headers/linux/virtio_balloon.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
 
 #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
 #define VIRTIO_BALLOON(obj) \
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 22ac3c2..79bb3fb 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -18,7 +18,6 @@
 #include "ui/qemu-pixman.h"
 #include "ui/console.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
 #include "qemu/log.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
-- 
1.8.3.1



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YD3Hc-00035y-62
	for mharc-qemu-trivial@gnu.org; Sun, 18 Jan 2015 22:45:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YD3HZ-000349-6W
	for qemu-trivial@nongnu.org; Sun, 18 Jan 2015 22:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YD3HT-0000WY-Bk
	for qemu-trivial@nongnu.org; Sun, 18 Jan 2015 22:45:41 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:45722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YD3HS-0000Vn-Q5; Sun, 18 Jan 2015 22:45:35 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CID26600; Mon, 19 Jan 2015 11:45:32 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 19 Jan 2015 11:45:21 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 19 Jan 2015 11:45:12 +0800
Message-ID: <1421639112-12788-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] fw_cfg: fix typos in comments: patch -> path
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
X-List-Received-Date: Mon, 19 Jan 2015 03:45:42 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/core/fw-path-provider.c | 2 +-
 hw/ppc/spapr.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/fw-path-provider.c b/hw/core/fw-path-provider.c
index 1290c3e..7442d32 100644
--- a/hw/core/fw-path-provider.c
+++ b/hw/core/fw-path-provider.c
@@ -1,5 +1,5 @@
 /*
- *  Firmware patch provider class and helpers.
+ *  Firmware path provider class and helpers.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b560459..812d030 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1625,7 +1625,7 @@ static int spapr_kvm_type(const char *vm_type)
 }
 
 /*
- * Implementation of an interface to adjust firmware patch
+ * Implementation of an interface to adjust firmware path
  * for the bootindex property handling.
  */
 static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
-- 
1.7.12.4




Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Vb-0006wb-4T
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VY-0006sQ-Gx
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VV-0003rk-BT
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4VL-0003ll-Rd; Tue, 10 Feb 2015 01:41:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3112D41829;
	Tue, 10 Feb 2015 09:41:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A6E028C4;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9336 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:51 +0300
Message-Id: <627b84f4060c6d39f347dd3d4f9d60612615091c.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/46] fw_cfg: fix typos in comments: patch ->
	path
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:17 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4



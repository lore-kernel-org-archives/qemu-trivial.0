Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yb7NW-0004tE-Cu
	for mharc-qemu-trivial@gnu.org; Thu, 26 Mar 2015 08:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yb7NT-0004t6-NF
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 08:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yb7NO-0006LY-RW
	for qemu-trivial@nongnu.org; Thu, 26 Mar 2015 08:59:15 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:13435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yb7NO-0006LC-2c; Thu, 26 Mar 2015 08:59:10 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIZ77994; Thu, 26 Mar 2015 20:59:06 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 26 Mar 2015 20:57:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 26 Mar 2015 20:57:43 +0800
Message-ID: <1427374663-10168-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] misc: fix typos in copyright declaration
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
X-List-Received-Date: Thu, 26 Mar 2015 12:59:17 -0000

From: Gonglei <arei.gonglei@huawei.com>

Add a space after comma.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 bootdevice.c              | 2 +-
 tests/usb-hcd-ohci-test.c | 2 +-
 tests/usb-hcd-uhci-test.c | 2 +-
 tests/usb-hcd-xhci-test.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bootdevice.c b/bootdevice.c
index 673bfef..3cdc0d7 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -1,7 +1,7 @@
 /*
  * QEMU Boot Device Implement
  *
- * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO.,LTD.
+ * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO., LTD.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
diff --git a/tests/usb-hcd-ohci-test.c b/tests/usb-hcd-ohci-test.c
index 1160bde..fa592d4 100644
--- a/tests/usb-hcd-ohci-test.c
+++ b/tests/usb-hcd-ohci-test.c
@@ -1,7 +1,7 @@
 /*
  * QTest testcase for USB OHCI controller
  *
- * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO.,LTD.
+ * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO., LTD.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/tests/usb-hcd-uhci-test.c b/tests/usb-hcd-uhci-test.c
index 6d631cf..a96b716 100644
--- a/tests/usb-hcd-uhci-test.c
+++ b/tests/usb-hcd-uhci-test.c
@@ -1,7 +1,7 @@
 /*
  * QTest testcase for USB UHCI controller
  *
- * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO.,LTD.
+ * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO., LTD.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/tests/usb-hcd-xhci-test.c b/tests/usb-hcd-xhci-test.c
index adf261e..56ab367 100644
--- a/tests/usb-hcd-xhci-test.c
+++ b/tests/usb-hcd-xhci-test.c
@@ -1,7 +1,7 @@
 /*
  * QTest testcase for USB xHCI controller
  *
- * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO.,LTD.
+ * Copyright (c) 2014 HUAWEI TECHNOLOGIES CO., LTD.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
-- 
1.7.12.4




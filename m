Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XihQG-0003xA-PL
	for mharc-qemu-trivial@gnu.org; Mon, 27 Oct 2014 06:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XihQA-0003pJ-IR
	for qemu-trivial@nongnu.org; Mon, 27 Oct 2014 06:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XihQ5-0008LP-OC
	for qemu-trivial@nongnu.org; Mon, 27 Oct 2014 06:21:06 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:41825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XihPv-0008IJ-Dr; Mon, 27 Oct 2014 06:20:51 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDM45239; Mon, 27 Oct 2014 18:20:31 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 27 Oct 2014 18:20:24 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 27 Oct 2014 18:20:17 +0800
Message-ID: <1414405218-468-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	weidong.huang@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] uhci: remove useless DEBUG
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
X-List-Received-Date: Mon, 27 Oct 2014 10:21:11 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 50dcc0f8 (uhci: tracing support) had removed
DPRINTF, the DEBUG marco is useless now, remove it.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/usb/hcd-uhci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 5b88f30..4a4215d 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -35,9 +35,6 @@
 #include "trace.h"
 #include "qemu/main-loop.h"
 
-//#define DEBUG
-//#define DEBUG_DUMP_DATA
-
 #define FRAME_TIMER_FREQ 1000
 
 #define FRAME_MAX_LOOPS  256
-- 
1.7.12.4




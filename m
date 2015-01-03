Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y7OyD-0004Rr-Sj
	for mharc-qemu-trivial@gnu.org; Sat, 03 Jan 2015 08:42:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7OyB-0004Nc-Pa
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7OyA-0000ig-UX
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:19 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:42702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Y7Oy5-0000hv-0M; Sat, 03 Jan 2015 08:42:13 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id DB51A17FCC2; Sat,  3 Jan 2015 14:42:10 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  3 Jan 2015 14:41:39 +0100
Message-Id: <1420292499-8596-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
References: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/3] misc: Fix new typos in comments
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
X-List-Received-Date: Sat, 03 Jan 2015 13:42:21 -0000

recieve -> receive
suprise -> surprise

Cc: Igor Mammedov <imammedo@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/hw/hotplug.h |    2 +-
 tests/ahci-test.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index 050d2f0..2db025d 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -52,7 +52,7 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
  *                  require asynchronous unplug handling.
  * @unplug: unplug callback.
  *          Used for device removal with devices that implement
- *          asynchronous and synchronous (suprise) removal.
+ *          asynchronous and synchronous (surprise) removal.
  */
 typedef struct HotplugHandlerClass {
     /* <private> */
diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index e77fa3a..b1a59f2 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -1289,7 +1289,7 @@ static void ahci_test_identify(QPCIDevice *ahci, void *hba_base)
     PX_WREG(i, AHCI_PX_IS, reg);
     g_assert_cmphex(PX_RREG(i, AHCI_PX_IS), ==, 0);
 
-    /* Wipe the FIS-Recieve Buffer */
+    /* Wipe the FIS-Receive Buffer */
     fb = PX_RREG(i, AHCI_PX_FB);
     g_assert_cmphex(fb, !=, 0);
     qmemset(fb, 0x00, 0x100);
-- 
1.7.10.4



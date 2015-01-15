Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfpj-0002Kv-LF
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:31:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfpf-0002Cg-M4
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:31:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfpe-0008LG-Oz
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:31:11 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfpW-0008IF-Eo; Thu, 15 Jan 2015 03:31:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D18B40D9D;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 01E3E8C8;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: (nullmailer pid 31353 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:45 +0300
Message-Id: <b4952c3677170139541bc6bc14e9c2cfdc056181.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, John Snow <jsnow@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-trivial] [PULL 07/12] misc: Fix new typos in comments
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
X-List-Received-Date: Thu, 15 Jan 2015 08:31:15 -0000

From: Stefan Weil <sw@weilnetz.de>

recieve -> receive
suprise -> surprise

Cc: Igor Mammedov <imammedo@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/hotplug.h | 2 +-
 tests/ahci-test.c    | 2 +-
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
2.1.4



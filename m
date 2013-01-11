Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtniO-00073f-5x
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 18:08:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>) id 1TtniH-00070k-Rs
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 18:08:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>) id 1TtniC-0004NA-PZ
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 18:08:37 -0500
Received: from smtp.citrix.com ([66.165.176.89]:51030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julien.grall@citrix.com>)
	id 1TtniC-0004N6-Kg; Fri, 11 Jan 2013 18:08:32 -0500
X-IronPort-AV: E=Sophos;i="4.84,455,1355097600"; 
   d="scan'208";a="3528761"
Received: from ftlpex01cl01.citrite.net ([10.13.107.78])
	by FTLPIPO01.CITRIX.COM with ESMTP/TLS/AES128-SHA;
	11 Jan 2013 23:08:27 +0000
Received: from meteora.cam.xci-test.com (10.80.248.22) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.2.318.1;
	Fri, 11 Jan 2013 18:08:26 -0500
From: Julien Grall <julien.grall@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 11 Jan 2013 16:41:43 +0000
Message-ID: <1357922503-20202-1-git-send-email-julien.grall@citrix.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, Julien Grall <julien.grall@citrix.com>,
	aliguori@us.ibm.com
Subject: [Qemu-trivial] [PATCH] hw/pc.c: add ULL suffix in ioport80_read and
	ioportF0_read return value
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
X-List-Received-Date: Fri, 11 Jan 2013 23:08:42 -0000

The commit c02e1eac887b1b0aee7361b1fcf889e7d47fed9d broke the compilation
for i386. ULL need to be specify for uint64_t value.

Signed-off-by: Julien Grall <julien.grall@citrix.com>
---
 hw/pc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pc.c b/hw/pc.c
index dfa3144..ba1f19d 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -105,7 +105,7 @@ static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
 
 static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
 {
-    return 0xffffffffffffffff;
+    return 0xffffffffffffffffULL;
 }
 
 /* MSDOS compatibility mode FPU exception support */
@@ -130,7 +130,7 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
 
 static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
 {
-    return 0xffffffffffffffff;
+    return 0xffffffffffffffffULL;
 }
 
 /* TSC handling */
-- 
Julien Grall



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I7-0007nx-Nn
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hz-0007Zp-Ee
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Ht-0002uO-VW
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hi-0002j7-8f; Thu, 11 Dec 2014 13:16:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 069E941D40;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C9D378C2;
	Thu, 11 Dec 2014 21:16:15 +0300 (MSK)
Received: (nullmailer pid 22960 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:51 +0300
Message-Id: <fcf55f580d4c4755dfacabd7ac86501ebbb4167e.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/20] acpi-build: adjust indention 8 -> 4
	spaces
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b37a397..76dfaea 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -273,12 +273,12 @@ build_header(GArray *linker, GArray *table_data,
 
 static inline GArray *build_alloc_array(void)
 {
-        return g_array_new(false, true /* clear */, 1);
+    return g_array_new(false, true /* clear */, 1);
 }
 
 static inline void build_free_array(GArray *array)
 {
-        g_array_free(array, true);
+    g_array_free(array, true);
 }
 
 static inline void build_prepend_byte(GArray *array, uint8_t val)
-- 
2.1.3



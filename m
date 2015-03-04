Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHl-0002J9-AO
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHi-0002DC-Lv
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHe-0008RP-AN
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHM-0008LF-Nk; Wed, 04 Mar 2015 16:56:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5B3C340960;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E4594964;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17552 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:51 +0300
Message-Id: <5e8040e92d13f0463517616a00ad42af48438450.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 34/47] microblaze: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 21:56:55 -0000

From: Gonglei <arei.gonglei@huawei.com>

When not assign a -dtb argument, the variable dtb_filename
storage returned from qemu_find_file(), which should be freed
after using.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/microblaze/boot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 38c59db..e3c1c51 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -205,5 +205,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                             kernel_cmdline,
                             dtb_filename);
     }
-
+    if (!dtb_arg) {
+        g_free(dtb_filename);
+    }
 }
-- 
2.1.4



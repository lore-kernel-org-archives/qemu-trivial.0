Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30N1-0000LD-2h
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:14:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30My-0000HX-QP
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30Mt-00032d-Gt
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:14:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30Mk-00030U-In; Wed, 18 May 2016 08:14:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 64078417A5;
	Wed, 18 May 2016 15:14:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7FFF4AE0;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: (nullmailer pid 12386 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:05:58 +0300
Message-Id: <ed2f3bc1fad37297468234add82f464b59b16830.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/13] loader: fix potential memory leak
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
X-List-Received-Date: Wed, 18 May 2016 12:14:33 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/loader.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index c049957..53e0e41 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -914,10 +914,16 @@ int rom_add_file(const char *file, const char *fw_dir,
 err:
     if (fd != -1)
         close(fd);
+
     g_free(rom->data);
     g_free(rom->path);
     g_free(rom->name);
+    if (fw_dir) {
+        g_free(rom->fw_dir);
+        g_free(rom->fw_file);
+    }
     g_free(rom);
+
     return -1;
 }
 
-- 
2.1.4



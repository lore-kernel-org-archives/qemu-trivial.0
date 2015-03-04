Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTD4M-0002OF-57
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:26:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4G-0002Cx-8t
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTD4D-00053L-2f
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:26:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTD44-0004xz-Al; Wed, 04 Mar 2015 12:26:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 56206408A7;
	Wed,  4 Mar 2015 20:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8100960;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17559 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:54 +0300
Message-Id: <35564aeb5e6ad07d8caa1aaa0b4c4adb7238543b.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 37/47] e500: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 17:26:48 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ppc/e500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7e17d18..a8237a3 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *machine,
         }
 
         fdt = load_device_tree(filename, &fdt_size);
+        g_free(filename);
         if (!fdt) {
             goto out;
         }
-- 
2.1.4



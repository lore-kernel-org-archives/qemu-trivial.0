Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bP-0005mh-PN
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bJ-0005bT-HA
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bE-00045B-9e
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b6-00041Q-VN; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9AB204182F;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6B1CF942;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9381 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:13 +0300
Message-Id: <5f1d1fc5928a6f8f63089b3d0768e0dc42c05fbb.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 24/46] spapr_vio: Pair g_malloc() with
	g_free(), not free()
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:22 -0000

From: Markus Armbruster <armbru@redhat.com>

Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
and my "coverity: Model g_free() isn't necessarily free()" model patch
applied.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/spapr_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index dc9e46a..032ee1a 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -648,7 +648,7 @@ int spapr_populate_vdevice(VIOsPAPRBus *bus, void *fdt)
 
     ret = 0;
 out:
-    free(qdevs);
+    g_free(qdevs);
 
     return ret;
 }
-- 
2.1.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoZy-0001KY-I8
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZq-00018n-I9
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZp-0005bX-Qa
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZj-0005VG-8K; Mon, 27 Jul 2015 16:00:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DF401425B4;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 47554A68;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9521 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:06 +0300
Message-Id: <cc47a16bcbbc2d1f79511799ca3625c6522f5838.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 03/10] device_tree: Fix a typo
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:52 -0000

From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>

Fix spelling of 'allocting' -> 'allocating'.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 device_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index d2de580..a9f5f8e 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -241,7 +241,7 @@ uint32_t qemu_fdt_alloc_phandle(void *fdt)
 
     /*
      * We need to find out if the user gave us special instruction at
-     * which phandle id to start allocting phandles.
+     * which phandle id to start allocating phandles.
      */
     if (!phandle) {
         phandle = machine_phandle_start(current_machine);
-- 
2.1.4



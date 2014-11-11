Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCpP-0000rg-4W
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:53:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpI-0000f2-Oh
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCpE-00029v-DH
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:53:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCp0-00026k-Ew; Tue, 11 Nov 2014 09:53:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C85941DF8;
	Tue, 11 Nov 2014 17:53:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B681A712;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14575 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:30 +0300
Message-Id: <d208a85f1568ab8aec238cb91367581c61350008.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 08/11] xen-hvm: Remove redundant variable
	'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:53:53 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

In xen_hvm_change_state_handler(), we can pass 'opaque' with type cast
to xen_main_loop_prepare() directly, there's no need to use additional
variable for it.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 xen-hvm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen-hvm.c b/xen-hvm.c
index 21f1cbb..7548794 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -993,9 +993,8 @@ static void xen_main_loop_prepare(XenIOState *state)
 static void xen_hvm_change_state_handler(void *opaque, int running,
                                          RunState rstate)
 {
-    XenIOState *xstate = opaque;
     if (running) {
-        xen_main_loop_prepare(xstate);
+        xen_main_loop_prepare((XenIOState *)opaque);
     }
 }
 
-- 
1.7.10.4



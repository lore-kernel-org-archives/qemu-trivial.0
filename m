Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNoi-00032p-FG
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:40:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNob-0002xY-2q
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNoW-0005SX-NP
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNoN-0005QR-4k; Mon, 05 May 2014 14:40:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0894B40756;
	Mon,  5 May 2014 22:40:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E4F53671;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24242 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:54 +0400
Message-Id: <1399312923-24129-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Jim Meyering <meyering@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/22] xen: remove unused global, xen_xcg
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
X-List-Received-Date: Mon, 05 May 2014 18:40:41 -0000

From: Jim Meyering <meyering@redhat.com>

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Jim Meyering <meyering@redhat.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/xen_backend.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
index 197795f..3cd45b4 100644
--- a/hw/xen/xen_backend.c
+++ b/hw/xen/xen_backend.c
@@ -45,7 +45,6 @@
 
 /* public */
 XenXC xen_xc = XC_HANDLER_INITIAL_VALUE;
-XenGnttab xen_xcg = XC_HANDLER_INITIAL_VALUE;
 struct xs_handle *xenstore = NULL;
 const char *xen_protocol;
 
-- 
1.7.10.4



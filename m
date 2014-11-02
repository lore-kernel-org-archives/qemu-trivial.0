Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6M-0005Gr-OY
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6F-00051y-Bf
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6B-0007LI-0P
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50929)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku60-0007E3-JR; Sun, 02 Nov 2014 07:17:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3751B402C2;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9C62571B;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14993 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:33 +0300
Message-Id: <d0caa3eb539de01043354440ce0a10b1f546cf06.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 21/23] tap: do not close(fd) in
	net_init_tap_one
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:44 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 5193e5fb (tap: factor out common tap initialization)
introduce net_init_tap_one(). But it's inappropriate that
we close fd in net_init_tap_one(), we should lay it in the
caller, becuase some callers needn't to close it if we get
the fd by monitor_handle_fd_param().

On the other hand, in other exceptional branches fd isn't
closed, so that's incomplete anyway.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/tap.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index a40f7f0..7bcd4c7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -598,7 +598,6 @@ static int net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
 
     s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
     if (!s) {
-        close(fd);
         return -1;
     }
 
-- 
1.7.10.4



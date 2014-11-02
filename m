Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkuPi-00065R-5Y
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:37:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPb-0005ws-O0
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkuPX-0005OH-Bw
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:37:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkuPO-0005Mg-5L; Sun, 02 Nov 2014 07:37:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 618D3402CE;
	Sun,  2 Nov 2014 15:37:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 89E4C71A;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14988 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:31 +0300
Message-Id: <b391567b64c86d3c032b500eebb7c53d332fc5f2.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/23] tap_int.h: remove repeating
	NETWORK_SCRIPT defines
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
X-List-Received-Date: Sun, 02 Nov 2014 12:37:44 -0000

From: Gonglei <arei.gonglei@huawei.com>

DEFAULT_NETWORK_SCRIPT and DEFAULT_NETWORK_DOWN_SCRIPT
have been defined in net/net.h included in
tap.c, which is the only C file that using those two macro.
Let's remove the repeating macroinstruction.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/tap_int.h |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/tap_int.h b/net/tap_int.h
index 86bb224..79afdf2 100644
--- a/net/tap_int.h
+++ b/net/tap_int.h
@@ -29,9 +29,6 @@
 #include "qemu-common.h"
 #include "qapi-types.h"
 
-#define DEFAULT_NETWORK_SCRIPT "/etc/qemu-ifup"
-#define DEFAULT_NETWORK_DOWN_SCRIPT "/etc/qemu-ifdown"
-
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
              int vnet_hdr_required, int mq_required);
 
-- 
1.7.10.4



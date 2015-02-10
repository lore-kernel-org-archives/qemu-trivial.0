Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bQ-0005nk-5o
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bN-0005jb-Rb
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bM-00047m-PA
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b6-00041O-VJ; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 878EC4182D;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 69B21959;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9398 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:21 +0300
Message-Id: <66c5f3e596398a84949fb39e3d7b5f2c0ce3ea0f.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 32/46] rtl8139: g_malloc() can't fail,
	bury dead error handling
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/rtl8139.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index b7b87a6..2d1be06 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2075,20 +2075,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                 "length to %d\n", txsize);
     }
 
-    if (!s->cplus_txbuffer)
-    {
-        /* out of memory */
-
-        DPRINTF("+++ C+ mode transmiter failed to reallocate %d bytes\n",
-            s->cplus_txbuffer_len);
-
-        /* update tally counter */
-        ++s->tally_counters.TxERR;
-        ++s->tally_counters.TxAbt;
-
-        return 0;
-    }
-
     /* append more data to the packet */
 
     DPRINTF("+++ C+ mode transmit reading %d bytes from host memory at "
-- 
2.1.4



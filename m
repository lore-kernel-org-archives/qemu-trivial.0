Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp19E-0003ZR-OE
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:33:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp197-0002zC-7l
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp192-0002tW-CN
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp18q-0002qS-ED; Fri, 06 Dec 2013 14:32:48 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 407FE40D77;
	Fri,  6 Dec 2013 23:32:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66B35604;
	Fri,  6 Dec 2013 23:15:45 +0400 (MSK)
Received: (nullmailer pid 19227 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:36 +0400
Message-Id: <1386357341-19147-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/14] virtio-net: fix the indent
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
X-List-Received-Date: Fri, 06 Dec 2013 19:33:10 -0000

From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>

Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/virtio-net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b75c753..90eca9a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1428,7 +1428,7 @@ static NetClientInfo net_virtio_info = {
     .size = sizeof(NICState),
     .can_receive = virtio_net_can_receive,
     .receive = virtio_net_receive,
-        .cleanup = virtio_net_cleanup,
+    .cleanup = virtio_net_cleanup,
     .link_status_changed = virtio_net_set_link_status,
     .query_rx_filter = virtio_net_query_rxfilter,
 };
-- 
1.7.10.4



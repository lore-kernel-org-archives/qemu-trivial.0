Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VlgDk-0007Vw-SM
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2013 09:36:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1VlZf7-0007VU-8Q
	for qemu-trivial@nongnu.org; Wed, 27 Nov 2013 02:36:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1VlZer-0001ii-Vn
	for qemu-trivial@nongnu.org; Wed, 27 Nov 2013 02:35:53 -0500
Received: from e32.co.us.ibm.com ([32.97.110.150]:50541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1VlZer-0001iU-P1
	for qemu-trivial@nongnu.org; Wed, 27 Nov 2013 02:35:37 -0500
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <zwu.kernel@gmail.com>;
	Wed, 27 Nov 2013 00:35:36 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 27 Nov 2013 00:35:34 -0700
Received: from b03cxnp07027.gho.boulder.ibm.com
	(b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 063E319D8041;
	Wed, 27 Nov 2013 00:35:28 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by b03cxnp07027.gho.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id rAR5XV4d4784598; Wed, 27 Nov 2013 06:33:31 +0100
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id rAR7ZXYh030456; Wed, 27 Nov 2013 00:35:33 -0700
Received: from us.ibm.com ([9.115.122.226])
	by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
	rAR7ZTqg030267; Wed, 27 Nov 2013 00:35:30 -0700
Received: by us.ibm.com (sSMTP sendmail emulation);
	Wed, 27 Nov 2013 15:35:27 +0800
From: Zhi Yong Wu <zwu.kernel@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 27 Nov 2013 15:35:26 +0800
Message-Id: <1385537726-27219-1-git-send-email-zwu.kernel@gmail.com>
X-Mailer: git-send-email 1.7.6.5
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13112707-0928-0000-0000-00000413E538
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.150
X-Mailman-Approved-At: Wed, 27 Nov 2013 09:36:03 -0500
Cc: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>, mjt@tls.msk.ru,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] virtio-net: fix the indent
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
X-List-Received-Date: Wed, 27 Nov 2013 07:36:02 -0000

From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>

Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
---
 hw/net/virtio-net.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
1.7.6.5



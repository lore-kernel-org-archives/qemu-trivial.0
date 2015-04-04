Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIMt-0002pg-0G
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIMq-0002jz-Ic
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:19:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIMp-0002JZ-Rp
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:19:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIMj-0002GS-0b; Sat, 04 Apr 2015 03:19:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 277B5405F6;
	Sat,  4 Apr 2015 10:19:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B53EE722;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20950 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:26 +0300
Message-Id: <9be6e69f12bc65e9c43ee5b8eb026412f11b8b71.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
References: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 5/5] vhost: fix typo in vq_index description
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
X-List-Received-Date: Sat, 04 Apr 2015 07:19:45 -0000

From: Greg Kurz <gkurz@linux.vnet.ibm.com>

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/virtio/vhost.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index d5593d1..8f04888 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -36,7 +36,7 @@ struct vhost_dev {
     MemoryRegionSection *mem_sections;
     struct vhost_virtqueue *vqs;
     int nvqs;
-    /* the first virtuque which would be used by this vhost dev */
+    /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
     unsigned long long features;
     unsigned long long acked_features;
-- 
2.1.4



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnhHT-0001Ct-53
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 03:54:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cnhHQ-0001BE-Az
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 03:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cnhHP-0008Rk-6u
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 03:54:04 -0400
Received: from [59.151.112.132] (port=64338 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1cnhHJ-0008KV-Lz; Tue, 14 Mar 2017 03:53:58 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="16545623"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Mar 2017 15:53:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0DF1147D8B96;
	Tue, 14 Mar 2017 15:53:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.56) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 14 Mar 2017 15:53:46 +0800
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
CC: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, QEMU Trivial
	<qemu-trivial@nongnu.org>
Date: Tue, 14 Mar 2017 15:52:32 +0800
Message-ID: <1489477952-6901-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 0DF1147D8B96.AEBE2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH] hw/net/virtio-net.c: Follow CODING_STYLE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Mar 2017 07:54:05 -0000

Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
---
 hw/net/virtio-net.c | 53 +++++++++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c321680..ede618e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -273,7 +273,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
         if (queue_started) {
             if (q->tx_timer) {
                 timer_mod(q->tx_timer,
-                               qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
             } else {
                 qemu_bh_schedule(q->tx_bh);
             }
@@ -301,13 +301,15 @@ static void virtio_net_set_link_status(NetClientState *nc)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     uint16_t old_status = n->status;
 
-    if (nc->link_down)
+    if (nc->link_down) {
         n->status &= ~VIRTIO_NET_S_LINK_UP;
-    else
+    } else {
         n->status |= VIRTIO_NET_S_LINK_UP;
+    }
 
-    if (n->status != old_status)
+    if (n->status != old_status) {
         virtio_notify_config(vdev);
+    }
 
     virtio_net_set_status(vdev, vdev->status);
 }
@@ -319,7 +321,8 @@ static void rxfilter_notify(NetClientState *nc)
     if (nc->rxfilter_notify_enabled) {
         gchar *path = object_get_canonical_path(OBJECT(n->qdev));
         qapi_event_send_nic_rx_filter_changed(!!n->netclient_name,
-                                              n->netclient_name, path, &error_abort);
+                                              n->netclient_name,
+                                              path, &error_abort);
         g_free(path);
 
         /* disable event notification to avoid events flooding */
@@ -459,8 +462,9 @@ static int peer_has_vnet_hdr(VirtIONet *n)
 
 static int peer_has_ufo(VirtIONet *n)
 {
-    if (!peer_has_vnet_hdr(n))
+    if (!peer_has_vnet_hdr(n)) {
         return 0;
+    }
 
     n->has_ufo = qemu_has_ufo(qemu_get_queue(n->nic)->peer);
 
@@ -847,15 +851,17 @@ static int virtio_net_handle_vlan_table(VirtIONet *n, uint8_t cmd,
         return VIRTIO_NET_ERR;
     }
 
-    if (vid >= MAX_VLAN)
+    if (vid >= MAX_VLAN) {
         return VIRTIO_NET_ERR;
+    }
 
-    if (cmd == VIRTIO_NET_CTRL_VLAN_ADD)
+    if (cmd == VIRTIO_NET_CTRL_VLAN_ADD) {
         n->vlans[vid >> 5] |= (1U << (vid & 0x1f));
-    else if (cmd == VIRTIO_NET_CTRL_VLAN_DEL)
+    } else if (cmd == VIRTIO_NET_CTRL_VLAN_DEL) {
         n->vlans[vid >> 5] &= ~(1U << (vid & 0x1f));
-    else
+    } else {
         return VIRTIO_NET_ERR;
+    }
 
     rxfilter_notify(nc);
 
@@ -938,7 +944,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup(elem->out_sg,
+                              sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
@@ -1086,18 +1093,21 @@ static int receive_filter(VirtIONet *n, const uint8_t *buf, int size)
     uint8_t *ptr = (uint8_t *)buf;
     int i;
 
-    if (n->promisc)
+    if (n->promisc) {
         return 1;
+    }
 
     ptr += n->host_hdr_len;
 
     if (!memcmp(&ptr[12], vlan, sizeof(vlan))) {
         int vid = lduw_be_p(ptr + 14) & 0xfff;
-        if (!(n->vlans[vid >> 5] & (1U << (vid & 0x1f))))
+        if (!(n->vlans[vid >> 5] & (1U << (vid & 0x1f)))) {
             return 0;
+        }
     }
 
-    if (ptr[0] & 1) { // multicast
+    if (ptr[0] & 1) {
+        /* multicast */
         if (!memcmp(ptr, bcast, sizeof(bcast))) {
             return !n->nobcast;
         } else if (n->nomulti) {
@@ -1111,7 +1121,8 @@ static int receive_filter(VirtIONet *n, const uint8_t *buf, int size)
                 return 1;
             }
         }
-    } else { // unicast
+    } else {
+        /* unicast */
         if (n->nouni) {
             return 0;
         } else if (n->alluni || n->mac_table.uni_overflow) {
@@ -1150,8 +1161,9 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
         return 0;
     }
 
-    if (!receive_filter(n, buf, size))
+    if (!receive_filter(n, buf, size)) {
         return size;
+    }
 
     offset = i = 0;
 
@@ -1283,7 +1295,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
     for (;;) {
         ssize_t ret;
         unsigned int out_num;
-        struct iovec sg[VIRTQUEUE_MAX_SIZE], sg2[VIRTQUEUE_MAX_SIZE + 1], *out_sg;
+        struct iovec sg[VIRTQUEUE_MAX_SIZE], sg2[VIRTQUEUE_MAX_SIZE + 1],
+               *out_sg;
         struct virtio_net_hdr_mrg_rxbuf mhdr;
 
         elem = virtqueue_pop(q->tx_vq, sizeof(VirtQueueElement));
@@ -1317,10 +1330,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
                                    n->guest_hdr_len, -1);
                 if (out_num == VIRTQUEUE_MAX_SIZE) {
                     goto drop;
-		}
+                }
                 out_num += 1;
                 out_sg = sg2;
-	    }
+            }
         }
         /*
          * If host wants to see the guest header as is, we can
@@ -1384,7 +1397,7 @@ static void virtio_net_handle_tx_timer(VirtIODevice *vdev, VirtQueue *vq)
         }
     } else {
         timer_mod(q->tx_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
         q->tx_waiting = 1;
         virtio_queue_set_notification(vq, 0);
     }
-- 
2.7.4





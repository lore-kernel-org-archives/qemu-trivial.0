Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyR-0004Kj-R8
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyL-00049J-44
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyG-0006q1-RI
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxy-0006ke-TE; Sun, 24 Aug 2014 09:36:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A91B44A06;
	Sun, 24 Aug 2014 17:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id ED8876EF;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30093 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:31:02 +0400
Message-Id: <1408887062-30022-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Ben Draper <ben@xrsa.net>, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 11/11] vmxnet3: Pad short frames to minimum
	size (60 bytes)
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:46 -0000

From: Ben Draper <ben@xrsa.net>

When running VMware ESXi under qemu-kvm the guest discards frames
that are too short. Short ARP Requests will be dropped, this prevents
guests on the same bridge as VMware ESXi from communicating. This patch
simply adds the padding on the network device itself.

Signed-off-by: Ben Draper <ben@xrsa.net>
Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/vmxnet3.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 791321f..f246fa1 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -34,6 +34,7 @@
 
 #define PCI_DEVICE_ID_VMWARE_VMXNET3_REVISION 0x1
 #define VMXNET3_MSIX_BAR_SIZE 0x2000
+#define MIN_BUF_SIZE 60
 
 #define VMXNET3_BAR0_IDX      (0)
 #define VMXNET3_BAR1_IDX      (1)
@@ -1871,12 +1872,21 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     VMXNET3State *s = qemu_get_nic_opaque(nc);
     size_t bytes_indicated;
+    uint8_t min_buf[MIN_BUF_SIZE];
 
     if (!vmxnet3_can_receive(nc)) {
         VMW_PKPRN("Cannot receive now");
         return -1;
     }
 
+    /* Pad to minimum Ethernet frame length */
+    if (size < sizeof(min_buf)) {
+        memcpy(min_buf, buf, size);
+        memset(&min_buf[size], 0, sizeof(min_buf) - size);
+        buf = min_buf;
+        size = sizeof(min_buf);
+    }
+
     if (s->peer_has_vhdr) {
         vmxnet_rx_pkt_set_vhdr(s->rx_pkt, (struct virtio_net_hdr *)buf);
         buf += sizeof(struct virtio_net_hdr);
-- 
1.7.10.4



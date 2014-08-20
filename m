Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XK6Dk-0000j1-2Q
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 09:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ben@xrsa.net>) id 1XK4zd-000067-Q8
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 08:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ben@xrsa.net>) id 1XK4zX-0007y4-Hn
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 08:27:57 -0400
Received: from mail-we0-f181.google.com ([74.125.82.181]:42736)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <ben@xrsa.net>)
	id 1XK4zX-0007xQ-CX
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 08:27:51 -0400
Received: by mail-we0-f181.google.com with SMTP id k48so7685135wev.26
	for <qemu-trivial@nongnu.org>; Wed, 20 Aug 2014 05:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uJFLlPT8Ie/vN+INepjx/BUsmNNjAzavPwu1mQOMi5o=;
	b=krZRaG4geK3m0lyefgjGawBZtOq32t7pyZpF1hshIC06rVpxNDh02RljHwIBJADmGs
	OyX6W6s0qhKe94b8PodU8pa6uPg0S/ggkWvpeLvTXrBTT1BGZmusOG2fg31asMw6UNKh
	2TT/fO+ohhYb4bK3B1V+WZd4vyS0MUWd6VhLui22QCjof/o5GIMzxeBoiduFnNlCUlMj
	SVaTRjr7K16Wi+m5RWw6rUTCUV1x6A6xunvWs1zBGrfrNEnY6WpMqFXaaUVS9uiJBQvI
	XOSRwaIiHEuJXEG18HNiFHvwQ0Ll7OArzYmXg1b0+WgiTl0NANitXd1fK1Zx9RuKHcAw
	+PIw==
X-Gm-Message-State: ALoCoQldQKfK641KySpt4jCbVqEOfqky5gtSQK2dLglKS7qXkc+ejfh/E5IUKXbpQAVAPpljakG3
X-Received: by 10.194.179.197 with SMTP id di5mr11344625wjc.125.1408537670359; 
	Wed, 20 Aug 2014 05:27:50 -0700 (PDT)
Received: from bdraper-ws.timicogroup.local (hq.timico.net. [195.54.227.88])
	by mx.google.com with ESMTPSA id mx10sm8856900wib.1.2014.08.20.05.27.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Aug 2014 05:27:49 -0700 (PDT)
From: Ben Draper <ben@xrsa.net>
To: qemu-devel@nongnu.org
Date: Wed, 20 Aug 2014 13:27:14 +0100
Message-Id: <1408537634-3812-1-git-send-email-ben@xrsa.net>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.181
X-Mailman-Approved-At: Wed, 20 Aug 2014 09:46:35 -0400
Cc: qemu-trivial@nongnu.org, Ben Draper <ben@xrsa.net>, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] vmxnet3: Pad short frames to minimum size
	(60 bytes)
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
X-List-Received-Date: Wed, 20 Aug 2014 12:28:04 -0000

When running VMware ESXi under qemu-kvm the guest discards frames
that are too short. Short ARP Requests will be dropped, this prevents
guests on the same bridge as VMware ESXi from communicating. This patch
simply adds the padding on the network device itself.

Signed-off-by: Ben Draper <ben@xrsa.net>
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



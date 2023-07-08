Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qI0GC-0006NI-On
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jul 2023 01:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G1-0006HD-Tm; Sat, 08 Jul 2023 01:13:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G0-0001lD-9r; Sat, 08 Jul 2023 01:13:21 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 10EA312685;
 Sat,  8 Jul 2023 08:13:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 316A9139D3;
 Sat,  8 Jul 2023 08:13:05 +0300 (MSK)
Received: (nullmailer pid 3229994 invoked by uid 1000);
 Sat, 08 Jul 2023 05:13:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Hawkins Jiawei <yin31149@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 06/10] vdpa: Sort vdpa_feature_bits array alphabetically
Date: Sat,  8 Jul 2023 08:12:46 +0300
Message-Id: <2875a0ca021817b7006e6b9215ce31daa33c06f7.1688793073.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1688793073.git.mjt@tls.msk.ru>
References: <cover.1688793073.git.mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Jul 2023 05:13:29 -0000

From: Hawkins Jiawei <yin31149@gmail.com>

This patch sorts the vdpa_feature_bits array
alphabetically in ascending order to avoid future duplicates.

Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/vhost-vdpa.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 0479988a79..c0e93ce568 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -50,38 +50,45 @@ typedef struct VhostVDPAState {
     bool started;
 } VhostVDPAState;
 
+/*
+ * The array is sorted alphabetically in ascending order,
+ * with the exception of VHOST_INVALID_FEATURE_BIT,
+ * which should always be the last entry.
+ */
 const int vdpa_feature_bits[] = {
-    VIRTIO_F_NOTIFY_ON_EMPTY,
-    VIRTIO_RING_F_INDIRECT_DESC,
-    VIRTIO_RING_F_EVENT_IDX,
     VIRTIO_F_ANY_LAYOUT,
+    VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_F_VERSION_1,
     VIRTIO_NET_F_CSUM,
-    VIRTIO_NET_F_GUEST_CSUM,
     VIRTIO_NET_F_CTRL_GUEST_OFFLOADS,
+    VIRTIO_NET_F_CTRL_MAC_ADDR,
+    VIRTIO_NET_F_CTRL_RX,
+    VIRTIO_NET_F_CTRL_RX_EXTRA,
+    VIRTIO_NET_F_CTRL_VLAN,
+    VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_NET_F_GSO,
+    VIRTIO_NET_F_GUEST_CSUM,
+    VIRTIO_NET_F_GUEST_ECN,
     VIRTIO_NET_F_GUEST_TSO4,
     VIRTIO_NET_F_GUEST_TSO6,
-    VIRTIO_NET_F_GUEST_ECN,
     VIRTIO_NET_F_GUEST_UFO,
+    VIRTIO_NET_F_HASH_REPORT,
+    VIRTIO_NET_F_HOST_ECN,
     VIRTIO_NET_F_HOST_TSO4,
     VIRTIO_NET_F_HOST_TSO6,
-    VIRTIO_NET_F_HOST_ECN,
     VIRTIO_NET_F_HOST_UFO,
+    VIRTIO_NET_F_MQ,
     VIRTIO_NET_F_MRG_RXBUF,
     VIRTIO_NET_F_MTU,
-    VIRTIO_NET_F_CTRL_RX,
-    VIRTIO_NET_F_CTRL_RX_EXTRA,
-    VIRTIO_NET_F_CTRL_VLAN,
-    VIRTIO_NET_F_CTRL_MAC_ADDR,
-    VIRTIO_NET_F_MQ,
-    VIRTIO_NET_F_CTRL_VQ,
-    VIRTIO_F_IOMMU_PLATFORM,
-    VIRTIO_F_RING_PACKED,
-    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_RSS,
-    VIRTIO_NET_F_HASH_REPORT,
     VIRTIO_NET_F_STATUS,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_RING_F_INDIRECT_DESC,
+
+    /* VHOST_INVALID_FEATURE_BIT should always be the last entry */
     VHOST_INVALID_FEATURE_BIT
 };
 
-- 
2.39.2


